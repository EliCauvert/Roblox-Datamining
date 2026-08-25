local _ = require(script.Parent.types)

local function getRouteKeyIsInNavigationState(p0, p1)
	-- upvalues: getRouteKeyIsInNavigationState (ref)
	if p1.key == p0 then
		return true
	elseif p1.routes then
		for i, v in pairs(p1.routes) do
			if getRouteKeyIsInNavigationState(p0, v) then
				return true
			end
		end
	end
	return false
end

return getRouteKeyIsInNavigationState