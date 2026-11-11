local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(Callback, Text: string)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	assert(type(Text) == "string", "invalid code in verify phone code")
	assert(not string.match(Text, "%D"), "invalid code in verify phone code")
	
	return Callback(UrlBuilder.fromString("accountinformation:phone/verify")(), "POST", { postBody = HttpService:JSONEncode({ code = Text }) })
end