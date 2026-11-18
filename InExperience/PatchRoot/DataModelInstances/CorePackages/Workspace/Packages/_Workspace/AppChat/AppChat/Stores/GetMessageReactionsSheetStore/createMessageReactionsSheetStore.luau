local SignalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getOpenSheet = Signal,
		openSheet = function(ConversationId, MessageId)
			-- upvalues: Signal2 (copy)
			Signal2({ conversationId = ConversationId, messageId = MessageId })
		end,
		closeSheet = function()
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end