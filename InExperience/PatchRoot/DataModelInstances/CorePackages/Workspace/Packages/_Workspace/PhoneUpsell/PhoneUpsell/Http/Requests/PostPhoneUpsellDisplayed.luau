local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("PhoneUpsell").Parent.UrlBuilder).UrlBuilder

return function(p0, p1, p2, p3, p4)
	-- upvalues: httpService (ref), urlBuilder (ref)
	local var1 = httpService:JSONEncode({ layerName = p1, displayTime = p2, userIgnored = p3 })
	
	return p0(urlBuilder.fromString("apis:upsellcard/v1/phone-verification/display-time")(), "POST", if p4 then { postBody = var1 } else var1)
end