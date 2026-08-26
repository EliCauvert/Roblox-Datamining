local parent = script:FindFirstAncestor("StreamNotifications").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagStreamNotificationUXSettingsHeader = sharedFlagsModule.FFlagStreamNotificationUXSettingsHeader
local getFStringNotificationsStreamNotificationUXLayer = sharedFlagsModule.GetFStringNotificationsStreamNotificationUXLayer
local ixpHelper = require(parent.NotificationsCommon).ixpHelper
local streamNotificationUXSettingsGearVariant = game:DefineFastString("StreamNotificationUXSettingsGearVariant", "enableStreamSettingsGear")

local function _()
	-- upvalues: ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref)
	return ixpHelper.getIxpLayerData(getFStringNotificationsStreamNotificationUXLayer())
end

local _ = function()
	-- upvalues: ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref), streamNotificationUXSettingsGearVariant (ref)
	local ixpLayerData = ixpHelper.getIxpLayerData(getFStringNotificationsStreamNotificationUXLayer())
	
	return if ixpLayerData and ixpLayerData[streamNotificationUXSettingsGearVariant] ~= nil then ixpLayerData[streamNotificationUXSettingsGearVariant] == true else false
end

return {
	getSettingsGearEnabled = function()
		-- upvalues: fFlagStreamNotificationUXSettingsHeader (ref), ixpHelper (ref), getFStringNotificationsStreamNotificationUXLayer (ref), streamNotificationUXSettingsGearVariant (ref)
		local var1 = fFlagStreamNotificationUXSettingsHeader
		
		if var1 then
			local ixpLayerData = ixpHelper.getIxpLayerData(getFStringNotificationsStreamNotificationUXLayer())
			
			if ixpLayerData and ixpLayerData[streamNotificationUXSettingsGearVariant] ~= nil then
				return ixpLayerData[streamNotificationUXSettingsGearVariant] == true
			end
			var1 = false
		end
		return var1
	end
}