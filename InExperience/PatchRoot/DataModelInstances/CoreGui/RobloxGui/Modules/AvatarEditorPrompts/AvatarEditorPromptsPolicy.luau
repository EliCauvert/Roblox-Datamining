local PolicyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation((PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")))

function WithGetPolicyImplementationResult.Mapper(p1) --[[ Line: 11 ]]
	return {
		getCustomOutfitNames = function() --[[ Line: 13 ]]
			-- upvalues: p1 (copy)
			return p1.CustomCostumeNames == nil or p1.CustomCostumeNames
		end
	}
end

return WithGetPolicyImplementationResult