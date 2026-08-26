local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3, p4, p5)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p2) == "string", "invalid country code in set phone number")
	assert(type(p3) == "string", "invalid prefix in set phone number")
	assert(type(p4) == "string", "invalid phone number in set phone number")
	assert(if type(p5) ~= "string" then p5 == nil else true, "invalid password in set phone number")
	
	return p1(urlBuilder.fromString("accountinformation:phone")(), "POST", {
		postBody = httpService:JSONEncode({ password = p5, countryCode = p2, prefix = p3, phone = p4 })
	})
end