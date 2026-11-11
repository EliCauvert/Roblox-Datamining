local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)

return function()
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return {
		getShortcutBarVisible = Signal,
		setShortcutBarVisible = Signal2,
		useShortcutBarVisible = function()
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end
	}
end