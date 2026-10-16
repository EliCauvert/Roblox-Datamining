local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(Callback, CountryCode, Prefix, Phone, Password) --[[ Line: 19 ]]
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	assert(type(CountryCode) == "string", "invalid country code in set phone number")
	assert(type(Prefix) == "string", "invalid prefix in set phone number")
	assert(type(Phone) == "string", "invalid phone number in set phone number")
	assert(type(Password) == "string" or Password == nil, "invalid password in set phone number")
	
	return Callback(UrlBuilder.fromString("accountinformation:phone")(), "POST", {
		postBody = HttpService:JSONEncode({
			password = Password,
			countryCode = CountryCode,
			prefix = Prefix,
			phone = Phone
		})
	})
end