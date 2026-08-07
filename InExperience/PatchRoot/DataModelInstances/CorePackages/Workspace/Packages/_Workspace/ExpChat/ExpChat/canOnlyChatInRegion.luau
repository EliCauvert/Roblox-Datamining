local parent = script:FindFirstAncestor("ExpChat").Parent
local fFlagAEGIS2UseGuacToShowEnabledMessage = require(parent.SharedFlags).FFlagAEGIS2UseGuacToShowEnabledMessage
local var0 = if fFlagAEGIS2UseGuacToShowEnabledMessage then require(parent.UniversalAppPolicy) else nil

return function() --[[ line: 12 ]]
	-- upvalues: fFlagAEGIS2UseGuacToShowEnabledMessage (ref), var0 (write)
	return if fFlagAEGIS2UseGuacToShowEnabledMessage then var0.getAppFeaturePolicies().getInCommsRegionBubble() else false
end