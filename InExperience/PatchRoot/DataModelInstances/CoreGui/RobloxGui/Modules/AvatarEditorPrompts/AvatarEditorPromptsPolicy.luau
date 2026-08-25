local policyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local var1 = policyProviderModule.withGetPolicyImplementation(policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy"))

function var1.Mapper(p0)
	return {
		getCustomOutfitNames = function()
			-- upvalues: p0 (ref)
			return p0.CustomCostumeNames == nil or p0.CustomCostumeNames
		end
	}
end

return var1