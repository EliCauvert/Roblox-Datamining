local IsSubjectToDesktopPoliciesFunction = require(script.Parent.Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p1) --[[ Line: 5 | Named "SharePolicies" ]]
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy)
	return {
		getAccountProviderName = function() --[[ Line: 7 ]]
			-- upvalues: p1 (copy)
			return p1.AccountProviderName or ""
		end,
		shouldShowGameDetailsShareButton = function() --[[ Line: 10 ]]
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
			return not IsSubjectToDesktopPoliciesFunction() and (p1.GameDetailsShareButton or false)
		end,
		shouldShowCatalogShareButton = function() --[[ Line: 17 ]]
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
			return not IsSubjectToDesktopPoliciesFunction() and (p1.CatalogShareButton or false)
		end,
		shouldShareToAccountProvider = function() --[[ Line: 24 ]]
			-- upvalues: p1 (copy)
			return p1.ShareToAccountProvider or false
		end,
		shouldInviteFromAccountProvider = function() --[[ Line: 27 ]]
			-- upvalues: p1 (copy)
			return p1.InviteFromAccountProvider or false
		end,
		getShareToAccountProviderTimeout = function() --[[ Line: 30 ]]
			-- upvalues: p1 (copy)
			return p1.ShareToAccountProviderTimeout or 5
		end
	}
end