-- 
-- Vector.lua
--
-- * { x, y } instead of { x = x, y = y } for Love compatibility and
--   performance reasons.
-- * All methods should *not* assume that arguments have the Vector metatable
--   assigned so that general 2-elements arrys can use this library.
-- 

Vector = {}
Vector.__index = Vector

function Vector.new( tbl )
	local result = { tbl[1], tbl[2] }

	setmetatable(result, Vector)

	return result
end

function Vector.clone( self )
	local result = { self[1], self[2] }

	setmetatable(result, Vector)

	return result
end

function Vector.length( self )
	local x, y = self[1], self[2]

	return math.sqrt((x * x) + (y * y))
end

local _Vector_length = Vector.length
local _Vector_new = Vector.new

function Vector.normal( self )
	local l = _Vector_length(self)

	assert(l > 0)

	return _Vector_new { self[1] / l, self[2] / l }
end

function Vector.normalise( self )
	local l = _Vector_length(self)

	assert(l > 0)

	self[1], self[2] = self[1] / l, self[2] / l

	return self
end

function Vector.toLength( self, other )
	local dx = other[1] - self[1]
	local dy = other[2] - self[2]

	return math.sqrt((dx * dx) + (dy * dy))
end

function Vector.dot( self, other )
	return (self[1] * other[1]) + (self[2] * other[2])
end

function Vector.to( self, other )
	return _Vector_new { other[1] - self[1], other[2] - self[2] }
end

function Vector.midpoint( self, other )
	local dx = other[1] - self[1]
	local dy = other[2] - self[2]

	return _Vector_new {
		self[1] + (dx * 0.5),
		self[2] + (dy * 0.5),
	}
end

function Vector.scale( self )
	self[1] = scale * self[1]
	self[2] = scale * self[2]

	return self
end

