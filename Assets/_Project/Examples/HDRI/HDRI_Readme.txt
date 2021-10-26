IMPORT SETTINGS
1) "Advanced > Generate Mipmap" : off
2) You can also look into "Wrap Mode" ("Clamp") and "Compression" to see if it makes a difference in your case.


MATERIAL
* Shader: "Skybox > Panoramic"
* Tint Color: Default is a perfect grey.
* Exposure: Brightens up the skybox and thus the scene.
* Rotation: Does what it says.
* Mapping: Depends on the image layout. "6 Frames Layout" was common in the past, photos often have "Latitude Longitude Layout". Don't worry - you'll notice if it's wrong. (Hint: Look at the top and bottom of the skybox.)


USAGE
* Just drop the material into the scene or the skybox material slot.
* The HDRI affects your lighting - so they are useful even if you plan to cover it up.


SOURCES
https://polyhaven.com/
^ CC0 license, aka no credit and you can redistribute it as you like. They also have studio lighting and you can see some user-submitted example renders.