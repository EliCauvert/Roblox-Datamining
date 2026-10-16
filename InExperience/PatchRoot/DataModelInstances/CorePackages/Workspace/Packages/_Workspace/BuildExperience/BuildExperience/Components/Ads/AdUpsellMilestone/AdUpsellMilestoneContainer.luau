local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local AdUpsellMilestoneViewModule = require(script.Parent.AdUpsellMilestoneView)
local UseAdUpsellMilestoneViewModelModule = require(script.Parent.useAdUpsellMilestoneViewModel)

return function(p1) --[[ Line: 11 | Named "AdUpsellMilestoneContainer" ]]
	-- upvalues: UseAdUpsellMilestoneViewModelModule (copy), ReactModule (copy), AdUpsellMilestoneViewModule (copy)
	return ReactModule.createElement(AdUpsellMilestoneViewModule, (UseAdUpsellMilestoneViewModelModule(p1)))
end