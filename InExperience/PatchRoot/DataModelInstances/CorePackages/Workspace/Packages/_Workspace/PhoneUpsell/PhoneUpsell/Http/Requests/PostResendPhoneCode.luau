local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p0)
	-- upvalues: urlBuilder (ref)
	return p0(urlBuilder.fromString("accountinformation:phone/resend")(), "POST", { postBody = "" })
end