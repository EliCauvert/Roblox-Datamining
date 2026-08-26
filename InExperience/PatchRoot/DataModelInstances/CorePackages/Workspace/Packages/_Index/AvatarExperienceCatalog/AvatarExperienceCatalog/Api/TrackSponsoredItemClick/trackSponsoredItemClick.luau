local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref), httpService (ref)
	return p1(string.format("%sv2/tracking/click", url.AD_CONFIGURATION_URL), "POST", {
		postBody = httpService:JSONEncode({
			campaignTargetType = "Asset",
			placementLocation = "AvatarShop",
			encryptedAdTrackingData = p2
		})
	})
end