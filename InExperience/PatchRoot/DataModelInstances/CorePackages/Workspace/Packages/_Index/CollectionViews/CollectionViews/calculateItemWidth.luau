local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 8 | named "calculateItemWidth" ]]
	-- upvalues: argCheckModule (ref)
	if p0 <= 0 then
		return 0
	end
	argCheckModule.assert(p0 >= 1)
	
	return math.max(1, (p3 - (p2 * 2 + (p5 or 0)) - p1 * (p0 - 1)) / (p0 + p4))
end