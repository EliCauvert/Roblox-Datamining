local Parent = script:FindFirstAncestor("BuildExperience").Parent
local AdCampaignsModule = require(Parent.DataHydration.AdCampaigns)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(p1) --[[ Line: 18 | Named "useGetAdCampaigns" ]]
	-- upvalues: AdCampaignsModule (copy), UseSignalStateFunction (copy)
	local AndFetchAdCampaigns = (p1 or AdCampaignsModule.getAdCampaignsStore(false)).getAndFetchAdCampaigns()
	
	return UseSignalStateFunction(AndFetchAdCampaigns.data), (UseSignalStateFunction(AndFetchAdCampaigns.status))
end