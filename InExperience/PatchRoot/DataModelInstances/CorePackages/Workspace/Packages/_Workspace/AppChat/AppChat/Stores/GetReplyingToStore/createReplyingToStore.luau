local SignalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function() --[[ Line: 24 | Named "createReplyingToStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getMessageId = Signal,
		setReplyingTo = function(p1) --[[ Line: 27 ]]
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		clear = function() --[[ Line: 31 ]]
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end