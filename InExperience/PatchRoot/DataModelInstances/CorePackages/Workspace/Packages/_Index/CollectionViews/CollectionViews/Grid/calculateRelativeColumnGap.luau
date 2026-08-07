local argCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p0, p1, p2, p3) --[[ line: 8 | named "calculateRelativeColumnGap" ]]
	-- upvalues: argCheckModule (ref)
	if p0 < 2 then
		return 0
	end
	argCheckModule.assert(p0 >= 2)
	local var1 = p0 * p2 + (p0 - 1) * p1 + p3 * 2
	
	return if var1 > 0 then p1 / var1 else 0
end