# Prefabs and Random Rooms

*By Sord. Originally published on [HackMD](https://hackmd.io/@Sord/rkvO6Ne3j).*

This guide is going to be the complete version of any randomly generated prefabs or random rooms for Goonstation.

Goonstation holds a number of features allowing the random spawning of premade creations. There are prefabs in space, in the trench, and (WIP) terrestrial prefabs. There are also random rooms on the stations themselves. This guide will inform you the proper way to go about creating these prefabs, as well as have some useful tips on what to include in them.

## Before we get started
This guide assumes you have already completed setting up a local copy of the Goonstation codebase. If you haven't done this, follow the [Development Guide](../getting-started/development-guide.md) to set that up, then come back to this guide.

This guide also assumes you have a mapping program installed and ready to use. We recommend StrongDMM V2

## Overall design principles
All random generated maps (prefabs, random rooms, etc) should follow these principles to be considered for merging:
* Avoid placing very rare or powerful items as loot. This includes existing azone loot.
* Ensure your map is saved using the TGM format.
* Test your map thoroughly before submitting, looking for things such as lighting, power, correct area placement, etc

This is not an exhaustive list, all types of random generated maps will have their own principles as well.


## Prefabs
Prefabs come in a variety of shapes and sizes, and also locations to find them. Prefabs are larger than random rooms and can be filled with even more threats and loot opportunities.

### Space Prefabs
Space Prefabs can be themed just about anything! Space prefabs can be found, obviously, in space. They are located in what we call the Mining Zlevel, or Z5, which holds the Mining Outpost.

Some examples we have are:
* The Silverglass Platform, a prefab with a secret past that was destroyed in some ill-advised experiment.
* Bee Sanctuary. Simple bee habitat, or something more sinister?
* Space Casino. Shiny, glittery, with a chance for some real nice loot if your luck plays out well.

### Trench Prefabs
Trench Prefabs are typically similar to Space Prefabs, but typically also include drainage for water or additional acid protection. Trench prefabs are located on Oshan and also sometimes Nadir. A trench prefab might work for one map, but not the other, or it might work for both! 

Some examples of trench prefabs are:
* The Racetrack. The racetrack holds some unique parts for your submarines to change how they behave, but also some hidden threats!
* Dank Trench. Also known as the Marijuana Trench, it is a quaint hidden growery for the devil's lettuce, with a possible hidden past.
* Robot Factory, a prefab with strange robot parts strewn about and hostile bots and drones. Who knows what might happen if you assembled a robot with some of these strange parts...

### Terrestrial Prefabs
Terrestrial Prefabs are much more unique. Terrestrial are for the currently WIP Artemis mode, but can also be used in current normal rounds by admins who use the Terrainify or Generate Planet commands! They can be anything from small outposts or shacks to large fortified defensive positions. Spooky haunted houses? Self contained planetary resorts? Anything and everything can fit within a terrestrial prefab.

Examples:
* Beer Cave. A small rocky cave filled with beer
* Illegal Still. An illicit distillery setup within a rocky crevice
* Supply Outpost Defended. An outpost with strong defenses

### Getting started with prefabs
#### Creating the map file
First we're going to create the map file of your prefab. In your map editor of choice, we want to create a new map. Open the environment (`goonstation.dme`), and then go to create a new map. On StrongDMM V2 (the recommended mapping software), you will be presented with four settings we can adjust for our prefab.

- `Width (X)` - How wide the map file is
- `Height (Y)` - How tall the map file is
- `Levels (Z)` - For the sake of simplicity, we want this to be `1`
- `Format` - The format the map file will be saved in. We want this to be `TGM`

Next you hit "Create" and you will be presented with a prompt asking you where you want to save the file. Where you save the file is dependent on where the prefab will be located in the game.

* For Z5 (the random generated mining zlevel) in space, the path is `assets\maps\prefabs\space`

* For Z5 on ocean based maps (AKA the trench), the path is `assets\maps\prefabs\underwater`

* For planetary prefabs, the path is `assets\maps\prefabs\planet`

There are a couple other folders, but unless you know what you're doing you're not going to add a prefab there.

Save your map to the folder you want your prefab to show up in.

### Adding the code
Unlike Random Rooms, prefabs do require a small amount of code editing to implement into the game. Don't worry, though, it's very simple and most of it can be copy pasted. The code for prefabs exists in the "location" the prefab will exist in. 

* For Z5 (the random generated mining zlevel) in space, the file is `code\modules\worldgen\prefab\mining\mining.dm`

* For Z5 on ocean based maps (AKA the trench), the file is `code\modules\worldgen\prefab\mining\underwater.dm`

* For planetary prefabs, the file is `code\modules\worldgen\prefab\mining\planet.dm`

Once you want to create a prefab we need to add the code portion so it can be generated into the game. Open the file of your choice for your prefab, and we're going to skip past the initial code and right until you see the first actual prefabs. For this guide I'll be in `mining.dm`. The first prefab is "clown", which is indented once. After that, and another indentation, is the code required for your prefab to be placed into the game world correctly. Each variable will be explained here for clarity. 

> [!IMPORTANT]
> Capitalization matters in variable names!

- `clown` - the name of your prefab
- `maxNum = 1` - How many of this prefab can be generated, this is typically `1`
- `probability = 25` - What is the weight that this will be generated into the mining map. 100 means it will always be generated. Most prefabs exist within the 5 to 25 range.
- `prefabPath = "assets/maps/prefabs/space/prefab_clown.dmm"` - The exact path of the map file of your prefab. Your prefab should be placed in the proper folder for whatever map type it is generated in.
- `prefabSizeX = 5` - The width of your prefab. Prefabs should generally be well trimmed and not have too much dead space around the sides of the map. See: other existing prefabs
- `prefabSizeY = 5` - The height of your prefab.

For your prefab you can copy paste the code from another prefab then edit it to fit. If you do this, be sure you change every variable to what fits your prefab.


Next we want to make an "area" for our prefab. Open up the `code\area.dm` file and search for `/area/prefab`. You should be at the section of `area.dm` laid out for prefabs. The base prefab type is `/area/prefab` with some variables after it. There are more variables that can be assigned to an area but the three listed are the most important for a prefab.

- `/area/prefab` - The type path for your prefab. Your prefab would be `/area/prefab/yourprefabnamehere`
- `name = "Prefab"` - The in-game name of your prefab area. This typically can show up in alerts such as Death Alerts. If your prefab was named `Workshop` the alert would look like: "John Pubbie has died in Workshop."
- `icon_state = "orange"` - What icon and/or color your area has on the map editor (and only on the map editor). It's fine to leave this default or you can change it to a primary color or any other icon in `areas.dmi`
- `requires_power = FALSE` - Does your prefab require a working APC to provide power? `FALSE` means you don't need an APC and things will be powered by... magic. `TRUE` means your area will require an APC to provide power. If you plan on making a power setup for your prefab you will want this to be `TRUE`

### The mapping itself
Now comes the fun part; creating the map itself as your vision dictates. Prefabs offer a lot more room for creativity than random rooms, but do require a little more effort to be put into the creation. For guidelines or principles on what prefabs should have, scroll down to the "Prefab design principles" section of the guide.

A couple things to note:
* There are some areas/turfs you should use to fill in deadspace
- `/area/allowGenerate` - This will let the game generate things around your prefab. Use this area in the deadspace around your prefab. On space maps asteroids could be generated in this area, or on planets decorative items or mountains could be generated in this area.
- `/area/noGenerate` - This will block generation of stuff around your prefab. You can also use this as the main area within your prefab if you don't have one defined. Example of prefab without defined area: `prefab_planet_illegal_still.dmm`
- `/turf/variableTurf/clear` - This will allow the game to generate turf around the prefab. Best used on planetary prefabs so the ground is consistent
- `/turf/variableTurf/wall` - This will use the local walls the game generates in the prefab placement area. For example, if on a planet that has rock walls it will use those same rock walls in the prefab.
- `/turf/variableTurf/floor` - Same as wall, but for floors.
* You can create multiple areas for a single prefab.

#### Testing your prefab
Testing your prefab should involve making sure everything is set properly and shows up as intended. The easiest way to get your prefab to load into the game is to go into the code and set the `probability` variable to `100` so it will always show up in game. If your prefab area name is set you can use `jump areaname` to teleport directly there.

Things to look for when testing your prefab:
* Area properly applied
* Any deadspace should be filled with the appropriate variableturfs and/or area generation and work properly
* If your area requires power, power should properly be set up with APCs and, if intended, ways to restore power to the APC such as furnaces or solars.
* Lighting should be as intended
* Any special locked doors or other items should be usable as intended
* Map size is trimmed as needed. If your prefab only takes up a 10x10 space your map size should not be 20x20

### Prefab design principles
For a prefab to be accepted into the game, it must adhere to a few principles:

A prefab creator should:
* Ensure a prefab is ready to be accepted into the game in its current state.
* Ensure the prefab fits into the game world


## Random Rooms
Random rooms are one of the simplest ways to get started mapping for Goonstation. They're small, bite sized maps that can still be filled with lore or environmental storytelling.

### Getting started with random rooms
Creating is as simple as creating a new map file in the size room you want. Example would be 3x3, 3x5, or 5x3, the current existing random room sizes.

Next you name the file using the following naming system: `roomname_###.dmm`

The ### signs can be replaced, or omitted, with numbers to change the rooms spawn weight. The default weight is 100 and does not need to be defined.
- Example: yourroomnamehere_75.dmm would mean your room has a lower chance than normal to spawn
- Example 2: yourroomnamehere.dmm would have the default chance to be spawned as it does not have a differing weight defined.

Now you'd begin mapping your random room out to your heart's desire.

The next step is to ensure you place down the following area on your room, covering it entirely: `/area/dmm_suit/clear_area`

This area ensures it does not clear the area of the station it is spawning it so it is powered and is labeled correctly in the station.

Lastly you would place the random room file in the appropriate subfolder for the size category it is in. Random rooms are currently stored in the `/assets/maps/random_rooms` folder.

### Testing your room
Spawning your room in to ensure everything is the way you want it can be done easily. On your own local server, as admin, use the Build Mode "Load Area" tool and select the **bottom left** tile of the space you are spawning the room in. Then simply navigate to where your room is located and it will spawn in.

### Room design principles
For a random room to be accepted into the pool for the game to choose from, it must adhere to the following principles. While certain rooms may break these principles, a room that does so should be rare and not seen often.

A random room creator should:
* Avoid placing dense objects or wall mounted objects in the four main cardinal directions, as this is where doors to access the rooms typically are.
* Make the room seem like it's something that could have been created by the crew during a normal shift, hidden in maintenence. This means it shouldn't look too out of place on the station.
* Ensure the room is lit as desired. Having no lighting is perfectly fine, but if you want a room to be well lit make sure you have enough lighting.
* Use the appropriate spawn weight for what your room contains. As a rule of thumb, no rooms should go over 100 spawn weight. Rooms that contain semi-rare or very useful items (Such as insulated glove spawns or harder to find station weapons) should have lower weights. Additionally, rooms that seem out of place in maintenance (Example: tree_80.dmm) should have lower spawn weights as well.
* Not include a changelog entry for the random room(s) pull request.
