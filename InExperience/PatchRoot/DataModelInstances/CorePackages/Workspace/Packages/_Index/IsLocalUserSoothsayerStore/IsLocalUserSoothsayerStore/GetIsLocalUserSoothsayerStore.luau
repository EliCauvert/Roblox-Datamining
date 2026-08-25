local parent = script:FindFirstAncestor("IsLocalUserSoothsayerStore").Parent
local signalsUtilsModule = require(parent.SignalsUtils)

return require(parent.Signals).createComputed(function()
	-- upvalues: signalsUtilsModule (ref)
	local var1, var2 = signalsUtilsModule.createSessionScopedSignal(false)
	
	return {
		getIsLocalUserSoothsayer = var1,
		setIsLocalUserSoothsayer = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		reset = function()
			-- upvalues: var2 (ref)
			var2(false)
		end
	}
end)