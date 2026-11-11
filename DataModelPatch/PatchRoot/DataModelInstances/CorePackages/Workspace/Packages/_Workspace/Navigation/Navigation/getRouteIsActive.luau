local Navigation = script:FindFirstAncestor("Navigation")
local Array = require(Navigation.Parent.LuauPolyfill).Array
local GetActiveRoutesModule = require(Navigation.getActiveRoutes)
local _ = require(script.Parent.types)

return function(p1, RouteName): boolean
	-- upvalues: Array (copy), GetActiveRoutesModule (copy)
	return Array.find(GetActiveRoutesModule(p1), function(p2): boolean
		-- upvalues: RouteName (copy)
		return p2.routeName == RouteName
	end) ~= nil
end