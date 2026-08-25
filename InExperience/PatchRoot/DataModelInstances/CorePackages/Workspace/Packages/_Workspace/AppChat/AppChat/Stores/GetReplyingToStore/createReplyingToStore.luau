local signalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getMessageId = var1,
		setReplyingTo = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		clear = function()
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end