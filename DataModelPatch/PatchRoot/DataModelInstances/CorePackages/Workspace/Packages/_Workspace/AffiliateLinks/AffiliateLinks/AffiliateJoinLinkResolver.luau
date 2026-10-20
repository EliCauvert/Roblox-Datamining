local Parent = script:FindFirstAncestor("AffiliateLinks").Parent
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)

return {
	resolveReferralCode = function(Callback, ReferralCode)
		-- upvalues: Url (copy)
		return Callback(string.format("%saffiliate-links/v1/links/resolve?%s", Url.APIS_URL, (Url:makeQueryString({ referralCode = ReferralCode }))), "GET")
	end
}