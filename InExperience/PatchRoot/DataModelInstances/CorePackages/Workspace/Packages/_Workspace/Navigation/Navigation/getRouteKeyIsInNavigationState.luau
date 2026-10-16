local _ = require(script.Parent.types)

local function getRouteKeyIsInNavigationState(Key, p1): boolean --[[ Line: 6 ]]
	-- upvalues: getRouteKeyIsInNavigationState (copy)
	if p1.key == Key then
		return true
	end
	if p1.routes then
		for _, route in pairs(p1.routes) do
			if getRouteKeyIsInNavigationState(Key, route) then
				return true
			end
		end
	end
	return false
end

return getRouteKeyIsInNavigationState