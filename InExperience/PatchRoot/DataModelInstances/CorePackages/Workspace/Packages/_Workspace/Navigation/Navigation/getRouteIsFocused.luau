local navigation = script:FindFirstAncestor("Navigation")
local array = require(navigation.Parent.LuauPolyfill).Array
local getFocusedRoutesModule = require(navigation.getFocusedRoutes)
local _ = require(script.Parent.types)

return function(p0, p1) --[[ line: 12 | named "getRouteIsFocused" ]]
	-- upvalues: array (ref), getFocusedRoutesModule (ref)
	return array.find(getFocusedRoutesModule(p0), function(p2) --[[ line: 13 ]]
		-- upvalues: p1 (ref)
		return p2.routeName == p1
	end) ~= nil
end