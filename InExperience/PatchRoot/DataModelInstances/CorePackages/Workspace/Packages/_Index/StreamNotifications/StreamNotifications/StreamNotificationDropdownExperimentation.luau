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
		local var5 = fFlagStreamNotificationUXDropdown
		
		if var5 then
			local currentCamera = workspace.CurrentCamera
			var5 = currentCamera ~= nil and constantsModule.Modal.WidthLimit <= currentCamera.ViewportSize.X
			
			if var5 then
				local ixpLayerData = ixpHelper.getIxpLayerData(streamNotificationUXExposureLayer)
				
				if ixpLayerData and ixpLayerData[streamNotificationUXDropdownVariant] ~= nil then
					return ixpLayerData[streamNotificationUXDropdownVariant] == true
				end
				var5 = false
			end
		end
		return var5
	end,
	logExposure = function()
		-- upvalues: fFlagStreamNotificationUXDropdown (ref), constantsModule (ref), ixpHelper (ref), streamNotificationUXExposureLayer (ref), streamNotificationUXDropdownVariant (ref)
		if fFlagStreamNotificationUXDropdown then
			local currentCamera = workspace.CurrentCamera
			local var7 = currentCamera ~= nil and constantsModule.Modal.WidthLimit <= currentCamera.ViewportSize.X
			
			if var7 then
				var7 = ixpHelper.getIxpLayerData(streamNotificationUXExposureLayer)
				
				if var7 and var7[streamNotificationUXDropdownVariant] ~= nil then
					ixpHelper.logUserLayerExposure(streamNotificationUXExposureLayer)
				end
			end
		end
	end
}