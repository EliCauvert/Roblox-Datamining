local getTextHeightModule = require(script.Parent.Parent.GetTextHeight)

return {
	getExpandableTextHeights = function(p1, p2, p3, p4)
		-- upvalues: getTextHeightModule (ref)
		local var1 = p1.BaseSize * p1.Body.RelativeSize
		
		return getTextHeightModule(p3, p1.Body.Font, var1, p2), p4 * var1
	end,
	getCanExpand = function(p1, p2, p3, p4)
		-- upvalues: getTextHeightModule (ref)
		local var1 = p1.BaseSize * p1.Body.RelativeSize
		
		return p4 * var1 < getTextHeightModule(p3, p1.Body.Font, var1, p2)
	end
}