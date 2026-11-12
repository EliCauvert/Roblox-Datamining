local Moments = script:FindFirstAncestor("Moments")
local ConstantsModule = require(Moments.Constants)
local Default = require(Moments.Parent.ToastNotificationsProtocol).ToastNotificationProtocol.default

return {
	listen = function(Callback)
		-- upvalues: Default (copy), ConstantsModule (copy)
		local ListenToDisplayNotificationResult = Default:listenToDisplayNotification(function(p1)
			-- upvalues: ConstantsModule (upval), Callback (copy)
			if type(p1) ~= "table" then return end
			if p1.notificationType == ConstantsModule.PostStatusToastNotificationType then
				Callback(p1)
			end
		end)
		
		return function()
			-- upvalues: ListenToDisplayNotificationResult (copy)
			ListenToDisplayNotificationResult:Disconnect()
		end
	end,
	dismiss = function(p1)
		-- upvalues: Default (copy)
		local NotificationId = p1.notificationId
		
		if NotificationId ~= nil then
			Default:dismissNotification(NotificationId)
		end
	end,
	isFailure = function(p1): boolean
		local Content = p1.content
		local ClientEventsPayload = if Content == nil or Content.clientEventsPayload == nil then p1.clientEventsPayload else Content.clientEventsPayload
		
		return type(ClientEventsPayload) == "table" and ClientEventsPayload.status == "failure"
	end
}