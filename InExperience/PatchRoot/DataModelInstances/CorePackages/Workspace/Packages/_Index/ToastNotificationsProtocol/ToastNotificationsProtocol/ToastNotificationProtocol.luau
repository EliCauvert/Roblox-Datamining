local MessageBusService = game:GetService("MessageBusService")
local Players = game:GetService("Players")
local Parent = script.Parent
local _ = require(Parent.ToastNotificationProtocolTypes)
local ToastNotificationProtocolConstantsModule = require(Parent.ToastNotificationProtocolConstants)
local GetPlatformTargetFunction = require(Parent.Parent.Analytics).getPlatformTarget
local ToastNotificationProtocolModule = {}
ToastNotificationProtocolModule.__index = ToastNotificationProtocolModule
game:DefineFastFlag("LuaAppInitializeToastNotificationEventParams2", false)

function ToastNotificationProtocolModule.new() --[[ Line: 18 ]]
	-- upvalues: ToastNotificationProtocolModule (copy)
	return (setmetatable({}, ToastNotificationProtocolModule))
end

function ToastNotificationProtocolModule:setupNotifications(Channels) --[[ Line: 23 ]]
	-- upvalues: GetPlatformTargetFunction (copy), Players (copy), MessageBusService (copy), ToastNotificationProtocolConstantsModule (copy)
	if #Channels > 0 then
		local UserId: string? = nil
		local Platform = nil
		
		if game:GetFastFlag("LuaAppInitializeToastNotificationEventParams2") then
			Platform = GetPlatformTargetFunction()
			UserId = if Players.LocalPlayer then tostring(Players.LocalPlayer.UserId) else ""
		end
		MessageBusService:Publish(ToastNotificationProtocolConstantsModule.MESSAGE_INIT_TOAST_NOTIF, {
			channels = Channels,
			userId = UserId,
			platform = Platform
		})
	end
end

function ToastNotificationProtocolModule:updateNotification(NotificationId, StateName) --[[ Line: 39 ]]
	-- upvalues: MessageBusService (copy), ToastNotificationProtocolConstantsModule (copy)
	if NotificationId and StateName then
		MessageBusService:Publish(ToastNotificationProtocolConstantsModule.MESSAGE_UPDATE_TOAST_NOTIF, { notificationId = NotificationId, stateName = StateName })
	end
end

function ToastNotificationProtocolModule:voltronBroadcast(Mid, p1) --[[ Line: 48 ]]
	-- upvalues: MessageBusService (copy)
	if Mid then
		MessageBusService:Publish(Mid, p1)
	end
end

function ToastNotificationProtocolModule:dismissNotification(NotificationId) --[[ Line: 54 ]]
	-- upvalues: MessageBusService (copy), ToastNotificationProtocolConstantsModule (copy)
	if NotificationId then
		MessageBusService:Publish(ToastNotificationProtocolConstantsModule.MESSAGE_DISMISS_TOAST_NOTIF, { notificationId = NotificationId })
	end
end

function ToastNotificationProtocolModule:listenToDisplayNotification(Callback) --[[ Line: 62 ]]
	-- upvalues: MessageBusService (copy), ToastNotificationProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(ToastNotificationProtocolConstantsModule.MESSAGE_DISPLAY_TOAST_NOTIF, Callback, false, true)
end

function ToastNotificationProtocolModule:listenToDismissNotification(Callback) --[[ Line: 66 ]]
	-- upvalues: MessageBusService (copy), ToastNotificationProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(ToastNotificationProtocolConstantsModule.MESSAGE_DISMISS_TOAST_NOTIF, Callback, false, true)
end

ToastNotificationProtocolModule.default = ToastNotificationProtocolModule.new()

return ToastNotificationProtocolModule