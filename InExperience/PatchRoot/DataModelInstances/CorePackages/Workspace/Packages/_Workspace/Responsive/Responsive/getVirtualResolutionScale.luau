local guiService = game:GetService("GuiService")
local getFFlagApplyResolutionScale = require(script:FindFirstAncestor("Responsive").Parent.SharedFlags).GetFFlagApplyResolutionScale

function getVirtualResolutionScale()
	-- upvalues: getFFlagApplyResolutionScale (ref), guiService (ref)
	return if getFFlagApplyResolutionScale() then if guiService:IsTenFootInterface() then 1.5 else 1 else nil
end

return getVirtualResolutionScale