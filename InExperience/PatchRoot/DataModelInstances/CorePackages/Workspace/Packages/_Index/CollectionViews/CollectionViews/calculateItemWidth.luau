local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: argCheckModule (ref)
	if p1 <= 0 then
		return 0
	end
	argCheckModule.assert(p1 >= 1)
	
	return math.max(1, (p4 - (p3 * 2 + (p6 or 0)) - p2 * (p1 - 1)) / (p1 + p5))
end