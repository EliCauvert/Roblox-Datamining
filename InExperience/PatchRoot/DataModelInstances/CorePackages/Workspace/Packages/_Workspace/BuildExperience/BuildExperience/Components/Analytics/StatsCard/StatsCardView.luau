local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconPosition = FoundationModule.Enums.IconPosition
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local Radius = FoundationModule.Enums.Radius

return function(p1)
	-- upvalues: UseTokensFunction (copy), IconName (copy), IconPosition (copy), ReactModule (copy), View (copy), Text (copy), Skeleton (copy), Radius (copy), Icon (copy), IconSize (copy), IconVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "StatsCardView"
	local Success = if p1.isDeltaPositive then UseTokensResult.Color.System.Success else UseTokensResult.Color.Content.Default
	local ArrowWideShortUp = if p1.isDeltaPositive then IconName.ArrowWideShortUp else IconName.ArrowWideShortDown
	local IsLeftMatch = (p1.statIconPosition or IconPosition.Left) == IconPosition.Left
	local IsLeftMatch1 = (p1.deltaIconPosition or IconPosition.Left) == IconPosition.Left
	local Config = if p1.isDeltaPositive then {
		Color3 = UseTokensResult.Color.System.Success.Color3,
		Transparency = UseTokensResult.Color.Shift.Shift_300.Transparency
	} else nil
	local IsIsSelected = p1.isSelected == true
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["col gap-xsmall size-full-0 auto-y padding-large stroke-standard radius-large clip"] = true,
			["stroke-emphasis bg-surface-100"] = IsIsSelected,
			["stroke-default"] = not IsIsSelected
		},
		testId = TestId,
		onActivated = p1.onActivated
	}, {
		Header = ReactModule.createElement(View, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Title = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end content-default",
				Text = p1.title,
				testId = `{TestId}-title`
			})
		}),
		StatRow = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, if p1.isLoading then {
			Loading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_500),
				radius = Radius.Small,
				testId = `{TestId}-loading`
			})
		} else {
			Stat = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-xsmall auto-xy"
			}, {
				Icon = if p1.statIcon then ReactModule.createElement(Icon, {
					tag = "content-emphasis",
					LayoutOrder = if IsLeftMatch then 1 else 2,
					name = p1.statIcon,
					size = IconSize.Small,
					testId = `{TestId}-stat-icon`
				}) else nil,
				Value = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-small text-align-x-left content-emphasis",
					LayoutOrder = if IsLeftMatch then 2 else 1,
					Text = p1.statText,
					testId = `{TestId}-stat`
				})
			}),
			Delta = if p1.deltaText == nil then nil else ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["row align-y-center gap-xxsmall auto-xy padding-y-xxsmall padding-left-xsmall padding-right-small radius-small"] = true,
					["bg-shift-200"] = not p1.isDeltaPositive
				},
				backgroundStyle = Config,
				testId = `{TestId}-delta`
			}, {
				Arrow = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = ArrowWideShortUp,
					size = IconSize.XSmall,
					variant = IconVariant.Filled,
					style = Success
				}),
				Icon = if p1.deltaIcon then ReactModule.createElement(Icon, {
					tag = "content-default",
					LayoutOrder = if IsLeftMatch1 then 2 else 3,
					name = p1.deltaIcon,
					size = IconSize.XSmall,
					testId = `{TestId}-delta-icon`
				}) else nil,
				Value = ReactModule.createElement(Text, {
					tag = "auto-xy text-caption-small text-align-x-left content-default",
					LayoutOrder = if IsLeftMatch1 then 3 else 2,
					Text = p1.deltaText
				})
			})
		})
	})
end