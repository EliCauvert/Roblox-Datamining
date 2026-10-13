local httpService = game:GetService("HttpService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local getAdsCampaignDeepLinkStoreModule = require(buildExperience.Stores.GetAdsCampaignDeepLinkStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1)
	-- upvalues: httpService (ref), getAdsCampaignDeepLinkStoreModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = httpService:GenerateGUID(false)
	getAdsCampaignDeepLinkStoreModule(false).begin(var1, p1)
	sendBuildExperienceEventModule("AD_CAMPAIGN_DEEP_LINK_RECEIVED", { universeId = p1 }, { requestId = var1 })
end