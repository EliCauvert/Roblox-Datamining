local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function() --[[ line: 13 | named "createShortcutBarStatusStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var2, var3 = signalsModule.createSignal(false)
	
	return {
		getShortcutBarVisible = var2,
		setShortcutBarVisible = var3,
		useShortcutBarVisible = function() --[[ line: 16 ]]
			-- upvalues: signalsReactModule (copy), var2 (ref)
			return signalsReactModule.useSignalState(var2)
		end
	}
end