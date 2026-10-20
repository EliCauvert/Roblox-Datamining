local ArgCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1: number, p2: number, p3: number, p4: number, p5: number, p6): number
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.assert(p1 >= 1)
	ArgCheckModule.assert(p2 >= 0)
	local Floored = math.floor((p5 + p2) / (p1 + p2))
	
	if p6 then
		Floored = math.floor(Floored * 0.5) * 2
	end
	return (math.min(p4, (math.max(p3, Floored))))
end