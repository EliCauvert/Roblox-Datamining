local GetThumbTravelModule = require(script.Parent.getThumbTravel)

return function(p1, p2: number, p3, p4)
	-- upvalues: GetThumbTravelModule (copy)
	local ThumbTravelModule = GetThumbTravelModule(p3, p4)
	
	return if ThumbTravelModule == nil then p1 else p1 * ThumbTravelModule + (p2 - 1) * p4
end