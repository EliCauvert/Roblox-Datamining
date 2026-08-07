local _ = require(script.Parent.types)
local array = require(script:FindFirstAncestor("Navigation").Parent.LuauPolyfill).Array

local function _(p0) --[[ line: 15 | named "isStackRoute" ]]
	return p0.index ~= nil and (p0.routes ~= nil and p0.isTransitioning ~= nil)
end

local function getActiveRoutes(p1) --[[ line: 29 ]]
	-- upvalues: array (ref), getActiveRoutes (ref)
	local t = {}
	
	if p1 == nil then
		return t
	elseif p1.key or p1.routeName then
		table.insert(t, p1)
	end
	if p1.routes and p1.index ~= nil then
		local routes = p1.routes
		local index = p1.index
		
		if p1.index ~= nil and (p1.routes ~= nil and p1.isTransitioning ~= nil) then
			for i = 1, index - 1 do
				t = array.concat(t, getActiveRoutes(routes[i]))
			end
		end
		t = array.concat(t, getActiveRoutes(routes[index]))
	end
	return t
end

return getActiveRoutes