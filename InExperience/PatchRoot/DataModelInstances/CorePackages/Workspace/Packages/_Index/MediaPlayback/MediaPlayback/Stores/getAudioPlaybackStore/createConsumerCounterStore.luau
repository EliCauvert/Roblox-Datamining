local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local CryoModule = require(MediaPlayback.Parent.Cryo)
local SignalsModule = require(MediaPlayback.Parent.Signals)

return function() --[[ Line: 19 | Named "createConsumerCounterStore" ]]
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	
	return {
		subscribe = function(p1) --[[ Line: 22 ]]
			-- upvalues: Signal2 (copy), CryoModule (upval)
			Signal2(function(p2) --[[ Line: 23 ]]
				-- upvalues: p1 (copy), CryoModule (upval)
				return CryoModule.Dictionary.join(p2, { [p1] = (p2[p1] or 0) + 1 })
			end)
		end,
		unsubscribe = function(p1) --[[ Line: 31 ]]
			-- upvalues: Signal2 (copy), CryoModule (upval)
			local Largest = nil
			Signal2(function(p2) --[[ Line: 34 ]]
				-- upvalues: p1 (copy), Largest (ref), CryoModule (upval)
				Largest = math.max(0, (p2[p1] or 0) - 1)
				
				return CryoModule.Dictionary.join(p2, { [p1] = if Largest > 0 then Largest else CryoModule.None })
			end)
			
			return Largest
		end,
		getConsumerCounts = Signal
	}
end