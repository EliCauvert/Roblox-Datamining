local policyProviderModule = require(script.Parent.Parent.Parent.PolicyProvider)
local var1 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local var2 = policyProviderModule.withGetPolicyImplementation(var1)

function var2.Mapper(p1)
	return {
		eligibleForCapturesFeature = function()
			-- upvalues: p1 (ref)
			return p1.EligibleForCapturesFeature or false
		end,
		eligibleForVideoCapture = function()
			-- upvalues: p1 (ref)
			return p1.EligibleForVideoCapture or false
		end,
		enableCapturesBulkManagement = function()
			-- upvalues: p1 (ref)
			return p1.EnableCapturesBulkManagement or false
		end,
		enableShareCaptureCTA = function()
			-- upvalues: p1 (ref)
			return p1.EnableShareCaptureCTA or false
		end,
		hasVideoCaptureCapability = function()
			-- upvalues: p1 (ref)
			return p1.HasVideoCaptureCapability or false
		end
	}
end

var2.PolicyImplementation = var1

return var2