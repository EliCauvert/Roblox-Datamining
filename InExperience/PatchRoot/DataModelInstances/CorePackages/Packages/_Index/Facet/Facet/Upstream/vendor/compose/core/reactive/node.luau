--!native

local _ = require("./types")
local DynamicModule = require("../dynamic")
local Detachers = {}
require("../weak").keys(Detachers)
local t = {}
local Callback = getmetatable

local function uninitialized()
	return error("Compose value has not initialized", 0)
end

return {
	detachers = Detachers,
	isNode = function(p1): boolean
		-- upvalues: t (copy), Callback (copy)
		return t[Callback(p1)] == true
	end,
	adopt = function(Key)
		-- upvalues: t (copy), DynamicModule (copy)
		t[Key] = DynamicModule.read(Key, "peek") ~= nil
	end,
	classify = function(p1, p2)
		setmetatable(p1, p2)
	end,
	asNode = function(p1)
		-- upvalues: t (copy), Callback (copy), DynamicModule (copy)
		return if t[Callback(p1)] == nil then nil else DynamicModule.node(p1)
	end,
	nodeOf = function(p1)
		return p1
	end,
	read = function(Key)
		return Key:peek()
	end,
	readCached = function(p1)
		-- upvalues: uninitialized (copy)
		local Cache = p1.cache
		
		return if Cache == nil then uninitialized() else Cache.value
	end,
	asValue = function(p1)
		-- upvalues: t (copy), Callback (copy), DynamicModule (copy)
		return if t[Callback(p1)] == true then DynamicModule.valueNode(p1) else nil
	end,
	asValueNode = function(p1)
		-- upvalues: t (copy), Callback (copy), DynamicModule (copy)
		return if t[Callback(p1)] == true then DynamicModule.valueNode(p1) else nil
	end,
	identityKey = function(p1, _)
		return p1
	end
}