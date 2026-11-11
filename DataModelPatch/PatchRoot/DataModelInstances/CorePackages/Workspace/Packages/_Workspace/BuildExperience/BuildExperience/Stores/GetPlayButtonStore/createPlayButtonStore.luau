local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	
	return {
		getIsActive = Signal,
		useIsActive = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		setIsActive = Signal2,
		getResumeTarget = Signal1,
		useResumeTarget = function()
			-- upvalues: SignalsReactModule (upval), Signal1 (copy)
			return SignalsReactModule.useSignalState(Signal1)
		end,
		setResumeTarget = Signal2_1
	}
end