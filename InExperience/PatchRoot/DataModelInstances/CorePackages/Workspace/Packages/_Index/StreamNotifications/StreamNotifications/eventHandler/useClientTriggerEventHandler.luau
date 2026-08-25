local parent = script:FindFirstAncestor("StreamNotifications").Parent
local reactModule = require(parent.React)
local useTCStreamNotificationEventHandler = require(parent.TrustedContacts).EventHandlers.useTCStreamNotificationEventHandler

return function()
	-- upvalues: useTCStreamNotificationEventHandler (ref), reactModule (ref)
	local var1 = useTCStreamNotificationEventHandler()
	
	return reactModule.useCallback(function(p0, p1)
		-- upvalues: var1 (ref)
		if p0 == "TrustedContactsDoubleOptInModal" then
			var1({
				clientEventsPayload = p1.clientEventsPayload,
				callback = p1.callback
			})
		end
	end, { var1 })
end