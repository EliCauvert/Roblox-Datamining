local PolicyProviderModule = require(script.Parent.Parent.Parent.PolicyProvider)
local AppPolicy = PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation(AppPolicy)

function WithGetPolicyImplementationResult.Mapper(p1)
	return {
		eligibleForCapturesFeature = function()
			-- upvalues: p1 (copy)
			return p1.EligibleForCapturesFeature or false
		end,
		eligibleForVideoCapture = function()
			-- upvalues: p1 (copy)
			return p1.EligibleForVideoCapture or false
		end,
		enableCapturesBulkManagement = function()
			-- upvalues: p1 (copy)
			return p1.EnableCapturesBulkManagement or false
		end,
		enableShareCaptureCTA = function()
			-- upvalues: p1 (copy)
			return p1.EnableShareCaptureCTA or false
		end,
		hasVideoCaptureCapability = function()
			-- upvalues: p1 (copy)
			return p1.HasVideoCaptureCapability or false
		end
	}
end

WithGetPolicyImplementationResult.PolicyImplementation = AppPolicy

return WithGetPolicyImplementationResult