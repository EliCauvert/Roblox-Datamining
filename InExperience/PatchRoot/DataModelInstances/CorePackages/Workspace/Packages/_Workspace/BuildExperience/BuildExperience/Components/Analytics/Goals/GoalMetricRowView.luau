local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GoalMetricDeltaPillModule = require(script.Parent.GoalMetricDeltaPill)
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 28 | Named "GoalMetricRowView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy), Skeleton (copy), Radius (copy), Icon (copy), IconSize (copy), GoalMetricDeltaPillModule (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "GoalMetricRowView"
	
	return ReactModule.createElement(View, {
		tag = "col gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			Text = p1.title,
			testId = `{TestId}-title`
		}),
		Value = if p1.isLoading then ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500),
			radius = Radius.Small,
			testId = `{TestId}-loading`
		}) else ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, {
			Icon = if p1.icon then ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				tag = "content-emphasis",
				name = p1.icon,
				size = IconSize.Medium,
				testId = `{TestId}-icon`
			}) else nil,
			Value = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
				Text = p1.valueText,
				testId = `{TestId}-value`
			}),
			Delta = if p1.deltaText == nil then nil else ReactModule.createElement(GoalMetricDeltaPillModule, {
				layoutOrder = 3,
				text = p1.deltaText,
				isPositive = p1.isDeltaPositive == true,
				testId = `{TestId}-delta`
			})
		})
	})
end