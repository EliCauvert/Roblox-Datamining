local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local FFlagStreamNotificationUXDropdown = require(Parent.SharedFlags).FFlagStreamNotificationUXDropdown
local IxpHelper = require(Parent.NotificationsCommon).ixpHelper
local ConstantsModule = require(StreamNotifications.constants)
local StreamNotificationUXExposureLayer = game:DefineFastString("StreamNotificationUXExposureLayer", "Notifications.StreamNotificationUXExposure")
local StreamNotificationUXDropdownVariant = game:DefineFastString("StreamNotificationUXDropdownVariant", "enableStreamDropdown")

local function _(): boolean
	-- upvalues: ConstantsModule (copy)
	local CurrentCamera = workspace.CurrentCamera
	
	return CurrentCamera ~= nil and ConstantsModule.Modal.WidthLimit <= CurrentCamera.ViewportSize.X
end

local _ = function(): boolean
	-- upvalues: IxpHelper (copy), StreamNotificationUXExposureLayer (copy), StreamNotificationUXDropdownVariant (copy)
	local IxpLayerData = IxpHelper.getIxpLayerData(StreamNotificationUXExposureLayer)
	
	return if IxpLayerData and IxpLayerData[StreamNotificationUXDropdownVariant] ~= nil then IxpLayerData[StreamNotificationUXDropdownVariant] == true else false
end

return {
	getDropdownEnabled = function(): boolean
		-- upvalues: FFlagStreamNotificationUXDropdown (copy), ConstantsModule (copy), IxpHelper (copy), StreamNotificationUXExposureLayer (copy), StreamNotificationUXDropdownVariant (copy)
		local IsXAbove: boolean = FFlagStreamNotificationUXDropdown
		
		if IsXAbove then
			local CurrentCamera = workspace.CurrentCamera
			IsXAbove = CurrentCamera ~= nil and CurrentCamera.ViewportSize.X >= ConstantsModule.Modal.WidthLimit
			
			if IsXAbove then
				local IxpLayerData = IxpHelper.getIxpLayerData(StreamNotificationUXExposureLayer)
				
				if IxpLayerData and IxpLayerData[StreamNotificationUXDropdownVariant] ~= nil then
					return IxpLayerData[StreamNotificationUXDropdownVariant] == true
				end
				IsXAbove = false
			end
		end
		return IsXAbove
	end,
	logExposure = function()
		-- upvalues: FFlagStreamNotificationUXDropdown (copy), ConstantsModule (copy), IxpHelper (copy), StreamNotificationUXExposureLayer (copy), StreamNotificationUXDropdownVariant (copy)
		if FFlagStreamNotificationUXDropdown then
			local CurrentCamera = workspace.CurrentCamera
			
			if CurrentCamera ~= nil and CurrentCamera.ViewportSize.X >= ConstantsModule.Modal.WidthLimit then
				local IxpLayerData = IxpHelper.getIxpLayerData(StreamNotificationUXExposureLayer)
				
				if IxpLayerData and IxpLayerData[StreamNotificationUXDropdownVariant] ~= nil then
					IxpHelper.logUserLayerExposure(StreamNotificationUXExposureLayer)
				end
			end
		end
	end
}