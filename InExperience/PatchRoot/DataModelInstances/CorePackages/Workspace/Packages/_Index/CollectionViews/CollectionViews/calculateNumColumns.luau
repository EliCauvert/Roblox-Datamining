local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: argCheckModule (ref)
	argCheckModule.assert(p1 >= 1)
	argCheckModule.assert(p2 >= 0)
	local floored = math.floor((p5 + p2) / (p1 + p2))
	
	if p6 then
		floored = math.floor(floored * 0.5) * 2
	end
	return math.min(p4, math.max(p3, floored))
end