local Parent = script:FindFirstAncestor("StreamNotifications").Parent
local ReactModule = require(Parent.React)
local UseTCStreamNotificationEventHandlerFunction = require(Parent.TrustedContacts).EventHandlers.useTCStreamNotificationEventHandler

return function()
	-- upvalues: UseTCStreamNotificationEventHandlerFunction (copy), ReactModule (copy)
	local UseTCStreamNotificationEventHandlerResult = UseTCStreamNotificationEventHandlerFunction()
	
	return (ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseTCStreamNotificationEventHandlerResult (copy)
		if p1 == "TrustedContactsDoubleOptInModal" then
			UseTCStreamNotificationEventHandlerResult({
				clientEventsPayload = p2.clientEventsPayload,
				callback = p2.callback
			})
		end
	end, { UseTCStreamNotificationEventHandlerResult }))
end