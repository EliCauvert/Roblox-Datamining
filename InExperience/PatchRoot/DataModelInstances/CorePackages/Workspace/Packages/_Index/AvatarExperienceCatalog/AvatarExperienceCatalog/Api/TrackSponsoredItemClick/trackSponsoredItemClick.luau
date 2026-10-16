local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.Http).Url

return function(Callback, EncryptedAdTrackingData) --[[ Line: 10 | Named "trackSponsoredItemClick" ]]
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%sv2/tracking/click", Url.AD_CONFIGURATION_URL), "POST", {
		postBody = HttpService:JSONEncode({
			campaignTargetType = "Asset",
			placementLocation = "AvatarShop",
			encryptedAdTrackingData = EncryptedAdTrackingData
		})
	})
end