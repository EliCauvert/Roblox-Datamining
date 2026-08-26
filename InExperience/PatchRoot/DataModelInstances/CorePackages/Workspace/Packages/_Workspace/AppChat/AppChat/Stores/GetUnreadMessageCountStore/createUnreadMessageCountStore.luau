local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local _ = require(parent.AppChatNetworking)

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var1, var2 = createSessionScopedSignal(0)
	
	return {
		getUnreadMessageCount = var1,
		receivedConversationMetadata = function(p1)
			-- upvalues: var2 (ref)
			if p1 and p1.global_unread_message_count then
				var2(p1.global_unread_message_count)
			end
		end,
		reset = function()
			-- upvalues: var2 (ref)
			var2(0)
		end
	}
end