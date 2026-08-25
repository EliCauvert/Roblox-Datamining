local _ = require(script.Parent.types)
local array = require(script:FindFirstAncestor("Navigation").Parent.LuauPolyfill).Array

local function getFocusedRoutes(p0)
	-- upvalues: array (ref), getFocusedRoutes (ref)
	local t = {}
	
	if p0 == nil then
		return t
	elseif p0.key or p0.routeName then
		table.insert(t, p0)
	end
	if p0.routes and p0.index ~= nil then
		t = array.concat(t, getFocusedRoutes(p0.routes[p0.index]))
	end
	return t
end

return getFocusedRoutes