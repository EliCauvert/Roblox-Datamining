local GetTextHeightModule = require(script.Parent.Parent.GetTextHeight)

return {
	getExpandableTextHeights = function(p1, p2, p3, p4) --[[ Line: 4 ]]
		-- upvalues: GetTextHeightModule (copy)
		local ScaledBaseSize = p1.BaseSize * p1.Body.RelativeSize
		
		return GetTextHeightModule(p3, p1.Body.Font, ScaledBaseSize, p2), p4 * ScaledBaseSize
	end,
	getCanExpand = function(p1, p2, p3, p4): boolean --[[ Line: 14 ]]
		-- upvalues: GetTextHeightModule (copy)
		local ScaledBaseSize = p1.BaseSize * p1.Body.RelativeSize
		
		return p4 * ScaledBaseSize < GetTextHeightModule(p3, p1.Body.Font, ScaledBaseSize, p2)
	end
}