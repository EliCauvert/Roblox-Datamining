local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local _ = require(appChat.Hooks.useExternalChatMessageSender)

return signalsModule.createComputed(function() --[[ line: 16 ]]
	-- upvalues: signalsModule (ref)
	local var2, var3 = signalsModule.createSignal(nil)
	
	return {
		getSender = var2,
		setSender = function(value) --[[ line: 19 ]]
			-- upvalues: var3 (ref)
			var3(value)
		end,
		clearSender = function() --[[ line: 26 ]]
			-- upvalues: var3 (ref)
			var3(nil)
		end
	}
end)