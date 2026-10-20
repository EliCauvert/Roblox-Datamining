local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Http).Url

return function(Callback, CardType)
	-- upvalues: HttpService (copy), Url (copy)
	assert(Callback, "requestImpl is required")
	assert(CardType, "upsellCardType is required")
	
	return Callback(string.format("%supsellcard/dismiss", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({ cardType = CardType })
	})
end