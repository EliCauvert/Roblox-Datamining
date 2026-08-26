local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p1, p2)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p2) == "string", "invalid code in verify phone code")
	assert(not string.match(p2, "%D"), "invalid code in verify phone code")
	
	return p1(urlBuilder.fromString("accountinformation:phone/verify")(), "POST", { postBody = httpService:JSONEncode({ code = p2 }) })
end