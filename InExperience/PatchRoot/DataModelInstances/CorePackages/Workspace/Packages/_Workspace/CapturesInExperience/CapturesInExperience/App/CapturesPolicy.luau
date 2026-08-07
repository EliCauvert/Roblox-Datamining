local policyProviderModule = require(script.Parent.Parent.Parent.PolicyProvider)
local var1 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local var2 = policyProviderModule.withGetPolicyImplementation(var1)

function var2.Mapper(p0) --[[ line: 9 ]]
	return {
		eligibleForCapturesFeature = function() --[[ line: 11 ]]
			-- upvalues: p0 (ref)
			return p0.EligibleForCapturesFeature or false
		end,
		eligibleForVideoCapture = function() --[[ line: 14 ]]
			-- upvalues: p0 (ref)
			return p0.EligibleForVideoCapture or false
		end,
		enableCapturesBulkManagement = function() --[[ line: 17 ]]
			-- upvalues: p0 (ref)
			return p0.EnableCapturesBulkManagement or false
		end,
		enableShareCaptureCTA = function() --[[ line: 20 ]]
			-- upvalues: p0 (ref)
			return p0.EnableShareCaptureCTA or false
		end,
		hasVideoCaptureCapability = function() --[[ line: 23 ]]
			-- upvalues: p0 (ref)
			return p0.HasVideoCaptureCapability or false
		end
	}
end

var2.PolicyImplementation = var1

return var2