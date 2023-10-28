atlas = {}

function atlas.getQuads(_data)
    local img, sparrow, quads = love.graphics.newImage(_data .. '.png'), json.decode(love.filesystem.read(_data .. '.json')), {}
    for _, quad in ipairs(sparrow.frames) do
        table.insert(quads, 
            love.graphics.newQuad(
                quad.frame.x,
                quad.frame.y,
                quad.frame.w,
                quad.frame.h,
                img
            )
        )
    end
    return img, quads
end

return atlas