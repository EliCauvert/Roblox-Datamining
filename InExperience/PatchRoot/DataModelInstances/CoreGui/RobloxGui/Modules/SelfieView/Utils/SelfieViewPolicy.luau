local PolicyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local AppPolicy = PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation(AppPolicy)

function WithGetPolicyImplementationResult.Mapper(p1) --[[ Line: 7 ]]
	return {
		eligibleForSelfieViewFeature = function() --[[ Line: 9 ]]
			-- upvalues: p1 (copy)
			return p1.EligibleForSelfieViewFeature or false
		end
	}
end

WithGetPolicyImplementationResult.PolicyImplementation = AppPolicy

return WithGetPolicyImplementationResult