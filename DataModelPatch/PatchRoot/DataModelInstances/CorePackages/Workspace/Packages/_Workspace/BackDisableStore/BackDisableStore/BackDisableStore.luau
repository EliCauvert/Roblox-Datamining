local SignalsModule = require(script:FindFirstAncestor("BackDisableStore").Parent.Signals)
local CreateComputedFunction = SignalsModule.createComputed
local Signal, Signal2 = SignalsModule.createSignal(0)

return {
	getCount = Signal,
	getIsDisabled = CreateComputedFunction(function(p1): boolean
		-- upvalues: Signal (copy)
		return Signal(p1) > 0
	end),
	setDisabled = function(p1)
		-- upvalues: Signal2 (copy)
		Signal2(function(p2: number): number
			-- upvalues: p1 (copy)
			return if p1 then p2 + 1 else math.max(p2 - 1, 0)
		end)
	end,
	_resetForTesting = function()
		-- upvalues: Signal2 (copy)
		Signal2(0)
	end
}