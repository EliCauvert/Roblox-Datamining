local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("PhoneUpsell").Parent.Http).Url

return function(p0, p1)
	-- upvalues: url (ref), httpService (ref)
	return p0(string.format("%supsellcard/trial-opt-in", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({ upsellCardType = p1 })
	})
end