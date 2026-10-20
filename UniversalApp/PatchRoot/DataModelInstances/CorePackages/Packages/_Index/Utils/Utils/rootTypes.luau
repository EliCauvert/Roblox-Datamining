local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local Map = LuauPolyfillModule.Map
local Set = LuauPolyfillModule.Set
local _ = require(Parent.GraphQL)
local Memoize1Function = require(script.Parent.memoize).memoize1
local Callback = nil
local Callback1 = nil

local function getDefinedRootType(p1, p2)
	-- upvalues: Callback (ref), Error1 (copy)
	local GetResult = Callback(p1):get(p2)
	
	if GetResult == nil then
		error(Error1.new(("Root type for operation \"%s\" not defined by the given schema."):format((tostring(p2)))))
	end
	return GetResult
end

local function _(p1)
	local List = {}
	p1:forEach(function(p2)
		-- upvalues: List (copy)
		table.insert(List, p2)
	end)
	
	return List
end

local Memoize1Result = Memoize1Function(function(p1)
	-- upvalues: Callback1 (ref), Set (copy), Array (copy)
	local NewFunction = Set.new
	local MapFunction = Array.map
	local ConcatFunction = Array.concat
	local t = {}
	local List = {}
	Callback1(p1):forEach(function(p2)
		-- upvalues: List (copy)
		table.insert(List, p2)
	end)
	
	return NewFunction(MapFunction(ConcatFunction(t, List), function(p2)
		return p2.name
	end))
end)
Callback1 = Memoize1Function(function(p1)
	-- upvalues: Callback (ref), Set (copy)
	return Set.new(Callback(p1):values())
end)
Callback = Memoize1Function(function(p1)
	-- upvalues: Map (copy), Boolean (copy)
	local NewMap = Map.new()
	local QueryType = p1:getQueryType()
	
	if Boolean.toJSBoolean(QueryType) then
		NewMap:set("query", QueryType)
	end
	local MutationType = p1:getMutationType()
	
	if Boolean.toJSBoolean(MutationType) then
		NewMap:set("mutation", MutationType)
	end
	local SubscriptionType = p1:getSubscriptionType()
	
	if Boolean.toJSBoolean(SubscriptionType) then
		NewMap:set("subscription", SubscriptionType)
	end
	return NewMap
end)

return {
	getDefinedRootType = getDefinedRootType,
	getRootTypeNames = Memoize1Result,
	getRootTypes = Callback1,
	getRootTypeMap = Callback
}