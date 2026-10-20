local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local RoactModule = require(Modules.Common.Roact)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local NativePageWrapperModule = require(Modules.LuaApp.Components.NativePageWrapper)

return function(ScreenGui)
	-- upvalues: HttpService (copy), RoactModule (copy), NativePageWrapperModule (copy), NotificationTypeModule (copy)
	return RoactModule.createElement(NativePageWrapperModule, {
		isVisible = ScreenGui.isVisible,
		DisplayOrder = ScreenGui.DisplayOrder,
		notificationData = HttpService:JSONEncode(ScreenGui.data),
		notificationType = NotificationTypeModule.NATIVE_SHARE
	})
end