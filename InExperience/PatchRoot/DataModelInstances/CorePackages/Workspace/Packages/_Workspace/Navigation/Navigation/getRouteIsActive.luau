local navigation = script:FindFirstAncestor("Navigation")
local array = require(navigation.Parent.LuauPolyfill).Array
local getActiveRoutesModule = require(navigation.getActiveRoutes)
local _ = require(script.Parent.types)

return function(p0, p1) --[[ line: 12 | named "getRouteIsActive" ]]
	-- upvalues: array (ref), getActiveRoutesModule (ref)
	return array.find(getActiveRoutesModule(p0), function(p2) --[[ line: 13 ]]
		-- upvalues: p1 (ref)
		return p2.routeName == p1
	end) ~= nil
end