local parent = script:FindFirstAncestor("ExpChat").Parent
local fFlagAEGIS2UseGuacToShowEnabledMessage = require(parent.SharedFlags).FFlagAEGIS2UseGuacToShowEnabledMessage
local var1 = if fFlagAEGIS2UseGuacToShowEnabledMessage then require(parent.UniversalAppPolicy) else nil

return function()
	-- upvalues: fFlagAEGIS2UseGuacToShowEnabledMessage (ref), var1 (write)
	return if fFlagAEGIS2UseGuacToShowEnabledMessage then var1.getAppFeaturePolicies().getInCommsRegionBubble() else false
end