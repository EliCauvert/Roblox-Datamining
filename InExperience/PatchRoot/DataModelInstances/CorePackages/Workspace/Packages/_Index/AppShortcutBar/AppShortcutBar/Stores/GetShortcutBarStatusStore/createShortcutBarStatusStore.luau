local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function()
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(0)
	
	return {
		getShortcutBarVisible = var1,
		setShortcutBarVisible = var2,
		useShortcutBarVisible = function()
			-- upvalues: signalsReactModule (copy), var1 (ref)
			return signalsReactModule.useSignalState(var1)
		end,
		getShortcutBarReservedHeight = var3,
		setShortcutBarReservedHeight = var4
	}
end