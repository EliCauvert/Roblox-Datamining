local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagStreamNotificationUXSettingsHeader = SharedFlagsModule.FFlagStreamNotificationUXSettingsHeader
local GetFStringNotificationsStreamNotificationUXLayerFunction = SharedFlagsModule.GetFStringNotificationsStreamNotificationUXLayer
local IxpHelper = require(Parent.NotificationsCommon).ixpHelper
local StreamNotificationUXSettingsGearVariant = game:DefineFastString("StreamNotificationUXSettingsGearVariant", "enableStreamSettingsGear")

local function _() --[[ Line: 17 | Named "getLayerVariables" ]]
	-- upvalues: IxpHelper (copy), GetFStringNotificationsStreamNotificationUXLayerFunction (copy)
	return IxpHelper.getIxpLayerData(GetFStringNotificationsStreamNotificationUXLayerFunction())
end

local _ = function(): boolean --[[ Line: 21 | Named "getIsUserInTreatment" ]]
	-- upvalues: IxpHelper (copy), GetFStringNotificationsStreamNotificationUXLayerFunction (copy), StreamNotificationUXSettingsGearVariant (copy)
	local IxpLayerData = IxpHelper.getIxpLayerData(GetFStringNotificationsStreamNotificationUXLayerFunction())
	
	return if IxpLayerData and IxpLayerData[StreamNotificationUXSettingsGearVariant] ~= nil then IxpLayerData[StreamNotificationUXSettingsGearVariant] == true else false
end

return {
	getSettingsGearEnabled = function(): boolean --[[ Line: 31 ]]
		-- upvalues: FFlagStreamNotificationUXSettingsHeader (copy), IxpHelper (copy), GetFStringNotificationsStreamNotificationUXLayerFunction (copy), StreamNotificationUXSettingsGearVariant (copy)
		local FFlagStreamNotificationUXSettingsHeader1: boolean = FFlagStreamNotificationUXSettingsHeader
		
		if FFlagStreamNotificationUXSettingsHeader1 then
			local IxpLayerData = IxpHelper.getIxpLayerData(GetFStringNotificationsStreamNotificationUXLayerFunction())
			
			if IxpLayerData and IxpLayerData[StreamNotificationUXSettingsGearVariant] ~= nil then
				return IxpLayerData[StreamNotificationUXSettingsGearVariant] == true
			end
			FFlagStreamNotificationUXSettingsHeader1 = false
		end
		return FFlagStreamNotificationUXSettingsHeader1
	end
}