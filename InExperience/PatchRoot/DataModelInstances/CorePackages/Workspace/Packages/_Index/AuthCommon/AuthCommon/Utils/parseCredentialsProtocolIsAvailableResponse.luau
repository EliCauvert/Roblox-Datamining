local getFFlagLuaAppSignupPasskeyAvailabilityPreflight = require(script:FindFirstAncestor("AuthCommon").Parent.SharedFlags).GetFFlagLuaAppSignupPasskeyAvailabilityPreflight

return function(p1)
	-- upvalues: getFFlagLuaAppSignupPasskeyAvailabilityPreflight (ref)
	local isAvailable_1, supportsDeviceBoundOnly
	local _ = false
	local _ = false
	local var1 = true
	local isAvailable = false
	local var2 = false
	
	if p1.FIDO2 == nil then
		isAvailable_1 = p1.isAvailable or false
		supportsDeviceBoundOnly = p1.supportsDeviceBoundOnly or false
	else
		isAvailable_1 = p1.FIDO2.isAvailable
		supportsDeviceBoundOnly = p1.FIDO2.supportsDeviceBoundOnly
		
		if getFFlagLuaAppSignupPasskeyAvailabilityPreflight() then
			var1 = p1.FIDO2.supportsPasskeyCreationOnDevice ~= false
		end
		var2 = true
	end
	if p1.password ~= nil then
		isAvailable = p1.password.isAvailable
	end
	return {
		fido2Available = isAvailable_1,
		fido2SupportsDeviceBoundOnly = supportsDeviceBoundOnly,
		fido2SupportsPasskeyCreationOnDevice = var1,
		passwordsAvailable = isAvailable,
		v2InterfaceSupported = var2
	}
end