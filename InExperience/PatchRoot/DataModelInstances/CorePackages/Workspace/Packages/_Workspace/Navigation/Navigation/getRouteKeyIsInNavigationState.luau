local _ = require(script.Parent.types)

local function getRouteKeyIsInNavigationState(p1, p2)
	-- upvalues: getRouteKeyIsInNavigationState (ref)
	if p2.key == p1 then
		return true
	elseif p2.routes then
		for i, v in pairs(p2.routes) do
			if getRouteKeyIsInNavigationState(p1, v) then
				return true
			end
		end
	end
	return false
end

return getRouteKeyIsInNavigationState