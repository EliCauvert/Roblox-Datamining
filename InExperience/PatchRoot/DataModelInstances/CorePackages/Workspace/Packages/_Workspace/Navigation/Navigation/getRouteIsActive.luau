local navigation = script:FindFirstAncestor("Navigation")
local array = require(navigation.Parent.LuauPolyfill).Array
local getActiveRoutesModule = require(navigation.getActiveRoutes)
local _ = require(script.Parent.types)

return function(p1, p2)
	-- upvalues: array (ref), getActiveRoutesModule (ref)
	return array.find(getActiveRoutesModule(p1), function(p3)
		-- upvalues: p2 (ref)
		return p3.routeName == p2
	end) ~= nil
end