local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ShouldShowPriceLabelFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).shouldShowPriceLabel
local _ = FoundationModule.Enums.ButtonVariant
local _ = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ShouldShowPriceLabelFunction (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ShouldShowPriceLabelFunction (upval), p1 (copy)
		return ShouldShowPriceLabelFunction(p1.priceStatus)
	end, { p1.priceStatus })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full col gap-xsmall align-x-center padding-x-large padding-bottom-medium",
		LayoutOrder = 1
	}, {
		InfoFrame = if p1.priceLabel then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-800 row flex-x-between align-y-center gap-small",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, {
			PriceDescriptionLabel = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-medium content-emphasis text-truncate-end",
				LayoutOrder = 1,
				Text = if UseMemoResult then p1.priceLabel.leftLabel else ""
			}),
			RobuxLabel = if UseMemoResult then ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy row align-x-left align-y-center gap-xsmall",
				LayoutOrder = 2
			}, {
				PriceText = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					LayoutOrder = 2,
					Text = p1.priceLabel.priceInRobux
				}),
				Robux = ReactModule.createElement(FoundationModule.Icon, {
					name = "robux",
					LayoutOrder = 1,
					style = UseTokensResult.Color.ActionStandard.Foreground,
					size = FoundationModule.Enums.IconSize.Small
				})
			}) else nil
		}) else nil,
		PurchaseButton = ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 2,
			size = FoundationModule.Enums.InputSize.Medium,
			fillBehavior = FoundationModule.Enums.FillBehavior.Fill,
			width = UDim.new(1, 0),
			text = p1.purchaseButtonProps.purchaseButtonText,
			variant = p1.purchaseButtonProps.variant,
			isDisabled = p1.purchaseButtonProps.isDisabled,
			onActivated = p1.purchaseButtonProps.onPurchase
		})
	})
end