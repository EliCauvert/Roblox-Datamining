local Parent = script:FindFirstAncestor("Drawer").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	
	return {
		getDrawerVisible = Signal,
		setDrawerVisible = function(p1)
			-- upvalues: Signal2 (copy), Signal2_1 (copy)
			Signal2(p1)
			
			if p1 then
				Signal2_1(true)
			end
		end,
		setDrawerShouldMount = Signal2_1,
		useDrawerVisible = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		useDrawerShouldMount = function()
			-- upvalues: SignalsReactModule (upval), Signal1 (copy)
			return SignalsReactModule.useSignalState(Signal1)
		end
	}
end