local PolicyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation((PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")))

function WithGetPolicyImplementationResult.Mapper(p1)
	return {
		getDisplayVoiceBetaBadge = function()
			-- upvalues: p1 (copy)
			return p1.DisplayVoiceBetaBadge or false
		end,
		showBadgeOver12 = function()
			-- upvalues: p1 (copy)
			return p1.ShowBadgeOver12 or false
		end
	}
end

return WithGetPolicyImplementationResult