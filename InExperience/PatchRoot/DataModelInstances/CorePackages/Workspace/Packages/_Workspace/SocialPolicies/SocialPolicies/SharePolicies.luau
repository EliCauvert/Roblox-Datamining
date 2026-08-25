local isSubjectToDesktopPolicies = require(script.Parent.Parent.SharedFlags).isSubjectToDesktopPolicies

return function(p0)
	-- upvalues: isSubjectToDesktopPolicies (ref)
	return {
		getAccountProviderName = function()
			-- upvalues: p0 (ref)
			return p0.AccountProviderName or ""
		end,
		shouldShowGameDetailsShareButton = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), p0 (ref)
			return if isSubjectToDesktopPolicies() then false else p0.GameDetailsShareButton or false
		end,
		shouldShowCatalogShareButton = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), p0 (ref)
			return if isSubjectToDesktopPolicies() then false else p0.CatalogShareButton or false
		end,
		shouldShareToAccountProvider = function()
			-- upvalues: p0 (ref)
			return p0.ShareToAccountProvider or false
		end,
		shouldInviteFromAccountProvider = function()
			-- upvalues: p0 (ref)
			return p0.InviteFromAccountProvider or false
		end,
		getShareToAccountProviderTimeout = function()
			-- upvalues: p0 (ref)
			return p0.ShareToAccountProviderTimeout or 5
		end
	}
end