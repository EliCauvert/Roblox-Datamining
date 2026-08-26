local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.Hooks.useExternalChatMessageSender)

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getSender = var1,
		setSender = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		clearSender = function()
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end)