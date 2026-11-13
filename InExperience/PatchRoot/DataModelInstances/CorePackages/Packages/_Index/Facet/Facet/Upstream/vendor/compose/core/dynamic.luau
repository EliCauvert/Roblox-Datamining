--!native

local _ = require("./host")
local _ = require("./reactive/types")

local function identity(p1)
	return p1
end

local t = {}
setmetatable(t, {
	__index = function()
		-- upvalues: identity (copy)
		return identity
	end
})
local ValueFunction = t.value

return {
	nodeList = ValueFunction(identity),
	teardown = ValueFunction(identity),
	node = ValueFunction(identity),
	valueNode = ValueFunction(identity),
	entries = ValueFunction(identity),
	handler = ValueFunction(identity),
	listener = ValueFunction(identity),
	props = ValueFunction(identity),
	invoke = ValueFunction(function(Callback, ...)
		return Callback(...)
	end),
	raw = ValueFunction(rawget),
	read = ValueFunction(function(p1, p2)
		return p1[p2]
	end),
	write = ValueFunction(function(p1, Key, p2)
		p1[Key] = p2
	end),
	cache = function(p1, Value)
		p1.value = Value
		
		if p1.cache == nil then
			p1.cache = p1
		end
	end
}