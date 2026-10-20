local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconPosition = FoundationModule.Enums.IconPosition
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant

return function(p1)
	-- upvalues: UseTokensFunction (copy), IconName (copy), IconPosition (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), IconVariant (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "GoalMetricDeltaPill"
	local IsLeftMatch = (p1.iconPosition or IconPosition.Left) == IconPosition.Left
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
			["bg-shift-200"] = not p1.isPositive
		},
		backgroundStyle = if p1.isPositive then {
			Color3 = UseTokensResult.Color.System.Success.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_300.Transparency
		} else nil,
		testId = TestId
	}, {
		Arrow = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = if p1.isPositive then IconName.ArrowWideShortUp else IconName.ArrowWideShortDown,
			size = IconSize.XSmall,
			variant = IconVariant.Filled,
			style = if p1.isPositive then UseTokensResult.Color.System.Success else UseTokensResult.Color.Content.Default
		}),
		Icon = if p1.icon then ReactModule.createElement(Icon, {
			tag = "content-default",
			LayoutOrder = if IsLeftMatch then 2 else 3,
			name = p1.icon,
			size = IconSize.XSmall,
			testId = `{TestId}-icon`
		}) else nil,
		Value = ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			LayoutOrder = if IsLeftMatch then 3 else 2,
			Text = p1.text
		})
	})
end