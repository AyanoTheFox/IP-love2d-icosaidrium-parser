# IP - Icosaidrium parser
love2d Icosaidrium map parser is a libary to decode a map made on Icosaidrium
it is in the version v0.0.1, get starting octuber 28th 2023, last modify: octuber 28th 2023

# features
- very simple to use
- works in all devices

# How it works
 To use the IP you need fallow the structions:
- Install the libary in your application
- require it
- insert the tileset in your project
- load and draw the map and the tileset
- the tileset dont need extensions .png, .jpg or .json

```lua
function love.load()
    ip = require 'ip'
    map = ip.load('mapTest.bin', 'tileset')
end

function love.draw()
    map:draw()
end
```