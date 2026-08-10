local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local shouldShowPriceLabel = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel
local _ = foundationModule.Enums.ButtonVariant
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)

return function(p0) --[[ line: 55 | named "BuyActionBar" ]]
	-- upvalues: useTokens (ref), reactModule (ref), shouldShowPriceLabel (ref), foundationModule (ref)
	local var3 = reactModule.useMemo(function() --[[ line: 58 ]]
		-- upvalues: shouldShowPriceLabel (copy), p0 (ref)
		return shouldShowPriceLabel(p0.priceStatus)
	end, { p0.priceStatus })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full col gap-xsmall align-x-center padding-x-large padding-bottom-medium",
		LayoutOrder = 1
	}, {
		InfoFrame = if p0.priceLabel then reactModule.createElement(foundationModule.View, {
			tag = "size-full-800 row flex-x-between align-y-center gap-small",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, {
			PriceDescriptionLabel = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis text-truncate-end",
				LayoutOrder = 1,
				Text = if var3 then p0.priceLabel.leftLabel else ""
			}),
			RobuxLabel = if var3 then reactModule.createElement(foundationModule.View, {
				tag = "auto-xy row align-x-left align-y-center gap-xsmall",
				LayoutOrder = 2
			}, {
				PriceText = reactModule.createElement(foundationModule.Text, {
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					LayoutOrder = 2,
					Text = p0.priceLabel.priceInRobux
				}),
				Robux = reactModule.createElement(foundationModule.Icon, {
					name = "robux",
					LayoutOrder = 1,
					style = useTokens().Color.ActionStandard.Foreground,
					size = foundationModule.Enums.IconSize.Small
				})
			}) else nil
		}) else nil,
		PurchaseButton = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			size = foundationModule.Enums.InputSize.Medium,
			fillBehavior = foundationModule.Enums.FillBehavior.Fill,
			width = UDim.new(1, 0),
			text = p0.purchaseButtonProps.purchaseButtonText,
			variant = p0.purchaseButtonProps.variant,
			isDisabled = p0.purchaseButtonProps.isDisabled,
			onActivated = p0.purchaseButtonProps.onPurchase
		})
	})
end