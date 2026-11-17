local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), View (copy), StateLayerAffordance (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-top gap-xsmall size-full-0 auto-y padding-y-xxsmall",
		testId = "ChatTurnBlock.TurnWork.Header",
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.summaryRef,
		onActivated = Frame.onActivated,
		stateLayer = { affordance = StateLayerAffordance.None }
	}, {
		Marker = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center",
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500)
		}, {
			Chevron = ReactModule.createElement(Icon, {
				testId = "ChatTurnBlock.TurnWork.Header.Chevron",
				name = if Frame.isExpanded then IconName.ChevronLargeDown else IconName.ChevronLargeRight,
				size = IconSize.XSmall,
				style = UseTokensResult.Color.Content.Muted
			})
		}),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-muted",
			testId = "ChatTurnBlock.TurnWork.Header.Label",
			Text = Frame.text
		})
	})
end