local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local _ = require(AppChat.Hooks.useExternalChatMessageSender)

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getSender = Signal,
		setSender = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		clearSender = function()
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end)