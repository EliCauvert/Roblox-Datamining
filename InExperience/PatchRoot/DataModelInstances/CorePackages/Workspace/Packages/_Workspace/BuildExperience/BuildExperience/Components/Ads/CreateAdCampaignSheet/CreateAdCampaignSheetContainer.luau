local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local createAdCampaignSheetViewModule = require(script.Parent.CreateAdCampaignSheetView)
local useCreateAdCampaignSheetViewModelModule = require(script.Parent.useCreateAdCampaignSheetViewModel)

return function(p1)
	-- upvalues: useCreateAdCampaignSheetViewModelModule (ref), reactModule (ref), createAdCampaignSheetViewModule (ref)
	return reactModule.createElement(createAdCampaignSheetViewModule, useCreateAdCampaignSheetViewModelModule(p1))
end