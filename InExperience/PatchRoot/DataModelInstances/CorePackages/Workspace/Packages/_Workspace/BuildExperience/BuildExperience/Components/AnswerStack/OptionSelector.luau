local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

return function(Frame: Frame) --[[ Line: 24 | Named "OptionSelector" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), config (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local IsIsSelected = Frame.isSelected == true
	local SelectionStyle = Frame.selectionStyle or "committed"
	local IsIntermediate: boolean = IsIsSelected and SelectionStyle == "intermediate"
	local Element = ReactModule.createElement(View, {
		ZIndex = 3,
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated,
		stateLayer = if IsIsSelected and SelectionStyle == "committed" then config else nil,
		testId = Frame.testId,
		tag = if IsIntermediate then "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-contrast radius-large bg-surface-0" else "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0"
	}, {
		Content = ReactModule.createElement(View, { LayoutOrder = 1, tag = "col size-full-0 auto-y" }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-small text-wrap text-align-x-left content-emphasis",
				Text = Frame.title
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = Frame.description
			})
		})
	})
	
	return if IsIsSelected and SelectionStyle == "committed" then ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Card = ReactModule.cloneElement(Element, { LayoutOrder = 1 }),
		StackLayers = ReactModule.createElement(View, { LayoutOrder = 2, tag = "size-full-400", ZIndex = 1 }, {
			FirstLayer = ReactModule.createElement(View, {
				tag = "stroke-standard stroke-default radius-medium bg-surface-0",
				ZIndex = 2,
				Position = UDim2.new(0, UseTokensResult.Size.Size_400, 0, -UseTokensResult.Size.Size_200),
				Size = UDim2.new(1, -2 * UseTokensResult.Size.Size_400, 0, UseTokensResult.Size.Size_400)
			}),
			SecondLayer = ReactModule.createElement(View, {
				tag = "stroke-standard stroke-default radius-medium bg-surface-0",
				ZIndex = 1,
				Position = UDim2.new(0, UseTokensResult.Size.Size_800, 0, 0),
				Size = UDim2.new(1, -2 * UseTokensResult.Size.Size_800, 0, UseTokensResult.Size.Size_400)
			})
		})
	}) else Element
end