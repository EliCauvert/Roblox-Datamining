local parent = script:FindFirstAncestor("Responsive").Parent
local isTenFootInterface = require(parent.AppCommonLib).isTenFootInterface
local getFFlagApplyResolutionScale = require(parent.SharedFlags).GetFFlagApplyResolutionScale

function getVirtualResolutionScale()
	-- upvalues: getFFlagApplyResolutionScale (ref), isTenFootInterface (ref)
	return if getFFlagApplyResolutionScale() then if isTenFootInterface() then 1.5 else 1 else nil
end

return getVirtualResolutionScale