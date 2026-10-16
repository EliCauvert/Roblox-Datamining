local AppChat = script:FindFirstAncestor("AppChat")
local SignalsModule = require(AppChat.Parent.Signals)
local _ = require(AppChat.Hooks.useExternalChatMessageSender)

return SignalsModule.createComputed(function() --[[ Line: 18 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getSender = Signal,
		setSender = function(p1) --[[ Line: 21 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		clearSender = function() --[[ Line: 28 ]]
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end)