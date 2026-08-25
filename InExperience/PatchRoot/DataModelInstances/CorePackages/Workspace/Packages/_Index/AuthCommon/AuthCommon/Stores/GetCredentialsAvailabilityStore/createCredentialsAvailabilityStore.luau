local signalsModule = require(script:FindFirstAncestor("AuthCommon").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(false)
	local var7, var8 = signalsModule.createSignal(false)
	
	return {
		getFido2Available = var1,
		setFido2Available = var2,
		getFido2SupportsDeviceBoundOnly = var3,
		setFido2SupportsDeviceBoundOnly = var4,
		getPasswordsAvailable = var5,
		setPasswordsAvailable = var6,
		getV2InterfaceSupported = var7,
		setV2InterfaceSupported = var8
	}
end