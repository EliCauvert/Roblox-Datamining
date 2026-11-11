local SignalsModule = require(script:FindFirstAncestor("AuthCommon").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	
	return {
		getLoggedinUsingSavedPassword = Signal,
		setLoggedinUsingSavedPassword = Signal2,
		getSavedPasswordAfterLogin = Signal1,
		setSavedPasswordAfterLogin = Signal2_1,
		getPasswordManagerMediatedSignup = Signal3,
		setPasswordManagerMediatedSignup = Signal2_2,
		resetAll = function()
			-- upvalues: Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy)
			Signal2(false)
			Signal2_1(false)
			Signal2_2(false)
		end
	}
end