local UrlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(Callback)
	-- upvalues: UrlBuilder (copy)
	return Callback(UrlBuilder.fromString("accountinformation:phone/resend")(), "POST", { postBody = "" })
end