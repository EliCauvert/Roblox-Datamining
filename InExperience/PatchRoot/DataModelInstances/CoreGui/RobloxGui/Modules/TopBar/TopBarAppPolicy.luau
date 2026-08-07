local policyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local var1 = policyProviderModule.withGetPolicyImplementation(policyProviderModule.GetPolicyImplementations.MemStorageService("app-policy"))

function var1.Mapper(p0) --[[ line: 7 ]]
	return {
		getDisplayVoiceBetaBadge = function() --[[ line: 9 ]]
			-- upvalues: p0 (ref)
			return p0.DisplayVoiceBetaBadge or false
		end,
		showBadgeOver12 = function() --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			return p0.ShowBadgeOver12 or false
		end
	}
end

return var1