local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small",
		LayoutOrder = p1.LayoutOrder
	}, {
		LabelContainer = reactModule.createElement(foundationModule.View, {
			tag = "auto-y size-full-0 row align-x-center align-y-center gap-small flex-x-between",
			LayoutOrder = 1
		}, {
			LeftLabel = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-default text-align-x-left",
				Text = p1.labelProps.leftLabel
			}),
			RightLabel = if type(p1.labelProps.rightLabel) == "string" then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-default text-align-x-right",
				Text = p1.labelProps.rightLabel
			}) else p1.labelProps.rightLabel
		}),
		Divider = if p1.showDivider then reactModule.createElement(foundationModule.Divider, {
			LayoutOrder = 2,
			Orientation = Enum.FillDirection.Horizontal,
			Size = UDim2.new(1, 0, 0, 1)
		}) else nil
	})
end