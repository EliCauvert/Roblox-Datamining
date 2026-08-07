local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2, p3, p4) --[[ line: 19 ]]
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p1) == "string", "invalid country code in set phone number")
	assert(type(p2) == "string", "invalid prefix in set phone number")
	assert(type(p3) == "string", "invalid phone number in set phone number")
	assert(if type(p4) ~= "string" then p4 == nil else true, "invalid password in set phone number")
	
	return p0(urlBuilder.fromString("accountinformation:phone")(), "POST", {
		postBody = httpService:JSONEncode({ password = p4, countryCode = p1, prefix = p2, phone = p3 })
	})
end