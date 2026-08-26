local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local fFlagStreamNotificationUXDropdown = require(parent.SharedFlags).FFlagStreamNotificationUXDropdown
local ixpHelper = require(parent.NotificationsCommon).ixpHelper
local constantsModule = require(streamNotifications.constants)
local streamNotificationUXExposureLayer = game:DefineFastString("StreamNotificationUXExposureLayer", "Notifications.StreamNotificationUXExposure")
local streamNotificationUXDropdownVariant = game:DefineFastString("StreamNotificationUXDropdownVariant", "enableStreamDropdown")

local function _()
	-- upvalues: constantsModule (ref)
	local currentCamera = workspace.CurrentCamera
	
	return currentCamera ~= nil and constantsModule.Modal.WidthLimit <= currentCamera.ViewportSize.X
end

local _ = function()
	-- upvalues: ixpHelper (ref), streamNotificationUXExposureLayer (ref), streamNotificationUXDropdownVariant (ref)
	local ixpLayerData = ixpHelper.getIxpLayerData(streamNotificationUXExposureLayer)
	
	return if ixpLayerData and ixpLayerData[streamNotificationUXDropdownVariant] ~= nil then ixpLayerData[streamNotificationUXDropdownVariant] == true else false
end

return {
	getDropdownEnabled = function()
		-- upvalues: fFlagStreamNotificationUXDropdown (ref), constantsModule (ref), ixpHelper (ref), streamNotificationUXExposureLayer (ref), streamNotificationUXDropdownVariant (ref)
		local var1 = fFlagStreamNotificationUXDropdown
		
		if var1 then
			local currentCamera = workspace.CurrentCamera
			var1 = currentCamera ~= nil and constantsModule.Modal.WidthLimit <= currentCamera.ViewportSize.X
			
			if var1 then
				local ixpLayerData = ixpHelper.getIxpLayerData(streamNotificationUXExposureLayer)
				
				if ixpLayerData and ixpLayerData[streamNotificationUXDropdownVariant] ~= nil then
					return ixpLayerData[streamNotificationUXDropdownVariant] == true
				end
				var1 = false
			end
		end
		return var1
	end,
	logExposure = function()
		-- upvalues: fFlagStreamNotificationUXDropdown (ref), constantsModule (ref), ixpHelper (ref), streamNotificationUXExposureLayer (ref), streamNotificationUXDropdownVariant (ref)
		if fFlagStreamNotificationUXDropdown then
			local currentCamera = workspace.CurrentCamera
			local var1 = currentCamera ~= nil and constantsModule.Modal.WidthLimit <= currentCamera.ViewportSize.X
			
			if var1 then
				var1 = ixpHelper.getIxpLayerData(streamNotificationUXExposureLayer)
				
				if var1 and var1[streamNotificationUXDropdownVariant] ~= nil then
					ixpHelper.logUserLayerExposure(streamNotificationUXExposureLayer)
				end
			end
		end
	end
}