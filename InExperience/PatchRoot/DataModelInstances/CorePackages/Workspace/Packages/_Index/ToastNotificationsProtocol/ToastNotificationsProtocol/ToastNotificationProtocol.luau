local messageBusService = game:GetService("MessageBusService")
local playersService = game:GetService("Players")
local parent = script.Parent
local parent_1 = parent.Parent
local _ = require(parent.ToastNotificationProtocolTypes)
local toastNotificationProtocolConstantsModule = require(parent.ToastNotificationProtocolConstants)
local getPlatformTarget = require(parent_1.Analytics).getPlatformTarget
local t = {}
t.__index = t
game:DefineFastFlag("LuaAppInitializeToastNotificationEventParams2", false)

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.setupNotifications(_, p1)
	-- upvalues: getPlatformTarget (ref), playersService (ref), messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	if #p1 > 0 then
		local var1 = nil
		local var2 = nil
		
		if game:GetFastFlag("LuaAppInitializeToastNotificationEventParams2") then
			var2 = getPlatformTarget()
			var1 = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
		end
		messageBusService:Publish(toastNotificationProtocolConstantsModule.MESSAGE_INIT_TOAST_NOTIF, { channels = p1, userId = var1, platform = var2 })
	end
end

function t.updateNotification(_, p1, p2)
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	if p1 and p2 then
		messageBusService:Publish(toastNotificationProtocolConstantsModule.MESSAGE_UPDATE_TOAST_NOTIF, { notificationId = p1, stateName = p2 })
	end
end

function t.voltronBroadcast(_, p1, p2)
	-- upvalues: messageBusService (ref)
	if p1 then
		messageBusService:Publish(p1, p2)
	end
end

function t.dismissNotification(_, p1)
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	if p1 then
		messageBusService:Publish(toastNotificationProtocolConstantsModule.MESSAGE_DISMISS_TOAST_NOTIF, { notificationId = p1 })
	end
end

function t.listenToDisplayNotification(_, p1)
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	return messageBusService:Subscribe(toastNotificationProtocolConstantsModule.MESSAGE_DISPLAY_TOAST_NOTIF, p1, false, true)
end

function t.listenToDismissNotification(_, p1)
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	return messageBusService:Subscribe(toastNotificationProtocolConstantsModule.MESSAGE_DISMISS_TOAST_NOTIF, p1, false, true)
end

t.default = t.new()

return t