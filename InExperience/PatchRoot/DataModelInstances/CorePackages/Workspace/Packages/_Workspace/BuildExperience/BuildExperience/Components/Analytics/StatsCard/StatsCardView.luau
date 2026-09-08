local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconPosition = foundationModule.Enums.IconPosition
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local radius = foundationModule.Enums.Radius

return function(p1)
	-- upvalues: useTokens (ref), iconName (ref), iconPosition (ref), reactModule (ref), view (ref), text (ref), skeleton (ref), radius (ref), icon (ref), iconSize (ref), iconVariant (ref)
	local var1 = useTokens()
	local testId = p1.testId or "StatsCardView"
	local var2 = if p1.isDeltaPositive then var1.Color.System.Success else var1.Color.Content.Default
	local var3 = if p1.isDeltaPositive then iconName.ArrowWideShortUp else iconName.ArrowWideShortDown
	local var4 = (p1.statIconPosition or iconPosition.Left) == iconPosition.Left
	local var5 = (p1.deltaIconPosition or iconPosition.Left) == iconPosition.Left
	local var6 = p1.isSelected == true
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["col gap-xsmall size-full-0 auto-y padding-large stroke-standard radius-large clip"] = true,
			["stroke-emphasis bg-surface-100"] = var6,
			["stroke-default"] = not var6
		},
		testId = testId,
		onActivated = p1.onActivated
	}, {
		Header = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Title = reactModule.createElement(text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
				Text = p1.title,
				testId = `{testId}-title`
			})
		}),
		StatRow = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, if p1.isLoading then {
			Loading = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var1.Size.Size_500),
				radius = radius.Small,
				testId = `{testId}-loading`
			})
		} else {
			Stat = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-xsmall auto-xy"
			}, {
				Icon = if p1.statIcon then reactModule.createElement(icon, {
					tag = "content-emphasis",
					LayoutOrder = if var4 then 1 else 2,
					name = p1.statIcon,
					size = iconSize.Small,
					testId = `{testId}-stat-icon`
				}) else nil,
				Value = reactModule.createElement(text, {
					tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
					LayoutOrder = if var4 then 2 else 1,
					Text = p1.statText,
					testId = `{testId}-stat`
				})
			}),
			Delta = if p1.deltaText ~= nil then nil else reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = {
					["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
					["bg-shift-200"] = not p1.isDeltaPositive
				},
				backgroundStyle = if p1.isDeltaPositive then {
					Color3 = var1.Color.System.Success.Color3,
					Transparency = var1.Color.Shift.Shift_300.Transparency
				} else nil,
				testId = `{testId}-delta`
			}, {
				Arrow = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = var3,
					size = iconSize.XSmall,
					variant = iconVariant.Filled,
					style = var2
				}),
				Icon = if p1.deltaIcon then reactModule.createElement(icon, {
					tag = "content-default",
					LayoutOrder = if var5 then 2 else 3,
					name = p1.deltaIcon,
					size = iconSize.XSmall,
					testId = `{testId}-delta-icon`
				}) else nil,
				Value = reactModule.createElement(text, {
					tag = "auto-xy text-caption-small text-align-x-left content-default",
					LayoutOrder = if var5 then 3 else 2,
					Text = p1.deltaText
				})
			})
		})
	})
end