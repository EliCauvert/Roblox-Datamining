local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref), skeleton (ref), radius (ref)
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
		}) else reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
			Text = p1.valueText,
			testId = `{testId}-value`
		})
	})
end