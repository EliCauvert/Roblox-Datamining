local contentProviderService = game:GetService("ContentProvider")
local fFlagEnablePlusReferralLandingSheet = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.SharedFlags).FFlagEnablePlusReferralLandingSheet

return function(p1, p2, p3)
	-- upvalues: contentProviderService (ref), fFlagEnablePlusReferralLandingSheet (ref)
	local baseUrl = contentProviderService.BaseUrl
	local var1 = if p2 then string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s&paymentSessionId=%s", baseUrl, p1, p2) else string.format("%supgrades/paymentmethods?ctx=subscription&type=Blackbird&id=%s", baseUrl, p1)
	
	if fFlagEnablePlusReferralLandingSheet and p3 then
		var1 ..= "&referrerId=" .. tostring(p3)
	end
	return var1
end