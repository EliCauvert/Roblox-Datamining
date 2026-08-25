local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.Signals)
local createSessionScopedSignal = require(parent.SignalsUtils).createSessionScopedSignal
local _ = require(parent.AppChatNetworking)

return function()
	-- upvalues: createSessionScopedSignal (ref)
	local var0, var1 = createSessionScopedSignal(0)
	
	return {
		getUnreadMessageCount = var0,
		receivedConversationMetadata = function(p0)
			-- upvalues: var1 (ref)
			if p0 and p0.global_unread_message_count then
				var1(p0.global_unread_message_count)
			end
		end,
		reset = function()
			-- upvalues: var1 (ref)
			var1(0)
		end
	}
end