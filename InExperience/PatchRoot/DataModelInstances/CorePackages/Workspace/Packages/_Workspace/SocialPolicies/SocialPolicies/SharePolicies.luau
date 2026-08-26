local isSubjectToDesktopPolicies = require(script.Parent.Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p1)
	-- upvalues: isSubjectToDesktopPolicies (ref)
	return {
		getAccountProviderName = function()
			-- upvalues: p1 (ref)
			return p1.AccountProviderName or ""
		end,
		shouldShowGameDetailsShareButton = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), p1 (ref)
			return if isSubjectToDesktopPolicies() then false else p1.GameDetailsShareButton or false
		end,
		shouldShowCatalogShareButton = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), p1 (ref)
			return if isSubjectToDesktopPolicies() then false else p1.CatalogShareButton or false
		end,
		shouldShareToAccountProvider = function()
			-- upvalues: p1 (ref)
			return p1.ShareToAccountProvider or false
		end,
		shouldInviteFromAccountProvider = function()
			-- upvalues: p1 (ref)
			return p1.InviteFromAccountProvider or false
		end,
		getShareToAccountProviderTimeout = function()
			-- upvalues: p1 (ref)
			return p1.ShareToAccountProviderTimeout or 5
		end
	}
end