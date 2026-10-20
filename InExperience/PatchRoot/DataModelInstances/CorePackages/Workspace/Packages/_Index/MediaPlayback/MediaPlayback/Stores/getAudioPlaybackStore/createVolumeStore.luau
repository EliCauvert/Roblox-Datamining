local SignalsModule = require(script:FindFirstAncestor("MediaPlayback").Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(1)
	local Signal1, Signal2_1 = CreateSignalFunction(Signal(false))
	local Computed = CreateComputedFunction(function(p1): boolean
		-- upvalues: Signal (copy)
		return Signal(p1) <= 0
	end)
	
	return {
		getVolume = Signal,
		setVolume = function(Value: number)
			-- upvalues: Signal2 (copy)
			Signal2((math.clamp(Value, 0, 1)))
		end,
		getIsMuted = Computed,
		mute = function()
			-- upvalues: Computed (copy), Signal2_1 (copy), Signal (copy), Signal2 (copy)
			if not Computed(false) then
				Signal2_1(Signal(false))
				Signal2(0)
			end
		end,
		unmute = function()
			-- upvalues: Computed (copy), Signal2 (copy), Signal1 (copy)
			if Computed(false) then
				Signal2(Signal1(false))
			end
		end
	}
end