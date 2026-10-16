local GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction = require(script:FindFirstAncestor("AuthCommon").Parent.SharedFlags).GetFFlagLuaAppSignupPasskeyAvailabilityPreflight

return function(p1) --[[ Line: 6 ]]
	-- upvalues: GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction (copy)
	local IsSupportsPasskeyCreationOnDevice = true
	local IsAvailable = false
	local V2InterfaceSupported = false
	local IsAvailable1 = nil
	local SupportsDeviceBoundOnly = nil
	
	if p1.FIDO2 == nil then
		IsAvailable1 = p1.isAvailable or false
		SupportsDeviceBoundOnly = p1.supportsDeviceBoundOnly or false
	else
		IsAvailable1 = p1.FIDO2.isAvailable
		SupportsDeviceBoundOnly = p1.FIDO2.supportsDeviceBoundOnly
		
		if GetFFlagLuaAppSignupPasskeyAvailabilityPreflightFunction() then
			IsSupportsPasskeyCreationOnDevice = p1.FIDO2.supportsPasskeyCreationOnDevice ~= false
		end
		V2InterfaceSupported = true
	end
	if p1.password ~= nil then
		IsAvailable = p1.password.isAvailable
	end
	return {
		fido2Available = IsAvailable1,
		fido2SupportsDeviceBoundOnly = SupportsDeviceBoundOnly,
		fido2SupportsPasskeyCreationOnDevice = IsSupportsPasskeyCreationOnDevice,
		passwordsAvailable = IsAvailable,
		v2InterfaceSupported = V2InterfaceSupported
	}
end