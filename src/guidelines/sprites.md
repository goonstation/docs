# Goonstation Spriting Guidelines

## Spriting for Goonstation 🐝

So, you want to contribute sprite art to Goonstation. Great! This set of guidelines details what's generally expected out of sprite contributions for Goonstation, and aims to provide helpful advice on the implementation and creation of sprites. As a disclaimer, this isn't a guide on 'How All Good Pixel Art Should Be Drawn', it's how sprites contributed specifically to Goonstation should be drawn.

## What Program Should I use? 🖥️

* Programs for making sprite are preference, and using better programs will for the most part make spriting *faster* rather than *better*. The most essential feature is a 1px size pencil tool, and beyond that layers and fill buckets are incredibly useful. 

* The Byond sprite editor is usable but doesn't have layers and can be pretty clunky. Some free editors include piskel, paint.net, and GIMP. Aseprite is also good and free if compiled yourself, it otherwise costs money. Even photoshop can be used if you're already comfortable with it. 

## Human Base 🧍
![](https://i.imgur.com/L1qXFuB.png)

* The above human base is useful for drawing clothing items or in-hands by layering them over the base to ensure sprites line-up.
## Basic Style 😎

### Perspective ⬜

* Sprites should generally be in three-quarter perspective (3/4 perspective for short), with few exceptions. 3/4 perspective essentially means that objects have one face and the top visible, facing head on. This includes item sprites for most cases.

![](https://i.imgur.com/8TEclNH.png)

* Avoid cabinet projection, where sprites are tilted, with their side visible.

* Further examples [here](https://i.imgur.com/tU8mmeR.png).

### Colors 🎨

* Keep color palettes small and generally higher-contrast when possible. If an existing item is similar to your sprite, for example if it contains matching departmental colors, pull palettes from existing sprites to maintain consistency.

![](https://i.imgur.com/MquHC45.png)

* Avoid low contrast palettes or palettes with unnecessarily large amounts of colors, they make sprites look muddier and less clean. A lot can be done with a little if you use a good color palette.

* Hue shift your shadows and highlights. Hue shifting is when you linearly change the hue of colors in a color scheme based on their value. A basic example of that would be darker colors getting bluer as they get darker, and lighter colors being slightly more yellow. You want this effect to be subtle, but still have an impact. Useful tutorial [here](https://i.imgur.com/fsTkpWQ.gif). Examples:
    ![](http://i.imgur.com/9iGrBo9.png) <-- Bad
    ![](http://i.imgur.com/gB8u1zp.png) <-- Good

* Consider using the palette provided here if you're having trouble creating a palette: 

![](https://i.imgur.com/oHMg5gg.png)

### Outlines 🖋

* All sprites should make use of colored outlines. This means that sprites should have outlines consisting of darker shades of the colors it connects to, instead of having a single color outline. 

![](https://i.imgur.com/ymhWAP2.png)

* Outlines should also be subject to the shading on the sprite, getting darker in darker parts of the sprites and lighter when outlining lighter parts.

### In-hand Sprites ✋

* In-hand sprites are sprites that appear over character sprites when they're holding an item. Unique in hand sprites are encouraged for every new item, this is especially true for items that need to be visually identified in combat.

* For one-handed items, you'll need 8 total in-hand sprites, four for each cardinal direction for both hands. For two-handed items, you'll only need four. An example of in-hand sprites overlaid on the human sprite:

![](https://i.imgur.com/3HMGXsN.png)

* The finished sprites should just be on their own though, so they're more like this:

![](https://i.imgur.com/450lqQX.png)

### Other Details 👁️

* Referencing popular culture is allowed, but try to be subtle about it. Commonly available content should be original. 🍰 
* Sprites should generally be centered on the middle of the canvas, especially if you can pick them up. 
* Keep the use of your sprite in-game in mind, it’s difficult and frustrating to click tiny sprites or sprites with 1px holes in them.
    * To fix this, add an almost fully transparent pixel in the gap. These are useful when you want something to be fully transparent, but still click-able.
* Try to keep scale in mind in general. Things don’t need to be actually proportional, they just need to “feel” right in the game.  ↕️ 
* It’s good (but not mandated) to distinguish different objects by more than just color if possible, to accommodate the colorblind. 🚥
* Avoid violently flashing lights in large spaces when making animations.
* If you just shrink a jpeg and submit that, you're fired. ![](https://wiki.ss13.co/images/a/af/FoodPancakes.png)

## Implementation 🔧

* Sprites in Byond are kept in **.dmi files**, which are essentially modified .png files. You can find these files in the code in the 'icons' folder.

* These files are made up of various named sprites called 'icon_states'. These names are used in code, and should be kept simple but descriptive.

![](https://i.imgur.com/dlRyBOZ.png)

* If an existing .dmi file is suitable for your sprite, use that instead of making a new one.

* For sprites larger than 32x32, use the designated `widthXheight` files (ex: 120x120).

![](https://i.imgur.com/QeOiR96.png)


## Meta 🗨️ 
* Do not be precious about your work. Be open to criticism and change both from other developers and players. 
* Most untrained people can visually identify when something looks wrong or bad, it's your responsibility as the artist to parse that criticism and find a solution. 
* If you'd like more feedback on your sprites or pointers on spriting, check out the #imspriter channel on the [Goonstation discord.](https://discord.gg/zd8t6pY)
