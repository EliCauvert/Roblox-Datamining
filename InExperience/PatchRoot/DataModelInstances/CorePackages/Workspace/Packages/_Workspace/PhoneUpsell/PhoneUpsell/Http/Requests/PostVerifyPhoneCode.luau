local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p0, p1)
	-- upvalues: urlBuilder (ref), httpService (ref)
	assert(type(p1) == "string", "invalid code in verify phone code")
	assert(not string.match(p1, "%D"), "invalid code in verify phone code")
	
	return p0(urlBuilder.fromString("accountinformation:phone/verify")(), "POST", { postBody = httpService:JSONEncode({ code = p1 }) })
end