#!/usr/bin/env bash

mod_name="Russian invasion of Ukraine (v 1)"

# user_directory="/home/${USER}/.steam/steam/steamapps/compatdata/8930/pfx/drive_c/users/steamuser/Documents/My Games/Sid Meier's Civilization 5/"
user_directory="/home/${USER}/.local/share/Aspyr/Sid Meier's Civilization 5/"

# Update mod file checksums
pushd src > /dev/null
for filename in $(find . -type f | cut -c 3-); do
    new_md5sum=$(md5sum "$filename" | awk '{print $1}')
    old_md5sum=$(grep "$filename" ../"${mod_name}.modinfo" | awk '{print $2}' | cut -c 6- | rev | cut -c 2- | rev)
    if [[ -n $old_md5sum ]]; then
        sed -i "s/${old_md5sum}/${new_md5sum}/" ../"${mod_name}.modinfo"
    fi
done
popd > /dev/null

maps_directory="${user_directory}/Maps"
mod_directory="${user_directory}/MODS/${mod_name}"

cp src/Ukraine_29x29.Civ5Map "$maps_directory"

mkdir -p "$mod_directory"
cp -r src/* "$mod_directory"
rm "${mod_directory}/Ukraine_29x29.Civ5Map"
cp "${mod_name}.modinfo" "$mod_directory"
