local SignalsModule = require(script:FindFirstAncestor("IAPExperience").Parent.Signals)
local Signal, Signal2 = SignalsModule.createSignal(nil)
local Signal1, Signal2_1 = SignalsModule.createSignal(false)

return {
	setTrigger = function(p1)
		-- upvalues: Signal2 (copy)
		Signal2(p1)
	end,
	setActive = function(p1)
		-- upvalues: Signal2_1 (copy)
		Signal2_1(p1)
	end,
	reset = function()
		-- upvalues: Signal2 (copy), Signal2_1 (copy)
		Signal2(nil)
		Signal2_1(false)
	end,
	isOpen = function()
		-- upvalues: Signal1 (copy)
		return Signal1(false)
	end,
	ownsInput = function(Ancestor)
		-- upvalues: Signal1 (copy), Signal (copy)
		if Signal1(false) then
			return true
		else
			local SignalResult = Signal(false)
			
			return SignalResult ~= nil and Ancestor ~= nil and (Ancestor == SignalResult or Ancestor:IsDescendantOf(SignalResult))
		end
	end
}