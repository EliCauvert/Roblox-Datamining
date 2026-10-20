local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	
	return {
		getActiveTarget = Signal,
		useActiveTarget = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		setActiveTarget = Signal2
	}
end)