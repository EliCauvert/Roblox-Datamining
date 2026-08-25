local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.Hooks.useExternalChatMessageSender)

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref)
	local var2, var3 = signalsModule.createSignal(nil)
	
	return {
		getSender = var2,
		setSender = function(value)
			-- upvalues: var3 (ref)
			var3(value)
		end,
		clearSender = function()
			-- upvalues: var3 (ref)
			var3(nil)
		end
	}
end)