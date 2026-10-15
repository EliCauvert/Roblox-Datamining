local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconPosition = foundationModule.Enums.IconPosition
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant

return function(p1)
	-- upvalues: useTokens (ref), iconName (ref), iconPosition (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), iconVariant (ref), text (ref)
	local var1 = useTokens()
	local testId = p1.testId or "GoalMetricDeltaPill"
	local var2 = (p1.iconPosition or iconPosition.Left) == iconPosition.Left
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
			["bg-shift-200"] = not p1.isPositive
		},
		backgroundStyle = if p1.isPositive then {
			Color3 = var1.Color.System.Success.Color3,
			Transparency = var1.Color.Shift.Shift_300.Transparency
		} else nil,
		testId = testId
	}, {
		Arrow = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = if p1.isPositive then iconName.ArrowWideShortUp else iconName.ArrowWideShortDown,
			size = iconSize.XSmall,
			variant = iconVariant.Filled,
			style = if p1.isPositive then var1.Color.System.Success else var1.Color.Content.Default
		}),
		Icon = if p1.icon then reactModule.createElement(icon, {
			tag = "content-default",
			LayoutOrder = if var2 then 2 else 3,
			name = p1.icon,
			size = iconSize.XSmall,
			testId = `{testId}-icon`
		}) else nil,
		Value = reactModule.createElement(text, {
			tag = "auto-xy text-caption-small text-align-x-left content-default",
			LayoutOrder = if var2 then 3 else 2,
			Text = p1.text
		})
	})
end