Just a place to track what's been done so far in this scenario, for my own personal reference:

#### Create map

1. Get an idea of area I want in map from Google Maps, take screenshot

1. Install [Yet (not) Another Earth Maps Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=77138438) mod

1. Start Civ 5 so files from mod get downloaded

1. Open biggest Europe map

1. Crop to area from Google Maps

1. Install Ukraine, Russia, Belarus mods

1. Add Civs to map in _Scenario Editor_

1. Set all map tiles to coast (for maximum contrast; maybe some kind of arctic terrain would've been better)

1. Take a screenshot of map

1. Add hex grid to Google Maps screenshot

   1. Open WorldBuilder screenshot with GIMP

   1. Set tile colour to transparent so we're just left with the hex grid

   1. Overlay hex grid on top of Google Maps screenshot

      1. Copy the hex grid

      1. Paste to Google Maps image

      1. Add paste as new layer

      1. Get image size

      1. Rescale hex grid to fit image using _Layer_ > _Scale Layer_

1. Set city locations

   - in a 29x29 grid (from bottom left corner)

     - Ukraine
       - Lviv: 5,13
       - Kyiv: 14,15
       - Kharkiv: 22,14
       - Odesa: 14,6
       - Donetsk: 25,9
       - Sevastopol: 18,2
     - Russia
       - Moscow: 25,27
       - Rostov-on-Don: 27,8
       - Voronezh: 27,17
       - Kursk?: 22,18
       - Krasnodar?: 27,3
     - Belarus
       - Minsk: 10,23
       - Baranavichy?: 8,21
       - Gomel?: 15,19
     - NATO
       - Warsaw (Poland):
       - Bucharest (Romania): 7,2
       - Riga (Latvia):
       - ~~Chisinău?~~ (Moldova, not part of NATO)
       - Cluj-Napoca (Romania): 4,7
       - Lublin? (Poland): 3,17
       - Bialystok? (Poland): 4,21
       - Kaunas? (Lithuania): 5,25
       - Vilnius? (Lithuania): 7,25
       - Košice? (Slovakia):
       - Varna? (Bulgaria):

1. Set game options

   - No City Razing
   - No Barbarians
   - No Ancient Ruins
   - Disable Religion

1. Set starting era for all civs to Information Era

1. Set Ukraine at war with Russia

1. Set start year to 2022

1. Disable Time, Science, Cultural victories

1. Create custom civ and leader (see below)

1. Create custom leader image (see below)

#### Create custom civ, leader, etc

See [Modders Guide to Civilization V](https://forums.civfanatics.com/threads/modders-guide-to-civilization-v.385009/)

## Troubleshooting

#### Game text showing up as `TXT_KEY_...` in game

Before adding any text keys, first make sure they don't already exist in the game. Just do a grep, e.g.

```
$ grep TXT_KEY_CITY_NAME_WARSAW -r ~/.local/share/Steam/steamapps/common/Sid\ Meier\'s\ Civilization\ V
```
