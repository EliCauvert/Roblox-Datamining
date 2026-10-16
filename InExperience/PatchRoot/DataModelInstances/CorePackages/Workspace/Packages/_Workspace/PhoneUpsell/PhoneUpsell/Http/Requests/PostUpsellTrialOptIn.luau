local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("PhoneUpsell").Parent.Http).Url

return function(Callback, UpsellCardType) --[[ Line: 6 ]]
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%supsellcard/trial-opt-in", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({ upsellCardType = UpsellCardType })
	})
end