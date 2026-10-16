local Navigation = script:FindFirstAncestor("Navigation")
local Array = require(Navigation.Parent.LuauPolyfill).Array
local GetFocusedRoutesModule = require(Navigation.getFocusedRoutes)
local _ = require(script.Parent.types)

return function(p1, RouteName): boolean --[[ Line: 12 | Named "getRouteIsFocused" ]]
	-- upvalues: Array (copy), GetFocusedRoutesModule (copy)
	return Array.find(GetFocusedRoutesModule(p1), function(p2): boolean --[[ Line: 13 ]]
		-- upvalues: RouteName (copy)
		return p2.routeName == RouteName
	end) ~= nil
end