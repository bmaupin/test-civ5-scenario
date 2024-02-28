# Troubleshooting

#### Game text showing up as `TXT_KEY_...` in game

Before adding any text keys, first make sure they don't already exist in the game. Just do a grep, e.g.

```
$ grep TXT_KEY_CITY_NAME_WARSAW -r ~/.local/share/Steam/steamapps/common/Sid\ Meier\'s\ Civilization\ V
```
