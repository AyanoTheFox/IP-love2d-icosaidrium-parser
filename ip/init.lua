local BASE = (...) .. "."
local IP = {
    _VERSION = "0.0.1",
    _URL = "",
    _AUTHOR = "ayano the fox",
    _TYPE = "module",
    _NAME = "Icosaidrium parser - IP"
}
IP.__index = IP
local atlas = require(BASE .. 'atlas')
local json = require(BASE .. 'json')
--@_mapPath is a string
--@_pltilesetPath is a string
function IP.load(_mapPath, _tilesetPath)
    local map = setmetatable({}, IP)
    map.tileset = {}
    map.tileset.sheet, map.tileset.quads = atlas.getQuads(_tilesetPath)
    map.decoded = json.decode(love.data.decompress("string", "zlib", love.filesystem.read(_mapPath)))
    map.batch = love.graphics.newSpriteBatch(map.tileset.sheet)
    return map
end

function IP:draw()
    self.batch:clear() --it will leave the mapbatch clean to be updated
    for _, block in ipairs(self.decoded.blocks) do
        self.batch:add(self.tileset.quads[block.textureId], block.x, block.y, block.r, block.sx, block.sy, block.ox, block.oy)
    end
    love.graphics.draw(self.batch) --render the mapbatch
end

return IP