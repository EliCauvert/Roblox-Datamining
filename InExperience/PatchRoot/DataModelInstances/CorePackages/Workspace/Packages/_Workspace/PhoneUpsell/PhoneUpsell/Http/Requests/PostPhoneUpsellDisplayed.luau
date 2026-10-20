local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(Callback, LayerName, DisplayTime, UserIgnored, p1)
	-- upvalues: HttpService (copy), UrlBuilder (copy)
	local Json = HttpService:JSONEncode({
		layerName = LayerName,
		displayTime = DisplayTime,
		userIgnored = UserIgnored
	})
	
	return Callback(UrlBuilder.fromString("apis:upsellcard/v1/phone-verification/display-time")(), "POST", if p1 then { postBody = Json } else Json)
end