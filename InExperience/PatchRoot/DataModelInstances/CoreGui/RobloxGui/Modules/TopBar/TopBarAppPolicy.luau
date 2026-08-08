local corePackagesService = game:GetService("CorePackages")
local policyProviderModule = require(corePackagesService.Packages.PolicyProvider)
local fFlagShowGameAgeRating = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local var2 = policyProviderModule.withGetPolicyImplementation(policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy"))

function var2.Mapper(p0) --[[ line: 10 ]]
	-- upvalues: fFlagShowGameAgeRating (ref)
	return {
		showBadgeOver12 = if not fFlagShowGameAgeRating then function() --[[ line: 13 ]]
			-- upvalues: p0 (ref)
			return p0.ShowBadgeOver12 or false
		end else nil
	}
end

return var2