local Parent = script.Parent.Parent.Parent
local SignalsModule = require(Parent.Parent.Signals)
local _ = require(Parent.Types)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	
	return {
		getLatestCapture = Signal,
		getLatestCaptureFilePath = Signal1,
		setLatestCapture = function(p1, p2)
			-- upvalues: Signal2_1 (copy), Signal2 (copy)
			Signal2_1(p2)
			Signal2(p1)
		end,
		clearLatestCapture = function()
			-- upvalues: Signal2_1 (copy), Signal2 (copy)
			Signal2_1(nil)
			Signal2(nil)
		end
	}
end