local SignalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getMessageId = Signal,
		setReplyingTo = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		clear = function()
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end