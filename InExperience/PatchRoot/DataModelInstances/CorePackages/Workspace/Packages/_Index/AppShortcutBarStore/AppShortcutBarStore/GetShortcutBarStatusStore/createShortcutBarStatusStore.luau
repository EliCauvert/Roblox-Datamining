local Parent = script:FindFirstAncestor("AppShortcutBarStore").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function() --[[ Line: 15 | Named "createShortcutBarStatusStore" ]]
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	
	return {
		getShortcutBarVisible = Signal,
		setShortcutBarVisible = Signal2,
		useShortcutBarVisible = function() --[[ Line: 19 ]]
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		getShortcutBarReservedHeight = Signal1,
		setShortcutBarReservedHeight = Signal2_1
	}
end