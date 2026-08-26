local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1, p2, p3, p4)
	-- upvalues: argCheckModule (ref)
	if p1 < 2 then
		return 0
	end
	argCheckModule.assert(p1 >= 2)
	local var1 = p1 * p3 + (p1 - 1) * p2 + p4 * 2
	
	return if var1 > 0 then p2 / var1 else 0
end