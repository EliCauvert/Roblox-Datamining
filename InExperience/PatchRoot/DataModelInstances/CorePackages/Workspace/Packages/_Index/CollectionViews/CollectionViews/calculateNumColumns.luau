local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p0, p1, p2, p3, p4, p5) --[[ line: 9 | named "calculateNumColumns" ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.assert(p0 >= 1)
	argCheckModule.assert(p1 >= 0)
	local floored = math.floor((p4 + p1) / (p0 + p1))
	
	if p5 then
		floored = math.floor(floored * 0.5) * 2
	end
	return math.min(p3, math.max(p2, floored))
end