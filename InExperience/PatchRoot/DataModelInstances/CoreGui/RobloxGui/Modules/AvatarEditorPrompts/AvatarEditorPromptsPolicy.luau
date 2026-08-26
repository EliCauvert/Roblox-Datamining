local policyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local var1 = policyProviderModule.withGetPolicyImplementation(policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy"))

function var1.Mapper(p1)
	return {
		getCustomOutfitNames = function()
			-- upvalues: p1 (ref)
			return p1.CustomCostumeNames == nil or p1.CustomCostumeNames
		end
	}
end

return var1