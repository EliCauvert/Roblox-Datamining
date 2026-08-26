local navigation = script:FindFirstAncestor("Navigation")
local array = require(navigation.Parent.LuauPolyfill).Array
local getFocusedRoutesModule = require(navigation.getFocusedRoutes)
local _ = require(script.Parent.types)

return function(p1, p2)
	-- upvalues: array (ref), getFocusedRoutesModule (ref)
	return array.find(getFocusedRoutesModule(p1), function(p3)
		-- upvalues: p2 (ref)
		return p3.routeName == p2
	end) ~= nil
end