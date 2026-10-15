local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local goalMetricDeltaPillModule = require(script.Parent.GoalMetricDeltaPill)
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), skeleton (ref), radius (ref), icon (ref), iconSize (ref), goalMetricDeltaPillModule (ref)
	local testId = p1.testId or "GoalMetricRowView"
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Title = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			Text = p1.title,
			testId = `{testId}-title`
		}),
		Value = if p1.isLoading then reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, useTokens().Size.Size_500),
			radius = radius.Small,
			testId = `{testId}-loading`
		}) else reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, {
			Icon = if p1.icon then reactModule.createElement(icon, {
				LayoutOrder = 1,
				tag = "content-emphasis",
				name = p1.icon,
				size = iconSize.Medium,
				testId = `{testId}-icon`
			}) else nil,
			Value = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p1.valueText,
				testId = `{testId}-value`
			}),
			Delta = if p1.deltaText ~= nil then nil else reactModule.createElement(goalMetricDeltaPillModule, {
				layoutOrder = 3,
				text = p1.deltaText,
				isPositive = p1.isDeltaPositive == true,
				testId = `{testId}-delta`
			})
		})
	})
end