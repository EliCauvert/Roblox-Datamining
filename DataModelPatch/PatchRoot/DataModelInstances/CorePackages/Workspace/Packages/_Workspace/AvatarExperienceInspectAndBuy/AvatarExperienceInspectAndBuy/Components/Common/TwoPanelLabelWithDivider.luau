local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		LabelContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y size-full-0 row align-x-center align-y-center gap-small flex-x-between",
			LayoutOrder = 1
		}, {
			LeftLabel = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-default text-align-x-left",
				Text = Frame.labelProps.leftLabel
			}),
			RightLabel = if type(Frame.labelProps.rightLabel) == "string" then ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-title-medium content-default text-align-x-right",
				Text = Frame.labelProps.rightLabel
			}) else Frame.labelProps.rightLabel
		}),
		Divider = if Frame.showDivider then ReactModule.createElement(FoundationModule.Divider, {
			LayoutOrder = 2,
			Orientation = Enum.FillDirection.Horizontal,
			Size = UDim2.new(1, 0, 0, 1)
		}) else nil
	})
end