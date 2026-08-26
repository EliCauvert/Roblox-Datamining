local parent = script:FindFirstAncestor("StreamNotifications").Parent
local reactModule = require(parent.React)
local useTCStreamNotificationEventHandler = require(parent.TrustedContacts).EventHandlers.useTCStreamNotificationEventHandler

return function()
	-- upvalues: useTCStreamNotificationEventHandler (ref), reactModule (ref)
	local var1 = useTCStreamNotificationEventHandler()
	
	return reactModule.useCallback(function(p1, p2)
		-- upvalues: var1 (ref)
		if p1 == "TrustedContactsDoubleOptInModal" then
			var1({
				clientEventsPayload = p2.clientEventsPayload,
				callback = p2.callback
			})
		end
	end, { var1 })
end