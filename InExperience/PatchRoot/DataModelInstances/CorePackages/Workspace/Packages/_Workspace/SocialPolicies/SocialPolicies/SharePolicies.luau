local IsSubjectToDesktopPoliciesFunction = require(script.Parent.Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p1)
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy)
	return {
		getAccountProviderName = function()
			-- upvalues: p1 (copy)
			return p1.AccountProviderName or ""
		end,
		shouldShowGameDetailsShareButton = function()
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
			return not IsSubjectToDesktopPoliciesFunction() and (p1.GameDetailsShareButton or false)
		end,
		shouldShowCatalogShareButton = function()
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
			return not IsSubjectToDesktopPoliciesFunction() and (p1.CatalogShareButton or false)
		end,
		shouldShareToAccountProvider = function()
			-- upvalues: p1 (copy)
			return p1.ShareToAccountProvider or false
		end,
		shouldInviteFromAccountProvider = function()
			-- upvalues: p1 (copy)
			return p1.InviteFromAccountProvider or false
		end,
		getShareToAccountProviderTimeout = function()
			-- upvalues: p1 (copy)
			return p1.ShareToAccountProviderTimeout or 5
		end
	}
end