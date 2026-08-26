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
local var1 = nil
local var2 = nil

function t.getDefinedRootType(p1, p2)
	-- upvalues: var1 (write), error (ref)
	local var3 = var1(p1):get(p2)
	
	if var3 == nil then
		error(error.new(("Root type for operation \"%s\" not defined by the given schema."):format(tostring(p2))))
	end
	return var3
end

local function _(value)
	local t = {}
	value:forEach(function(p1)
		-- upvalues: t (ref)
		table.insert(t, p1)
	end)
	
	return t
end

t.getRootTypeNames = memoize1(function(p1)
	-- upvalues: var2 (write), set (ref), array (ref)
	local var3 = var2(p1)
	local new = set.new
	local map = array.map
	local concat = array.concat
	local t = {}
	local t_1 = {}
	var3:forEach(function(p2)
		-- upvalues: t_1 (ref)
		table.insert(t_1, p2)
	end)
	
	return new(map(concat(t, t_1), function(p2)
		return p2.name
	end))
end)
t.getRootTypes = memoize1(function(p1)
	-- upvalues: var1 (write), set (ref)
	return set.new(var1(p1):values())
end)
t.getRootTypeMap = memoize1(function(p1)
	-- upvalues: map (ref), boolean (ref)
	local var3 = map.new()
	local queryType = p1:getQueryType()
	
	if boolean.toJSBoolean(queryType) then
		var3:set("query", queryType)
	end
	local mutationType = p1:getMutationType()
	
	if boolean.toJSBoolean(mutationType) then
		var3:set("mutation", mutationType)
	end
	local subscriptionType = p1:getSubscriptionType()
	
	if boolean.toJSBoolean(subscriptionType) then
		var3:set("subscription", subscriptionType)
	end
	return var3
end)

return t