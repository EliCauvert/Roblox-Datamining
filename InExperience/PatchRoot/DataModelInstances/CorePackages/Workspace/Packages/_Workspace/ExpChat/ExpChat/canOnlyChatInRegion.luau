local Parent = script:FindFirstAncestor("ExpChat").Parent
local FFlagAEGIS2UseGuacToShowEnabledMessage = require(Parent.SharedFlags).FFlagAEGIS2UseGuacToShowEnabledMessage
local UniversalAppPolicyModule = if FFlagAEGIS2UseGuacToShowEnabledMessage then require(Parent.UniversalAppPolicy) else nil

return function() --[[ Line: 12 ]]
	-- upvalues: FFlagAEGIS2UseGuacToShowEnabledMessage (copy), UniversalAppPolicyModule (ref)
	return if FFlagAEGIS2UseGuacToShowEnabledMessage then UniversalAppPolicyModule.getAppFeaturePolicies().getInCommsRegionBubble() else false
end