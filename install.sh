#!/usr/bin/env bash

mod_name="Defence of Ukraine (v 1)"

# user_directory="/home/${USER}/.steam/steam/steamapps/compatdata/8930/pfx/drive_c/users/steamuser/Documents/My Games/Sid Meier's Civilization 5"
user_directory="/home/${USER}/.local/share/Aspyr/Sid Meier's Civilization 5"

echo "Creating smaller civ and leader images ..."
pushd src/Art/ > /dev/null
for filename in $(find . -type f -iname "*_Alpha_128.dds" | cut -c 3-); do
    civ_name=$(echo "$filename" | cut -d _ -f 1)
    convert "${civ_name}_Alpha_128.dds" -resize 64x64 "${civ_name}_Alpha_64.dds"
    convert "${civ_name}_Alpha_128.dds" -resize 48x48 "${civ_name}_Alpha_48.dds"
    convert "${civ_name}_Alpha_128.dds" -resize 32x32 "${civ_name}_Alpha_32.dds"
    convert "${civ_name}_Alpha_128.dds" -resize 24x24 "${civ_name}_Alpha_24.dds"
    convert "${civ_name}_Alpha_128.dds" -resize 16x16 "${civ_name}_Alpha_16.dds"
done

for filename in $(find . -type f -iname "*_Civ_128.dds" | cut -c 3-); do
    civ_name=$(echo "$filename" | cut -d _ -f 1)
    convert "${civ_name}_Civ_256.dds" -resize 128x128 "${civ_name}_Civ_128.dds"
    convert "${civ_name}_Civ_256.dds" -resize 80x80 "${civ_name}_Civ_80.dds"
    convert "${civ_name}_Civ_256.dds" -resize 64x64 "${civ_name}_Civ_64.dds"
    convert "${civ_name}_Civ_256.dds" -resize 45x45 "${civ_name}_Civ_45.dds"
    convert "${civ_name}_Civ_256.dds" -resize 32x32 "${civ_name}_Civ_32.dds"
done

for filename in $(find . -type f -iname "*_Leader_256.dds" | cut -c 3-); do
    civ_name=$(echo "$filename" | cut -d _ -f 1)
    convert "${civ_name}_Leader_256.dds" -resize 128x128 "${civ_name}_Leader_128.dds"
    convert "${civ_name}_Leader_256.dds" -resize 64x64 "${civ_name}_Leader_64.dds"
done
popd > /dev/null

echo "Updating mod file checksums ..."
pushd src > /dev/null
# Override IFS (internal field separator) in order to handle files with spaces in name
original_IFS="$IFS"
IFS=$'\n'
for filename in $(find . -type f | cut -c 3-); do
    new_md5sum=$(md5sum "$filename" | awk '{print $1}')
    old_md5sum=$(grep "$filename" "${mod_name}.modinfo" | awk '{print $2}' | cut -c 6- | rev | cut -c 2- | rev)
    if [[ -n $old_md5sum ]]; then
        # -r allows references like \1 to be used without escaping parenthesis
        sed -i -r "s@${old_md5sum}(.*${filename})@${new_md5sum}\1@" "${mod_name}.modinfo"
    fi
done
IFS="$original_IFS"
popd > /dev/null

echo "Copying mod files ..."
maps_directory="${user_directory}/Maps"
mod_directory="${user_directory}/MODS/$(echo "${mod_name}" | tr '[:upper:]' '[:lower:]')"

# TODO: remove this once we make the map part of the mod
cp src/Maps/Ukraine_29x29.Civ5Map "$maps_directory"

# We have to clean up the mod first because otherwise rename will fail because the files will exist
rm -rf "${mod_directory}"/*
mkdir -p "$mod_directory"
cp -r src/* "$mod_directory"
# TODO: remove this once we make the map part of the mod
rm "${mod_directory}/Maps/Ukraine_29x29.Civ5Map"
# All files have to be renamed to lower-case in Linux for it to work (https://stackoverflow.com/a/152741)
find "${mod_directory}" -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
