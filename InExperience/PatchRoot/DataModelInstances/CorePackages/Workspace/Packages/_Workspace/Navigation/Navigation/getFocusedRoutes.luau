local _ = require(script.Parent.types)
local Array = require(script:FindFirstAncestor("Navigation").Parent.LuauPolyfill).Array

local function getFocusedRoutes(Route) --[[ Line: 10 ]]
	-- upvalues: Array (copy), getFocusedRoutes (copy)
	local ConcatResult = {}
	
	if Route == nil then
		return ConcatResult
	end
	if Route.key or Route.routeName then
		table.insert(ConcatResult, Route)
	end
	if Route.routes and Route.index ~= nil then
		ConcatResult = Array.concat(ConcatResult, getFocusedRoutes(Route.routes[Route.index]))
	end
	return ConcatResult
end

return getFocusedRoutes