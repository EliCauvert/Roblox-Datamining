local parent = script:FindFirstAncestor("BuildExperience").Parent
local adCampaignsModule = require(parent.DataHydration.AdCampaigns)
local useSignalState = require(parent.SignalsReact).useSignalState

return function(p1)
	-- upvalues: adCampaignsModule (ref), useSignalState (ref)
	local andFetchAdCampaigns = (p1 or adCampaignsModule.getAdCampaignsStore(false)).getAndFetchAdCampaigns()
	
	return useSignalState(andFetchAdCampaigns.data), useSignalState(andFetchAdCampaigns.status)
end