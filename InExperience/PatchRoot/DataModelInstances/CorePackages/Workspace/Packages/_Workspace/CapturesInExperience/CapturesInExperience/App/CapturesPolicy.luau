local policyProviderModule = require(script.Parent.Parent.Parent.PolicyProvider)
local var1 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local var2 = policyProviderModule.withGetPolicyImplementation(var1)

function var2.Mapper(p0)
	return {
		eligibleForCapturesFeature = function()
			-- upvalues: p0 (ref)
			return p0.EligibleForCapturesFeature or false
		end,
		eligibleForVideoCapture = function()
			-- upvalues: p0 (ref)
			return p0.EligibleForVideoCapture or false
		end,
		enableCapturesBulkManagement = function()
			-- upvalues: p0 (ref)
			return p0.EnableCapturesBulkManagement or false
		end,
		enableShareCaptureCTA = function()
			-- upvalues: p0 (ref)
			return p0.EnableShareCaptureCTA or false
		end,
		hasVideoCaptureCapability = function()
			-- upvalues: p0 (ref)
			return p0.HasVideoCaptureCapability or false
		end
	}
end

var2.PolicyImplementation = var1

return var2