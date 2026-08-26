local _ = require(script.Parent.types)
local array = require(script:FindFirstAncestor("Navigation").Parent.LuauPolyfill).Array

local function getFocusedRoutes(p1)
	-- upvalues: array (ref), getFocusedRoutes (ref)
	local t = {}
	
	if p1 == nil then
		return t
	elseif p1.key or p1.routeName then
		table.insert(t, p1)
	end
	if p1.routes and p1.index ~= nil then
		t = array.concat(t, getFocusedRoutes(p1.routes[p1.index]))
	end
	return t
end

return getFocusedRoutes