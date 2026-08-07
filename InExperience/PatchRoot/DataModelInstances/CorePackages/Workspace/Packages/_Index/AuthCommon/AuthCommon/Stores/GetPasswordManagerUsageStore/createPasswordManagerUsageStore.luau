local signalsModule = require(script:FindFirstAncestor("AuthCommon").Parent.Signals)

return function() --[[ line: 16 ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(false)
	
	return {
		getLoggedinUsingSavedPassword = var1,
		setLoggedinUsingSavedPassword = var2,
		getSavedPasswordAfterLogin = var3,
		setSavedPasswordAfterLogin = var4,
		getPasswordManagerMediatedSignup = var5,
		setPasswordManagerMediatedSignup = var6,
		resetAll = function() --[[ line: 21 ]]
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2(false)
			var4(false)
			var6(false)
		end
	}
end