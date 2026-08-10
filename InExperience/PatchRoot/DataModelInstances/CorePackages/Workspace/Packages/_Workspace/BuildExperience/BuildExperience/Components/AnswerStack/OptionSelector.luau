local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

return function(p0) --[[ line: 24 | named "OptionSelector" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), t (ref), text (ref)
	local var3 = useTokens()
	local var4 = p0.isSelected == true
	local selectionStyle = p0.selectionStyle or "committed"
	local createElement = reactModule.createElement
	createElement = createElement(view, {
		ZIndex = 3,
		LayoutOrder = p0.LayoutOrder,
		onActivated = p0.onActivated,
		stateLayer = if var4 and selectionStyle == "committed" then t else nil,
		testId = p0.testId,
		tag = if var4 and selectionStyle == "intermediate" then "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-contrast radius-large bg-surface-0" else "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0"
	}, {
		Content = reactModule.createElement(view, { LayoutOrder = 1, tag = "col size-full-0 auto-y" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-small text-wrap text-align-x-left content-emphasis",
				Text = p0.title
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-default",
				Text = p0.description
			})
		})
	})
	
	return if var4 and selectionStyle == "committed" then reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Card = reactModule.cloneElement(createElement, { LayoutOrder = 1 }),
		StackLayers = reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-400", ZIndex = 1 }, {
			FirstLayer = reactModule.createElement(view, {
				tag = "stroke-standard stroke-default radius-medium bg-surface-0",
				ZIndex = 2,
				Position = UDim2.new(0, var3.Size.Size_400, 0, -var3.Size.Size_200),
				Size = UDim2.new(1, -2 * var3.Size.Size_400, 0, var3.Size.Size_400)
			}),
			SecondLayer = reactModule.createElement(view, {
				tag = "stroke-standard stroke-default radius-medium bg-surface-0",
				ZIndex = 1,
				Position = UDim2.new(0, var3.Size.Size_800, 0, 0),
				Size = UDim2.new(1, -2 * var3.Size.Size_800, 0, var3.Size.Size_400)
			})
		})
	}) else createElement
end