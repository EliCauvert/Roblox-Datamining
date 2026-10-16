local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(Frame) --[[ Line: 24 | Named "GiftAllowanceView" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconVariant (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-large size-full-0 auto-y padding-medium stroke-default radius-medium",
		testId = "GiftAllowanceView",
		LayoutOrder = Frame.LayoutOrder
	}, {
		RemainingGifts = ReactModule.createElement(View, {
			tag = "row align-y-center fill gap-medium auto-y",
			LayoutOrder = 1
		}, {
			GiftIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = IconName.GiftBox,
				variant = IconVariant.Regular,
				size = IconSize.Medium,
				style = UseTokensResult.Color.Content.Emphasis
			}),
			Label = ReactModule.createElement(Text, {
				tag = "fill auto-y text-body-medium text-no-wrap text-align-x-left content-emphasis",
				testId = "gift-allowance-remaining-gifts",
				LayoutOrder = 2,
				Text = Frame.remainingGiftsText
			})
		}),
		Expiry = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy padding-x-small padding-y-xsmall radius-small bg-shift-200",
			testId = "gift-allowance-expiry-pill",
			LayoutOrder = 2
		}, {
			ClockIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = IconName.Clock,
				variant = IconVariant.Filled,
				size = IconSize.XSmall,
				style = UseTokensResult.Color.Content.Emphasis
			}),
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-caption-medium text-no-wrap content-emphasis",
				testId = "gift-allowance-expiry",
				LayoutOrder = 2,
				Text = Frame.expiryText
			})
		})
	})
end)