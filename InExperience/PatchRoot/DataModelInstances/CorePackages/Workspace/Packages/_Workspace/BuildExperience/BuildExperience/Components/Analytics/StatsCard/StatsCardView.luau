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

return function(p0)
	-- upvalues: useTokens (ref), iconName (ref), iconPosition (ref), reactModule (ref), view (ref), text (ref), icon (ref), iconSize (ref), iconVariant (ref)
	local var2 = useTokens()
	local testId = p0.testId or "StatsCardView"
	local var4 = if p0.isDeltaPositive then var2.Color.System.Success else var2.Color.Content.Default
	local var5 = if p0.isDeltaPositive then iconName.ArrowWideShortUp else iconName.ArrowWideShortDown
	local var6 = (p0.statIconPosition or iconPosition.Left) == iconPosition.Left
	local var7 = (p0.deltaIconPosition or iconPosition.Left) == iconPosition.Left
	
	return reactModule.createElement(view, {
		tag = "col gap-xsmall size-full-0 auto-y padding-large stroke-standard stroke-default radius-large clip",
		LayoutOrder = p0.layoutOrder,
		testId = testId,
		onActivated = p0.onActivated
	}, {
		Header = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
				Text = p0.title,
				testId = `{testId}-title`
			})
		}),
		StatRow = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, {
			Stat = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-xsmall auto-xy"
			}, {
				Icon = if p0.statIcon then reactModule.createElement(icon, {
					tag = "content-emphasis",
					LayoutOrder = if var6 then 1 else 2,
					name = p0.statIcon,
					size = iconSize.Small,
					testId = `{testId}-stat-icon`
				}) else nil,
				Value = reactModule.createElement(text, {
					tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
					LayoutOrder = if var6 then 2 else 1,
					Text = p0.statText,
					testId = `{testId}-stat`
				})
			}),
			Delta = if p0.deltaText ~= nil then nil else reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
					["bg-shift-200"] = not p0.isDeltaPositive
				},
				backgroundStyle = if p0.isDeltaPositive then {
					Color3 = var2.Color.System.Success.Color3,
					Transparency = var2.Color.Shift.Shift_300.Transparency
				} else nil,
				testId = `{testId}-delta`
			}, {
				Arrow = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = var5,
					size = iconSize.XSmall,
					variant = iconVariant.Filled,
					style = var4
				}),
				Icon = if p0.deltaIcon then reactModule.createElement(icon, {
					tag = "content-default",
					LayoutOrder = if var7 then 2 else 3,
					name = p0.deltaIcon,
					size = iconSize.XSmall,
					testId = `{testId}-delta-icon`
				}) else nil,
				Value = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-left content-default",
					LayoutOrder = if var7 then 3 else 2,
					Text = p0.deltaText
				})
			})
		})
	})
end