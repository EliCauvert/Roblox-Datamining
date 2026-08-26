local corePackagesService = game:GetService("CorePackages")
local policyProviderModule = require(corePackagesService.Packages.PolicyProvider)
local fFlagShowGameAgeRating = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local var1 = policyProviderModule.withGetPolicyImplementation(policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy"))

function var2.Mapper(p1)
	-- upvalues: fFlagShowGameAgeRating (ref)
	return {
		showBadgeOver12 = if not fFlagShowGameAgeRating then function()
			-- upvalues: p1 (ref)
			return p1.ShowBadgeOver12 or false
		end else nil
	}
end

return var1