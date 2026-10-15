local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-large size-full-0 auto-y padding-medium stroke-default radius-medium",
		testId = "GiftAllowanceView",
		LayoutOrder = p1.LayoutOrder
	}, {
		RemainingGifts = reactModule.createElement(view, {
			tag = "row align-y-center fill gap-medium auto-y",
			LayoutOrder = 1
		}, {
			GiftIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = iconName.GiftBox,
				variant = iconVariant.Regular,
				size = iconSize.Medium,
				style = var1.Color.Content.Emphasis
			}),
			Label = reactModule.createElement(text, {
				tag = "fill auto-y text-body-medium text-no-wrap text-align-x-left content-emphasis",
				testId = "gift-allowance-remaining-gifts",
				LayoutOrder = 2,
				Text = p1.remainingGiftsText
			})
		}),
		Expiry = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy padding-x-small padding-y-xsmall radius-small bg-shift-200",
			testId = "gift-allowance-expiry-pill",
			LayoutOrder = 2
		}, {
			ClockIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = iconName.Clock,
				variant = iconVariant.Filled,
				size = iconSize.XSmall,
				style = var1.Color.Content.Emphasis
			}),
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-caption-medium text-no-wrap content-emphasis",
				testId = "gift-allowance-expiry",
				LayoutOrder = 2,
				Text = p1.expiryText
			})
		})
	})
end)