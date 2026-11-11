local ArgCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1: number, p2, p3: number, p4, p5: number, p6): number
	-- upvalues: ArgCheckModule (copy)
	if p1 <= 0 then
		return 0
	else
		ArgCheckModule.assert(p1 >= 1)
		
		return (math.max(1, (p4 - (p3 * 2 + (p6 or 0)) - p2 * (p1 - 1)) / (p1 + p5)))
	end
end