local signalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function() --[[ line: 24 | named "createReplyingToStore" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	
	return {
		getMessageId = var1,
		setReplyingTo = function(value) --[[ line: 27 ]]
			-- upvalues: var2 (ref)
			var2(value)
		end,
		clear = function() --[[ line: 31 ]]
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end