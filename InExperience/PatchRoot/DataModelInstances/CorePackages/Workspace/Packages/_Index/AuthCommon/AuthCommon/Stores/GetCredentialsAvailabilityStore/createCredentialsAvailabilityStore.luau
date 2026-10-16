local SignalsModule = require(script:FindFirstAncestor("AuthCommon").Parent.Signals)

return function() --[[ Line: 17 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(false)
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	
	return {
		getFido2Available = Signal,
		setFido2Available = Signal2,
		getFido2SupportsDeviceBoundOnly = Signal1,
		setFido2SupportsDeviceBoundOnly = Signal2_1,
		getPasswordsAvailable = Signal3,
		setPasswordsAvailable = Signal2_2,
		getV2InterfaceSupported = Signal4,
		setV2InterfaceSupported = Signal2_3
	}
end