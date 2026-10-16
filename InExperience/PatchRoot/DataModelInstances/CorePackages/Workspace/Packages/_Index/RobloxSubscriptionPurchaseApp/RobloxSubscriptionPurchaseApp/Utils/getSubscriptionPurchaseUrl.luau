local ContentProvider = game:GetService("ContentProvider")
local FFlagEnablePlusReferralLandingSheet = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet

return function(p1, p2, p3): string --[[ Line: 7 | Named "getSubscriptionPurchaseUrl" ]]
	-- upvalues: ContentProvider (copy), FFlagEnablePlusReferralLandingSheet (copy)
	local BaseUrl = ContentProvider.BaseUrl
	local Formatted: string = if p2 then string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s&paymentSessionId=%s", BaseUrl, p1, p2) else string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s", BaseUrl, p1)
	
	if FFlagEnablePlusReferralLandingSheet and p3 then
		Formatted ..= "&referrerId=" .. tostring(p3)
	end
	return Formatted
end