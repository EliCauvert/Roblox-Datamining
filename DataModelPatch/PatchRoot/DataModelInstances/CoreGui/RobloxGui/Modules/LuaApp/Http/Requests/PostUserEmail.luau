local HttpService = game:GetService("HttpService")
local UrlBuilder = require(game:GetService("CorePackages").Packages.UrlBuilder).UrlBuilder

return function(Callback, EmailAddress, Password)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	assert(type(EmailAddress) == "string", "invalid email address in UpdateUserEmail")
	assert(type(Password) == "string" or Password == nil, "invalid password in UpdateUserEmail")
	
	return Callback(UrlBuilder.static.email.getSetEmail(), "POST", {
		postBody = HttpService:JSONEncode({ password = Password, emailAddress = EmailAddress })
	})
end