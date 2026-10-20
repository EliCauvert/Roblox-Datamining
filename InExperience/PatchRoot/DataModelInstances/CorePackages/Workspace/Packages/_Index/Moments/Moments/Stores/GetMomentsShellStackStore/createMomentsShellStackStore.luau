local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Count = 0
	
	return {
		getTopShellId = SignalsModule.createComputed(function(p1)
			-- upvalues: Signal (copy)
			local SignalResult = Signal(p1)
			
			return SignalResult[#SignalResult]
		end),
		pushShell = function()
			-- upvalues: Count (ref), Signal2 (copy)
			Count += 1
			local Value: number = Count
			Signal2(function(Tbl)
				-- upvalues: Value (copy)
				local Copy = table.clone(Tbl)
				table.insert(Copy, Value)
				
				return Copy
			end)
			
			return Value, function()
				-- upvalues: Signal2 (upval), Value (copy)
				Signal2(function(List)
					-- upvalues: Value (upval)
					local FoundIndex: number? = table.find(List, Value)
					
					if FoundIndex == nil then
						return List
					else
						local Copy = table.clone(List)
						table.remove(Copy, FoundIndex)
						
						return Copy
					end
				end)
			end
		end
	}
end