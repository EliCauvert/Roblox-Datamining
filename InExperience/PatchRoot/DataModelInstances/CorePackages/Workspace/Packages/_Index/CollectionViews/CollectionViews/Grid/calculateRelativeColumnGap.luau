local ArgCheckModule = require(script:FindFirstAncestor("CollectionViews").Parent.ArgCheck)

return function(p1: number, p2, p3, p4: number) --[[ Line: 8 | Named "calculateRelativeColumnGap" ]]
	-- upvalues: ArgCheckModule (copy)
	if p1 < 2 then
		return 0
	else
		ArgCheckModule.assert(p1 >= 2)
		local v1 = p1 * p3 + (p1 - 1) * p2 + p4 * 2
		
		return if v1 > 0 then p2 / v1 else 0
	end
end