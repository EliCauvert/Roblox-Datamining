local isSubjectToDesktopPolicies = require(script.Parent.Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p0) --[[ line: 5 | named "SharePolicies" ]]
	-- upvalues: isSubjectToDesktopPolicies (ref)
	return {
		getAccountProviderName = function() --[[ line: 7 ]]
			-- upvalues: p0 (ref)
			return p0.AccountProviderName or ""
		end,
		shouldShowGameDetailsShareButton = function() --[[ line: 10 ]]
			-- upvalues: isSubjectToDesktopPolicies (copy), p0 (ref)
			return if isSubjectToDesktopPolicies() then false else p0.GameDetailsShareButton or false
		end,
		shouldShowCatalogShareButton = function() --[[ line: 17 ]]
			-- upvalues: isSubjectToDesktopPolicies (copy), p0 (ref)
			return if isSubjectToDesktopPolicies() then false else p0.CatalogShareButton or false
		end,
		shouldShareToAccountProvider = function() --[[ line: 24 ]]
			-- upvalues: p0 (ref)
			return p0.ShareToAccountProvider or false
		end,
		shouldInviteFromAccountProvider = function() --[[ line: 27 ]]
			-- upvalues: p0 (ref)
			return p0.InviteFromAccountProvider or false
		end,
		getShareToAccountProviderTimeout = function() --[[ line: 30 ]]
			-- upvalues: p0 (ref)
			return p0.ShareToAccountProviderTimeout or 5
		end
	}
end