local CorePackages = game:GetService("CorePackages")
local PolicyProviderModule = require(CorePackages.Packages.PolicyProvider)
local FFlagShowGameAgeRating = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation((PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")))

function WithGetPolicyImplementationResult.Mapper(p1) --[[ Line: 10 ]]
	-- upvalues: FFlagShowGameAgeRating (copy)
	return {
		showBadgeOver12 = if FFlagShowGameAgeRating then nil else function() --[[ Line: 13 ]]
			-- upvalues: p1 (copy)
			return p1.ShowBadgeOver12 or false
		end
	}
end

return WithGetPolicyImplementationResult