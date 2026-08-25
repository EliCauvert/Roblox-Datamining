local getTextHeightModule = require(script.Parent.Parent.GetTextHeight)

return {
	getExpandableTextHeights = function(p0, p1, p2, p3)
		-- upvalues: getTextHeightModule (ref)
		local var1 = p0.BaseSize * p0.Body.RelativeSize
		
		return getTextHeightModule(p2, p0.Body.Font, var1, p1), p3 * var1
	end,
	getCanExpand = function(p4, p5, p6, p7)
		-- upvalues: getTextHeightModule (ref)
		local var2 = p4.BaseSize * p4.Body.RelativeSize
		
		return p7 * var2 < getTextHeightModule(p6, p4.Body.Font, var2, p5)
	end
}