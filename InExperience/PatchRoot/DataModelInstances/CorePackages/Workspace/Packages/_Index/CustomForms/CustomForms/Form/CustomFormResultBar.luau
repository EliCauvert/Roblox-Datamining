local Parent = script:FindFirstAncestor("CustomForms").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactOtterModule = require(Parent.ReactOtter)
local config = { dampingRatio = 1, frequency = 2.5 }

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), ReactOtterModule (copy), ReactModule (copy), config (copy)
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = UseLocalizationFunction({
		caption = {
			"Feature.CustomForms.Label.Percent",
			number = p1.percentage
		}
	})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local IsIsSelected = p1.isSelected == true
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReducedMotion (copy), ReactOtterModule (upval), p1 (copy), config (upval)
		UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(p1.percentage) else ReactOtterModule.spring(p1.percentage, config))
	end, { p1.percentage, ReducedMotion })
	
	return ReactModule.createElement(FoundationModule.View, {
		LayoutOrder = p1.layoutOrder,
		tag = {
			["size-full-0 auto-y stroke-standard radius-medium clip"] = true,
			["stroke-emphasis"] = IsIsSelected,
			["stroke-default"] = not IsIsSelected
		},
		testId = p1.testId
	}, {
		Fill = ReactModule.createElement(FoundationModule.View, {
			ZIndex = 1,
			Size = UseAnimatedBindingResult:map(function(p2: number): UDim2
				return UDim2.fromScale(math.clamp(p2 / 100, 0, 1), 1)
			end),
			tag = {
				["radius-medium"] = true,
				["bg-shift-300"] = IsIsSelected,
				["bg-shift-200"] = not IsIsSelected
			},
			testId = `{p1.testId}--bar`
		}),
		Content = ReactModule.createElement(FoundationModule.View, {
			ZIndex = 2,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
		}, {
			Label = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				Text = p1.label,
				tag = {
					["fill auto-y text-body-large text-wrap text-align-x-left content-emphasis"] = true
				}
			}),
			Check = if IsIsSelected and p1.viewerUserId then ReactModule.createElement(FoundationModule.AvatarIcon, {
				LayoutOrder = 2,
				userId = p1.viewerUserId,
				size = FoundationModule.Enums.AvatarIconSize.Medium,
				backgroundStyle = UseTokensResult.Color.Shift.Shift_400,
				testId = `{p1.testId}--selected`
			}) elseif IsIsSelected then ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 2,
				name = FoundationModule.Enums.IconName.CircleCheck,
				size = FoundationModule.Enums.IconSize.Small,
				testId = `{p1.testId}--selected`
			}) else nil,
			Caption = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 3,
				Text = UseLocalizationResult.caption,
				testId = `{p1.testId}--caption`,
				tag = {
					["auto-xy text-body-large text-align-x-right"] = true,
					["content-emphasis"] = IsIsSelected,
					["content-default"] = not IsIsSelected
				}
			})
		})
	})
end)