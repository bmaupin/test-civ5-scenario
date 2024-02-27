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

#### Create custom civilisation icon

1. Download image you want to make icon from

1. Download icon template from here: https://forums.civfanatics.com/threads/civilization-icon-template.534796/

1. Open with GIMP

1. Hide all but the background colour layer

1. Copy background colour of source image

1. Fill background colour in template with background colour of source image

1. Go back to source image

1. Replace background colour with transparency

   1. Select the background colour with the colour picker tool

   1. _Colors_ > _Color to Alpha_

1. Select a rectangular portion of the source image and copy it

1. Paste into the template

   1. _Edit_ > _Paste As_ > _New Layer_

1. Resize the new layer to 149 x 149

1. Centre the new layer

   1. _Tools_ > _Transform Tools_ > _Align_

   1. In the left Align pane: _Relative to_ > _Image_

   1. Select the layer

   1. Click the button to centre horizontally, and the button to centre vertically

1. Resize oversized layers

   1. One of the layers is bigger than the image. Select it and then select _Layer_ > _Crop to Selection_. Otherwise the exported image will exceed the image bounds.

1. Remove full white layer and gradient layer with black circle

   - I'm not sure what the full white layer is for

   - The gradient layer with the black circle applies a gradient to the outer ring, which seems unnecesssary

1. Add transparency to the background layer

   I'm not sure if or why this is necesary, but doing this allowed the game to add the ring around the outside of the icon like it does for other civs

   1. Select the background layer

   1. Do a circle select

   1. Inverse the selection

   1. Press Delete to delete everything outside the selection

1. Create a new layer group

   💡 For a simpler solution, just do _Image_ > _Flatten Image_

   ⓘ For whatever reason, when exporting images as DDS, only the selected layer gets exported. This moves all the layers we want into a group so they can all be exported.

   1. _Layer_ > _New Layer Group_

   1. In the layers panel on the right, drag each layer you want in the final image, starting from the bottom-most layer (this will ensure proper order)

1. Save the template as a new file

1. See below to use the custom image

#### Use custom image

1. Resize as appropriate; see here: https://forums.civfanatics.com/threads/icon-and-screen-pixel-dimension-reference.499400/

   ⓘ Many images (e.g. civilisation icons) require multiple image sizes. Make sure to export them all.

1. Save as DDS

   1. _File_ > _Export As_

   1. Use the extension to `.dds` when saving

   1. _Format_ > _RGBA8_

   1. _Compression_> _DXT5_

1. Import into ModBuddy

   1. Right-click in the project > _Add_ > _Existing Item_

   1. Click on the `.dds` file and in the _Properties_ pane set _Import into VFS_ to _True_ (this must be done for all images)

      ⚠️ If you forget this part, you will get an error: "Unable to load texture"

## Troubleshooting

#### Game text showing up as `TXT_KEY_...` in game

Before adding any text keys, first make sure they don't already exist in the game. Just do a grep, e.g.

```
$ grep TXT_KEY_CITY_NAME_WARSAW -r ~/.local/share/Steam/steamapps/common/Sid\ Meier\'s\ Civilization\ V
```
