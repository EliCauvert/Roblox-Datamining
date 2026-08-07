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

function t.new() --[[ line: 18 ]]
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.setupNotifications(_, p0) --[[ line: 23 ]]
	-- upvalues: getPlatformTarget (ref), playersService (ref), messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	if #p0 > 0 then
		local var4 = nil
		local var5 = nil
		
		if game:GetFastFlag("LuaAppInitializeToastNotificationEventParams2") then
			var5 = getPlatformTarget()
			var4 = if playersService.LocalPlayer then tostring(playersService.LocalPlayer.UserId) else ""
		end
		messageBusService:Publish(toastNotificationProtocolConstantsModule.MESSAGE_INIT_TOAST_NOTIF, { channels = p0, userId = var4, platform = var5 })
	end
end

function t.updateNotification(_, p1, p2) --[[ line: 39 ]]
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	if p1 and p2 then
		messageBusService:Publish(toastNotificationProtocolConstantsModule.MESSAGE_UPDATE_TOAST_NOTIF, { notificationId = p1, stateName = p2 })
	end
end

function t.voltronBroadcast(_, p3, p4) --[[ line: 48 ]]
	-- upvalues: messageBusService (ref)
	if p3 then
		messageBusService:Publish(p3, p4)
	end
end

function t.dismissNotification(_, p5) --[[ line: 54 ]]
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	if p5 then
		messageBusService:Publish(toastNotificationProtocolConstantsModule.MESSAGE_DISMISS_TOAST_NOTIF, { notificationId = p5 })
	end
end

function t.listenToDisplayNotification(_, p6) --[[ line: 62 ]]
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	return messageBusService:Subscribe(toastNotificationProtocolConstantsModule.MESSAGE_DISPLAY_TOAST_NOTIF, p6, false, true)
end

function t.listenToDismissNotification(_, p7) --[[ line: 66 ]]
	-- upvalues: messageBusService (ref), toastNotificationProtocolConstantsModule (ref)
	return messageBusService:Subscribe(toastNotificationProtocolConstantsModule.MESSAGE_DISMISS_TOAST_NOTIF, p7, false, true)
end

t.default = t.new()

return t