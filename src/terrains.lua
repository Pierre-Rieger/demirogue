
terrains = {}

-- terrain.<name> = {
--     walkable = <boolean>,
--     colour = { [0.255], [0.255], [0.255], [0.255] } : { R, G, B, A }
-- }

-- TODO: we need to be able to have 'shimmering' terrain, e.g. water and lava.
-- TODO: would be nice to have variations, e.g. different greens for trees.
-- TODO: Might be worth colouring based on distance, have an abyss darker in
--       the middle.

terrains.border = {
	walkable = false,
	colour = { 48, 48, 48, 255 },
}

terrains.floor = {
	walkable = true,
	colour = { 184, 118, 61, 255 },
}

terrains.dirt = {
	walkable = true,
	colour = { 204, 138, 81, 255 },
}

terrains.corridor = {
	walkable = true,
	colour = { 0, 128, 128, 255 },
}

terrains.granite = {
	walkable = false,
	colour = { 64, 64, 64, 255 },
}

terrains.tree = {
	walkable = false,
	colour = { 72, 163, 103, 255 },
}

terrains.water = {
	walkable = false,
	colour = { 0, 121, 194, 255 }
}

terrains.lava = {
	walkable = false,
	colour = { 255, 149, 0, 255 }
}

terrains.abyss = {
	walkable = false,
	colour = { 55, 4, 112, 255 }
}

for name, params in pairs(terrains) do
	params.name = name
end

local _inverse = table.inverse(terrains)

function isTerrain( value )
	return _inverse[value] ~= nil
end