# Troubleshooting

## General tips

1. Enable database validation

   1. Edit config.ini (e.g. in Linux: `~/.local/share/Aspyr/Sid Meier's Civilization 5/config.ini`)

   1. Set `ValidateGameDatabase` to `1`

1. Check logs

   e.g. in Linux: `~/.local/share/Aspyr/Sid Meier's Civilization 5/Logs`

   - Useful logs

     - Database.log
     - Lua.log
     - xml.log

## Specific issues

#### Game text showing up as `TXT_KEY_...` in game

Before adding any text keys, first make sure they don't already exist in the game. Just do a grep, e.g.

```
$ grep TXT_KEY_CITY_NAME_WARSAW -r ~/.local/share/Steam/steamapps/common/Sid\ Meier\'s\ Civilization\ V
```

#### Images not showing up in game

Make sure _Import into VFS_ is set to _True_ in ModBuddy (or `import="1"` in the `.modinfo` file)

#### Locally developed mod not showing up in Linux

Make sure the mod directory and all the files in it are lower-case. They do not have to match the case of the files in the `.modinfo` file.

#### Crash to desktop when starting a game with a custom mod

1. Make sure database validation is enabled (see above)

1. Disable all other mods and only enable the mod causing the issues

1. Check the logs, in particular the database log

#### Crash to desktop when starting a game with a custom map

1. Make sure database validation is enabled (see above)

1. Disable all mods and start a game with only the custom map

1. Check the logs, in particular the database log

Some other things to check in the map itself using WorldBuilder:

- Make sure no water tiles have forest or other land-based features
- Make sure all civilisations have starting locations
- Make sure each civilisation's capital has a Palace
