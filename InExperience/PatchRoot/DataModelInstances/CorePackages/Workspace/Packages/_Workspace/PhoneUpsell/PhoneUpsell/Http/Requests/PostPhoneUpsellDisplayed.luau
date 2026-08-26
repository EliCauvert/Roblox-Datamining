local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p1, p2, p3, p4, p5)
	-- upvalues: httpService (ref), urlBuilder (ref)
	local var1 = httpService:JSONEncode({ layerName = p2, displayTime = p3, userIgnored = p4 })
	
	return p1(urlBuilder.fromString("apis:upsellcard/v1/phone-verification/display-time")(), "POST", if p5 then { postBody = var1 } else var1)
end