local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local adUpsellMilestoneViewModule = require(script.Parent.AdUpsellMilestoneView)
local useAdUpsellMilestoneViewModelModule = require(script.Parent.useAdUpsellMilestoneViewModel)

return function(p1)
	-- upvalues: useAdUpsellMilestoneViewModelModule (ref), reactModule (ref), adUpsellMilestoneViewModule (ref)
	return reactModule.createElement(adUpsellMilestoneViewModule, useAdUpsellMilestoneViewModelModule(p1))
end