local getFFlagLuaAppSignupPasskeyAvailabilityPreflight = require(script:FindFirstAncestor("AuthCommon").Parent.SharedFlags).GetFFlagLuaAppSignupPasskeyAvailabilityPreflight

return function(p0)
	-- upvalues: getFFlagLuaAppSignupPasskeyAvailabilityPreflight (ref)
	local isAvailable_1, supportsDeviceBoundOnly
	local _ = false
	local _ = false
	local var0 = true
	local isAvailable = false
	local var1 = false
	
	if p0.FIDO2 == nil then
		isAvailable_1 = p0.isAvailable or false
		supportsDeviceBoundOnly = p0.supportsDeviceBoundOnly or false
	else
		isAvailable_1 = p0.FIDO2.isAvailable
		supportsDeviceBoundOnly = p0.FIDO2.supportsDeviceBoundOnly
		
		if getFFlagLuaAppSignupPasskeyAvailabilityPreflight() then
			var0 = p0.FIDO2.supportsPasskeyCreationOnDevice ~= false
		end
		var1 = true
	end
	if p0.password ~= nil then
		isAvailable = p0.password.isAvailable
	end
	return {
		fido2Available = isAvailable_1,
		fido2SupportsDeviceBoundOnly = supportsDeviceBoundOnly,
		fido2SupportsPasskeyCreationOnDevice = var0,
		passwordsAvailable = isAvailable,
		v2InterfaceSupported = var1
	}
end