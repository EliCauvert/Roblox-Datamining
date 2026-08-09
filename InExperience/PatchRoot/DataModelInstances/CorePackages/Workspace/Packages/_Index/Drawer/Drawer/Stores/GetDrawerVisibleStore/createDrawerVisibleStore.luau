local parent = script:FindFirstAncestor("Drawer").Parent
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)

return function() --[[ line: 14 | named "createDrawerVisibleStore" ]]
	-- upvalues: signalsModule (ref), signalsReactModule (ref)
	local var2, var3 = signalsModule.createSignal(false)
	local var4, var5 = signalsModule.createSignal(false)
	
	return {
		getDrawerVisible = var2,
		setDrawerVisible = function(p0) --[[ line: 26 ]]
			-- upvalues: var3 (ref), var5 (ref)
			var3(p0)
			
			if p0 then
				var5(true)
			end
		end,
		setDrawerShouldMount = var5,
		useDrawerVisible = function() --[[ line: 18 ]]
			-- upvalues: signalsReactModule (copy), var2 (ref)
			return signalsReactModule.useSignalState(var2)
		end,
		useDrawerShouldMount = function() --[[ line: 22 ]]
			-- upvalues: signalsReactModule (copy), var4 (ref)
			return signalsReactModule.useSignalState(var4)
		end
	}
end