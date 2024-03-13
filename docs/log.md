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

     ⚠️ TODO: These coordinates start with an index of 1, but I think WorldBuilder starts from 0? Double-check and update as needed.

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
       - Warsaw (Poland): 1, 19
       - Bucharest (Romania): 7,2
       - Cluj-Napoca (Romania): 4,7
       - Vilnius (Lithuania): 7,25
       - Košice (Slovakia): 11,1
       - Klaipeda (Lithuania): 27,1
       - ~~Riga (Latvia):~~
       - ~~Chisinău?~~ (Moldova, not part of NATO)
       - ~~Lublin? (Poland): 3,17~~
       - ~~Bialystok? (Poland): 4,21~~
       - ~~Kaunas? (Lithuania): 5,25~~
       - ~~Varna? (Bulgaria)~~

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

Resources:

- https://forums.civfanatics.com/threads/irkallas-firaxis-like-civilization-icon-tutorial.492821/
- https://forums.civfanatics.com/threads/civilization-icon-flag-template-svg.558760/

Specs of the Civ 5 civilisation icons:

- Size: 256 x 256
- Image contains a centred circular icon surrounded by transparency
- Outer size of icon within image: 172 x 172
- Icon has a ~4 pixel solid colour border
  - So the inner circle within the icon is about 164 x 164
- Logo/crest within inner circle should be at least 2 pixels from edge of inner circle
  - So no more than 160 x 160

1. Look at existing icons to get an idea of the end product, e.g. https://www.sporcle.com/games/milc/civ-5-civilization-icons

   1. In particular, decide the primary and secondary colours

1. Download image you want to make icon from

1. Download icon template from here: https://forums.civfanatics.com/threads/civilization-icon-template.534796/

1. Open with GIMP

1. Hide all but the background colour layer

1. Copy background colour of source image

1. Fill background colour in template with background colour of source image

   If the background is a circle:

   1. _Colors_ > _Colorize_

   1. Select the colour

   1. Set _Lightness_ to 0 or as desired

1. Go back to source image

1. Replace background colour with transparency

   1. Select the background colour with the colour picker tool

   1. _Colors_ > _Color to Alpha_

1. Select a rectangular portion of the source image and copy it

1. Paste into the template

   1. _Edit_ > _Paste As_ > _New Layer_

1. Centre the new layer

   1. If the layer is in a layer group, temporarily move it out of the layer group

   1. _Tools_ > _Transform Tools_ > _Align_

   1. In the left Align pane: _Relative to_ > _Image_

   1. Select the layer by clicking on it in the main image editing window (not the _Layers_ pane); you should see four small squares at the corners of the selection

   1. Click the button to centre horizontally, and the button to centre vertically

   1. If the layer was in a layer group, move it back into the layer group

1. Resize the new layer

   1. _Layer_ > _Scale Layer_

      The size to use will depend on the borders of the original image, but the image in the new layer should generally fill up most of the inner circle, with at least 2 pixels between the image and the edge of the inner circle on all sides

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

#### Create custom civ alpha icon

ⓘ This is used by the game to apply a civilisation's crest (the centre portion of the civ icon created above) to certain parts of the UI, such as the label of cities belonging to civilisations other than the current player.

1. Start with the civ icon created above

1. Select only the layer containing the crest (this is basically the centremost portion of the image)

1. (Optional) Make the image clearer

   1. _Colors_ > _Colorize_

   1. Set _Colour_ to white

   1. (Optional) In _Blending Options_, set _Mode_ to _Merge_ or _Normal_ to make the image clearer

1. Change the colour of the crest so that it's only white

   ⓘ Civ will change the colour dynamically to match the colours of the civilisation as needed

   1. _Colors_ > _Desaturate_ > _Color to Gray_

1. Scale the crest

   ⓘ The alpha icon size does not correspond to the exact size of the civ icon; it can be even larger than the outer circle of the civ icon

   Scale the crest so that it's up to 176 pixels width and height (within a 256x256 canvas)

1. Make sure the layer is the same size as the image

   Right-click the layer > _Layer to Image Size_

1. Resize the image to 128x128

   _Image_ > _Scale Image_

1. Make sure only the layer containing the crest is selected

1. Export the image to a DDS file; see [Use custom image](#use-custom-image)

1. In `<Civilizations>` update `AlphaIconAtlas`, e.g.

   ```xml
   <AlphaIconAtlas>NATO_CIV_ALPHA_ATLAS</AlphaIconAtlas>
   ```

1. Add the appropriate `<IconTextureAtlases>` entries for each image, e.g.

   ```xml
   	<Row>
   		<Atlas>NATO_CIV_ALPHA_ATLAS</Atlas>
   		<IconSize>128</IconSize>
   		<Filename>NATO_Alpha_128.dds</Filename>
   		<IconsPerRow>1</IconsPerRow>
   		<IconsPerColumn>1</IconsPerColumn>
   	</Row>
   ```

1. Add the images to the `.modinfo` file

#### Create custom leader icon

Resources:

- https://forums.civfanatics.com/threads/civilization-v-style-icons-with-gimp.534603/
- https://forums.civfanatics.com/threads/wodhanns-icon-graphic-tutorial.522695/

Specs of the Civ 5 civilisation icons:

- Size: 256 x 256
- Image contains a centred circular icon surrounded by transparency
- Size of circular icon within image: 172 x 172
- Image contains the top half of the leader's torso up to the top of their head
- Parts of the leader (typically the head) extend the image for flavour
  - Can extend up to 20 pixels past the circle
- Background has a sunburst style
- Leader has a glow
- Leaders are drawn in a cartoon style

1. Get the source image

1. Use the foreground selection tool to select the leader from the image

   ⓘ This is really tricky to use but works really well, be sure to read the instructions carefully: https://docs.gimp.org/en/gimp-tool-foreground-select.html

1. _Select_ > _Invert_ and then press delete to delete the background

1. Use the eraser to clean up any extra pixels that weren't deleted from the background

1. Measure from the top of the leader's head to the bottom of their chin

1. Multiply that by 2.5 to calculate the height of the image

   e.g. if the head is 216 pixels high, \* 2.5 = 540

1. Add extra pixels for the overlap

   - If they're wearing a helmet, crown, etc, add about 8%
   - Otherwise, add about 4%

   e.g. 540 \* 1.04 = 562

1. Note the X and Y coordinate of the centre of top of the head

   e.g 629, 110

1. _Image_ > _Canvas Size_ and resize image

   1. Note the original width of the image

      e.g. 1344

   1. Set the _Canvas Size_ as appropriate

      e.g. 540 x 562

   1. Click _Center_ to centre the selection
   1. Under _Offset_ Set the Y to the top of the head

      e.g. -110

   1. Adjust the X offset

      1. Take the original width of the image, divide by 2, subtract the X coordinate of the centre of the head, divide the result by 2. This is how many pixels the X offset will need to be adjusted

         e.g. 1344 / 2 - 629 = 43

      1. Now adjust the X offset by that many pixels

         e.g. -402 + 43 = -359

1. Download this icon template and open it in GIMP: https://forums.civfanatics.com/resources/sukritacts-icon-template.18528/

1. Adjust the template to work with GIMP

   I don't remember exactly what I did, it might be easiest just to copy mine from assets/NATO_Leader.xcf and use that instead

1. Copy the leader image to the icon template as a new layer and resize it, setting the width to 172 and letting the height resize automatically

1. Delete any existing layer mask from the layer group

1. Add a new layer mask to the layer group

   1. Right-click layer group > _Add Layer Mask_ > select channel _Alpha 1_ > _Add_

1. Right-click the layer mask and make sure _Edit Layer Mask_ is checked

1. Move the leader layer above the layer mask so it shows on top of the layer mask

1. Select the layer mask and make sure _Show Layer Mask_ is checked

1. Select a small paintbrush and paint white where the top of the leader's head surpasses the layer mask to extend the layer mask

1. Right-click layer mask > check _Show Layer Mask_

1. Now, select a small black brush and clean up the layer mask

1. Move the leader layer back inside the layer group to the top

#### Create leader "scene"

This is the image used for diplomacy

1. Create a 1600x900 image and save it as a DDS file

1. Create a new XML file with these contents:

   ```
   <LeaderScene FallbackImage="Leader_Scene.dds"></LeaderScene>
   ```

1. Replace `Leader_Scene.dds` with the name of the image file

1. In the leader definition, set `ArtDefineTag` to the filename of the XML file

   ```
   <ArtDefineTag>Leader_Scene.xml</ArtDefineTag>
   ```

#### Create dawn of man image

This is the image shown at the start of the game, and so it doesn't need to be created for AI-only civilisations

- Image should contain the leader, and the leader should be on the left half of the image
- Image should be 1024 x 768

#### Use custom image

1. Resize as appropriate; see here: https://forums.civfanatics.com/threads/icon-and-screen-pixel-dimension-reference.499400/

   1. Scale the image, keeping the same dimensions

      1. _Image_ > _Scale Image_

      1. Set either the _Width_ or the _Height_ to the final desired width or height, allowing the other to adjust automatically to keep the scale

   1. Crop the image

      1. _Image_ > _Canvas Size_

      1. Click the link between _Width_ and _Height_ so that changing one doesn't change the other

      1. Set the image to the exact final dimensions

      1. Click _Center_ or align the image as desired

   1. Because DDS images are exported from the selected layer and not the image, the layer needs to be resized as well

      Right-click the layer > _Layer to Image Size_

1. Save as DDS

   1. _File_ > _Export As_

   1. Use the extension to `.dds` when saving

   1. _Format_ > _RGBA8_

   1. _Compression_> _DXT5_

ⓘ If you get errors exporting the image:

1. Right-click the layer group > _Merge Layer Group_, then try exporting again

1. If it's an image that requires multiple sizes (according to the link in the first step), create the other images from the first, e.g.

   👉 This is now handled automatically by the install script

   ```
   filename=NATO_Civ_
   convert "${filename}256.dds" -resize 128x128 "${filename}128.dds"
   convert "${filename}256.dds" -resize 80x80 "${filename}80.dds"
   convert "${filename}256.dds" -resize 64x64 "${filename}64.dds"
   convert "${filename}256.dds" -resize 45x45 "${filename}45.dds"
   convert "${filename}256.dds" -resize 32x32 "${filename}32.dds"
   ```

1. Import into ModBuddy

   1. Right-click in the project > _Add_ > _Existing Item_

   1. Click on the `.dds` file and in the _Properties_ pane set _Import into VFS_ to _True_ (this must be done for all images)

      ⚠️ If you forget this part, you will get an error: "Unable to load texture"

#### Extract assets from Civ 5

This is useful to compare your assets with the ones from the game to make sure they're properly formatted

1. Download Dragon Unpacker: https://forums.civfanatics.com/threads/extracting-art-assets.536900/

1. Use Dragon Unpacker to extract the `.dds` and corresponding `-index.dds` file for the asset

1. Download CivDdsUnpacker from https://forums.civfanatics.com/threads/dds-unpacker-for-interface-textures.389316/
