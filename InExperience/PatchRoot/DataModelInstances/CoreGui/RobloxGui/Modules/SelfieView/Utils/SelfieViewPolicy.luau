local policyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local var1 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local var2 = policyProviderModule.withGetPolicyImplementation(var1)

function var2.Mapper(p1)
	return {
		eligibleForSelfieViewFeature = function()
			-- upvalues: p1 (ref)
			return p1.EligibleForSelfieViewFeature or false
		end
	}
end

var2.PolicyImplementation = var1

return var2