local GuiService = game:GetService("GuiService")
local GetFFlagApplyResolutionScaleFunction = require(script:FindFirstAncestor("Responsive").Parent.SharedFlags).GetFFlagApplyResolutionScale

function getVirtualResolutionScale()
	-- upvalues: GetFFlagApplyResolutionScaleFunction (copy), GuiService (copy)
	return if GetFFlagApplyResolutionScaleFunction() then if GuiService:IsTenFootInterface() then 1.5 else 1 else nil
end

return getVirtualResolutionScale