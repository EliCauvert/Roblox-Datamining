local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("PhoneUpsell").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref), httpService (ref)
	return p1(string.format("%supsellcard/trial-opt-in", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({ upsellCardType = p2 })
	})
end