#!/usr/bin/env bash

game_directory="/home/$USER/.local/share/Steam/steamapps/common/Sid Meier's Civilization V"

echo "Getting all response types ..."
response_types=$(grep -h '<ResponseType>' "$game_directory" -r | sed -r 's/\s*<ResponseType>(.*)<\/ResponseType>/\1/' | sort -u)

# Not needed; apparently all response types are in the DLL files (except RESPONSE_SUSPECT_YOU_OF_SPYING which is linked to an existing Response anyway)
# echo "Pruning response types ..."
# for response_type in $response_types; do
#     found="false"
#     for dll_file in "libCvGameCoreDLL.so" "libCvGameCoreDLL_Expansion1.so" "libCvGameCoreDLL_Expansion2.so"; do
#         # TODO: grep
#         if strings "${game_directory}/$(echo "${dll_file}" | tr -d ' ')" | grep -q -w "$response_type"; then
#             # echo "$response_type found"
#             found="true"
#             break
#         fi
#     done
#     if [ $found != "true" ]; then
#         echo "$response_type not found"
#     fi
# done

echo "Getting response type files ..."
response_type_files=$(grep -l '<ResponseType>' "$game_directory" -r | sort)

echo -e "Checking for missing response text ...\n"
# Override IFS (internal field separator) in order to handle files with spaces in name
original_IFS="$IFS"
IFS=$'\n'
for response_type in $response_types; do
    response_txt_key_found=false
    response_text_found=false
    # echo "$response_type"
    for response_type_file in $response_type_files; do
        # Get the matching Response text key for the ResponseType for the generic leader
        generic_response_txt_key=$(yq ".GameData.Diplomacy_Responses.Row[] | select(.+@LeaderType == \"GENERIC\") | select (.ResponseType == \"${response_type}\").Response" "$response_type_file" | sed 's/%$//')
        if [[ -n $generic_response_txt_key ]]; then
            # echo "$generic_response_txt_key"
            for dialogue_file in "./steamassets/assets/dlc/expansion2/gameplay/xml/text/en_us/leaderdialog/civ5_dialog__generic.xml" "./steamassets/assets/dlc/expansion/gameplay/xml/text/en_us/leaderdialog/civ5_dialog__generic.xml" "./steamassets/assets/gameplay/xml/newtext/en_us/leaderdialog/civ5_dialog__generic.xml"; do
                if grep -q "$generic_response_txt_key" "${game_directory}/$(echo "${dialogue_file}" | tr -d ' ')"; then
                    # echo "found in ${dialogue_file}"
                    response_text_found=true
                    # If we've found response text we don't need to check any more dialogue files
                    break
                fi
            done
            response_txt_key_found=true
            # If we've found the text key, no need to check any more response type files
            break
        fi
    done
    if [[ "$response_txt_key_found" == false ]]; then
        echo "No response text key found for ${response_type}"
    elif [[ "$response_text_found" == false ]]; then
        echo "No response text found for ${generic_response_txt_key}"
    fi
done
IFS="$original_IFS"