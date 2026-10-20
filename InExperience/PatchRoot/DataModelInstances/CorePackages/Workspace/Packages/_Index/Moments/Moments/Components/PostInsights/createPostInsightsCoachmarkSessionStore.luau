local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function() --[[ Line: 19 | Named "createPostInsightsCoachmarkSessionStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return {
		getIsHandled = Signal,
		markHandled = function() --[[ Line: 24 ]]
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end,
		reset = function() --[[ Line: 27 ]]
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end
	}
end