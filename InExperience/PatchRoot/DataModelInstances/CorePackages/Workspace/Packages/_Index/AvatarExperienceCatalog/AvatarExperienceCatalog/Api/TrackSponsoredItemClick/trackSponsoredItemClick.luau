local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Http).Url

return function(p0, p1) --[[ line: 10 | named "trackSponsoredItemClick" ]]
	-- upvalues: url (ref), httpService (ref)
	return p0(string.format("%sv2/tracking/click", url.AD_CONFIGURATION_URL), "POST", {
		postBody = httpService:JSONEncode({
			campaignTargetType = "Asset",
			placementLocation = "AvatarShop",
			encryptedAdTrackingData = p1
		})
	})
end