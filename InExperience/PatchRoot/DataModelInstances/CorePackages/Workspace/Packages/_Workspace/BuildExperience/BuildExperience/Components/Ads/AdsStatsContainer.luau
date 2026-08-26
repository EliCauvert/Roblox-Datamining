local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local adsStatsViewModule = require(script.Parent.AdsStatsView)
local useAdsStatsPageViewModelModule = require(script.Parent.useAdsStatsPageViewModel)
local _ = require(script.Parent.useGetAdCampaigns)
local _ = require(script.Parent.useGetCampaignStats)

return function(p1)
	-- upvalues: useAdsStatsPageViewModelModule (ref), reactModule (ref), adsStatsViewModule (ref)
	return reactModule.createElement(adsStatsViewModule, useAdsStatsPageViewModelModule(p1.universeId, p1.adCampaignsStore, p1.campaignStatsStore))
end