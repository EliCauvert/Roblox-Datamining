local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local _ = require(Parent.AppChatNetworking)

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(0)
	
	return {
		getUnreadMessageCount = SessionScopedSignal,
		receivedConversationMetadata = function(p1)
			-- upvalues: SessionScopedSignal2 (copy)
			if p1 and p1.global_unread_message_count then
				SessionScopedSignal2(p1.global_unread_message_count)
			end
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2(0)
		end
	}
end