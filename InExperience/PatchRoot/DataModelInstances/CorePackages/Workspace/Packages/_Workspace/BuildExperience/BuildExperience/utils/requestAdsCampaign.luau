local HttpService = game:GetService("HttpService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local GetAdsCampaignDeepLinkStoreModule = require(BuildExperience.Stores.GetAdsCampaignDeepLinkStore)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function(UniverseId)
	-- upvalues: HttpService (copy), GetAdsCampaignDeepLinkStoreModule (copy), SendBuildExperienceEventModule (copy)
	local Guid = HttpService:GenerateGUID(false)
	GetAdsCampaignDeepLinkStoreModule(false).begin(Guid, UniverseId)
	SendBuildExperienceEventModule("AD_CAMPAIGN_DEEP_LINK_RECEIVED", { universeId = UniverseId }, { requestId = Guid })
end