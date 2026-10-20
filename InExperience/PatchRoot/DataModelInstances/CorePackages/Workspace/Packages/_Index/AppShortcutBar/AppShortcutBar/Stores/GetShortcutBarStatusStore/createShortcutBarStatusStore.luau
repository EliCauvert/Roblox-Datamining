local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	
	return {
		getShortcutBarVisible = Signal,
		setShortcutBarVisible = Signal2,
		useShortcutBarVisible = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		getShortcutBarReservedHeight = Signal1,
		setShortcutBarReservedHeight = Signal2_1
	}
end