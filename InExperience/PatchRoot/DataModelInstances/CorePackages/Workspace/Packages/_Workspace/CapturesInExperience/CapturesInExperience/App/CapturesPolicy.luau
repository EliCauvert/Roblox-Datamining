local PolicyProviderModule = require(script.Parent.Parent.Parent.PolicyProvider)
local AppPolicy = PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation(AppPolicy)

function WithGetPolicyImplementationResult.Mapper(p1) --[[ Line: 9 ]]
	return {
		eligibleForCapturesFeature = function() --[[ Line: 11 ]]
			-- upvalues: p1 (copy)
			return p1.EligibleForCapturesFeature or false
		end,
		eligibleForVideoCapture = function() --[[ Line: 14 ]]
			-- upvalues: p1 (copy)
			return p1.EligibleForVideoCapture or false
		end,
		enableCapturesBulkManagement = function() --[[ Line: 17 ]]
			-- upvalues: p1 (copy)
			return p1.EnableCapturesBulkManagement or false
		end,
		enableShareCaptureCTA = function() --[[ Line: 20 ]]
			-- upvalues: p1 (copy)
			return p1.EnableShareCaptureCTA or false
		end,
		hasVideoCaptureCapability = function() --[[ Line: 23 ]]
			-- upvalues: p1 (copy)
			return p1.HasVideoCaptureCapability or false
		end
	}
end

WithGetPolicyImplementationResult.PolicyImplementation = AppPolicy

return WithGetPolicyImplementationResult