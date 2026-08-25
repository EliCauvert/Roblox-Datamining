local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local map = luauPolyfillModule.Map
local set = luauPolyfillModule.Set
local t = {}
local _ = require(parent.GraphQL)
local memoize1 = require(script.Parent.memoize).memoize1
local var2 = nil
local var3 = nil

function t.getDefinedRootType(p0, p1)
	-- upvalues: var2 (write), error (ref)
	local var4 = var2(p0):get(p1)
	
	if var4 == nil then
		error(error.new(("Root type for operation \"%s\" not defined by the given schema."):format(tostring(p1))))
	end
	return var4
end

local function _(value)
	local t = {}
	value:forEach(function(p2)
		-- upvalues: t (ref)
		table.insert(t, p2)
	end)
	
	return t
end

t.getRootTypeNames = memoize1(function(p3)
	-- upvalues: var3 (write), set (ref), array (ref)
	local var6 = var3(p3)
	local new = set.new
	local map = array.map
	local concat = array.concat
	local t = {}
	local t_1 = {}
	var6:forEach(function(p4)
		-- upvalues: t_1 (ref)
		table.insert(t_1, p4)
	end)
	
	return new(map(concat(t, t_1), function(p5)
		return p5.name
	end))
end)
t.getRootTypes = memoize1(function(p6)
	-- upvalues: var2 (write), set (ref)
	return set.new(var2(p6):values())
end)
t.getRootTypeMap = memoize1(function(p7)
	-- upvalues: map (ref), boolean (ref)
	local var9 = map.new()
	local queryType = p7:getQueryType()
	
	if boolean.toJSBoolean(queryType) then
		var9:set("query", queryType)
	end
	local mutationType = p7:getMutationType()
	
	if boolean.toJSBoolean(mutationType) then
		var9:set("mutation", mutationType)
	end
	local subscriptionType = p7:getSubscriptionType()
	
	if boolean.toJSBoolean(subscriptionType) then
		var9:set("subscription", subscriptionType)
	end
	return var9
end)

return t