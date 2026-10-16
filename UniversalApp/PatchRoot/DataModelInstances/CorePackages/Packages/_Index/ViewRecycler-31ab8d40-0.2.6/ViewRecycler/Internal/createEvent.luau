local SignalModule = require(script:FindFirstAncestor("ViewRecycler").Parent.Signal)

return function() --[[ Line: 15 | Named "createEvent" ]]
	-- upvalues: SignalModule (copy)
	local Signal, Signal2 = SignalModule.createSignal()
	
	return {
		fire = function(...) --[[ Line: 21 ]]
			-- upvalues: Signal2 (copy)
			Signal2(table.pack(...))
		end,
		connect = function(Callback) --[[ Line: 25 ]]
			-- upvalues: Signal (copy)
			local SubscribeResult = Signal:subscribe(function(p1) --[[ Line: 26 ]]
				-- upvalues: Callback (copy)
				Callback(table.unpack(p1, 1, p1.n))
			end)
			
			return function() --[[ Line: 29 ]]
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		end
	}
end