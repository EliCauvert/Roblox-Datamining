local SignalModule = require(script:FindFirstAncestor("ViewRecycler").Parent.Signal)

return function()
	-- upvalues: SignalModule (copy)
	local Signal, Signal2 = SignalModule.createSignal()
	
	return {
		fire = function(...)
			-- upvalues: Signal2 (copy)
			Signal2(table.pack(...))
		end,
		connect = function(Callback)
			-- upvalues: Signal (copy)
			local SubscribeResult = Signal:subscribe(function(p1)
				-- upvalues: Callback (copy)
				Callback(table.unpack(p1, 1, p1.n))
			end)
			
			return function()
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:unsubscribe()
			end
		end
	}
end