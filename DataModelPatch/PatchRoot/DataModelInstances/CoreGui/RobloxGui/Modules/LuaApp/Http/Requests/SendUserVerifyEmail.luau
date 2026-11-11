local UrlBuilder = require(game:GetService("CorePackages").Packages.UrlBuilder).UrlBuilder

return function(Callback)
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.static.email.sendVerificationEmail(), "POST", { postBody = "{}" })
end