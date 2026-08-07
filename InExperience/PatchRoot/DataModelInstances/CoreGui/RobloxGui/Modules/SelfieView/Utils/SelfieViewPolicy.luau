local policyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local var1 = policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")
local var2 = policyProviderModule.withGetPolicyImplementation(var1)

function var2.Mapper(p0) --[[ line: 7 ]]
	return {
		eligibleForSelfieViewFeature = function() --[[ line: 9 ]]
			-- upvalues: p0 (ref)
			return p0.EligibleForSelfieViewFeature or false
		end
	}
end

var2.PolicyImplementation = var1

return var2