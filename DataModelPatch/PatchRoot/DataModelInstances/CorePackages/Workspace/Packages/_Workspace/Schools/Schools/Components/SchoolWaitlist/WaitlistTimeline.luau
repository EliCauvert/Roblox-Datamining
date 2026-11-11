local Parent = script:FindFirstAncestor("Schools").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(script.Parent.waitlistVariants)
local WaitlistTimelineStageModule = require(script.Parent.WaitlistTimelineStage)

return function(Frame)
	-- upvalues: ReactModule (copy), WaitlistTimelineStageModule (copy), View (copy)
	local Stages = Frame.stages
	local Elements = {}
	
	for LayoutOrder, stage in Stages do
		Elements["Stage" .. LayoutOrder] = ReactModule.createElement(WaitlistTimelineStageModule, {
			LayoutOrder = LayoutOrder,
			stage = stage,
			remainingCount = Frame.remainingCount,
			isFirst = LayoutOrder == 1,
			isLast = LayoutOrder == #Stages
		})
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y padding-medium radius-medium bg-surface-100",
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end