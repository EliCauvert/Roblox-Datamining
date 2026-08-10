local parent = script:FindFirstAncestor("StreamNotifications").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagStreamNotificationUXSettingsHeader = sharedFlagsModule.FFlagStreamNotificationUXSettingsHeader
local getFStringNotificationsStreamNotificationUXLayer = sharedFlagsModule.GetFStringNotificationsStreamNotificationUXLayer
local ixpHelper = require(parent.NotificationsCommon).ixpHelper
local streamNotificationUXSettingsGearVariant = game:DefineFastString("StreamNotificationUXSettingsGearVariant", "enableStreamSettingsGear")

local function _() --[[ line: 17 | named "getLayerVariables" ]]
	-- upvalues: ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref)
	return ixpHelper.getIxpLayerData(getFStringNotificationsStreamNotificationUXLayer())
end

local _ = function() --[[ line: 21 | named "getIsUserInTreatment" ]]
	-- upvalues: ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref), streamNotificationUXSettingsGearVariant (ref)
	local ixpLayerData = ixpHelper.getIxpLayerData(getFStringNotificationsStreamNotificationUXLayer())
	
	return if ixpLayerData and ixpLayerData[streamNotificationUXSettingsGearVariant] ~= nil then ixpLayerData[streamNotificationUXSettingsGearVariant] == true else false
end

return {
	getSettingsGearEnabled = function() --[[ line: 31 ]]
		-- upvalues: fFlagStreamNotificationUXSettingsHeader (ref), ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref), streamNotificationUXSettingsGearVariant (ref)
		local var3 = fFlagStreamNotificationUXSettingsHeader
		
		if var3 then
			local ixpLayerData = ixpHelper.getIxpLayerData(getFStringNotificationsStreamNotificationUXLayer())
			
			if ixpLayerData and ixpLayerData[streamNotificationUXSettingsGearVariant] ~= nil then
				return ixpLayerData[streamNotificationUXSettingsGearVariant] == true
			end
			var3 = false
		end
		return var3
	end
}