local _ = require(script.Parent.types)
local Array = require(script:FindFirstAncestor("Navigation").Parent.LuauPolyfill).Array

local function _(p1): boolean --[[ Line: 15 | Named "isStackRoute" ]]
	return p1.index ~= nil and (p1.routes ~= nil and p1.isTransitioning ~= nil)
end

local function getActiveRoutes(p1) --[[ Line: 29 ]]
	-- upvalues: Array (copy), getActiveRoutes (copy)
	local ConcatResult = {}
	
	if p1 == nil then
		return ConcatResult
	end
	if p1.key or p1.routeName then
		table.insert(ConcatResult, p1)
	end
	if p1.routes and p1.index ~= nil then
		local Routes = p1.routes
		local Index: number = p1.index
		
		if p1.index ~= nil and (p1.routes ~= nil and p1.isTransitioning ~= nil) then
			for i = 1, Index - 1 do
				ConcatResult = Array.concat(ConcatResult, getActiveRoutes(Routes[i]))
			end
		end
		ConcatResult = Array.concat(ConcatResult, getActiveRoutes(Routes[Index]))
	end
	return ConcatResult
end

return getActiveRoutes