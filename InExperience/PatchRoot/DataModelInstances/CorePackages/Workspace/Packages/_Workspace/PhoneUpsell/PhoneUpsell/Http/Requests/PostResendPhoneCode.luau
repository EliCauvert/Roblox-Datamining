local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: urlBuilder (ref)
	return p1(urlBuilder.fromString("accountinformation:phone/resend")(), "POST", { postBody = "" })
end