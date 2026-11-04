local GetThumbTravelModule = require(script.Parent.getThumbTravel)

return function(p1, p2: number, p3: number, p4, p5)
	-- upvalues: GetThumbTravelModule (copy)
	return if GetThumbTravelModule(p3, p4, p5) == nil then 0 elseif p5 then (p2 - 0.5 - p1 * p3) * p4 else (p2 - 1 - p1 * (p3 - 1)) * p4
end