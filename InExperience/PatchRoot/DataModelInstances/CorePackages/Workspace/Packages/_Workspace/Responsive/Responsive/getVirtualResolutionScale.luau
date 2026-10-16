local Parent = script:FindFirstAncestor("Responsive").Parent
local IsTenFootInterfaceFunction = require(Parent.AppCommonLib).isTenFootInterface
local GetFFlagApplyResolutionScaleFunction = require(Parent.SharedFlags).GetFFlagApplyResolutionScale

function getVirtualResolutionScale() --[[ Line: 7 ]]
	-- upvalues: GetFFlagApplyResolutionScaleFunction (copy), IsTenFootInterfaceFunction (copy)
	return if GetFFlagApplyResolutionScaleFunction() then if IsTenFootInterfaceFunction() then 1.5 else 1 else nil
end

return getVirtualResolutionScale