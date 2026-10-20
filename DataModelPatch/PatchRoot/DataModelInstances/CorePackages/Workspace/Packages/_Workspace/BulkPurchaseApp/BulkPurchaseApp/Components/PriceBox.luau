local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local DiscountSummary = require(Parent.IAPExperience).DiscountSummary
local UseDiscountSummaryPropsModule = require(BulkPurchaseApp.Hooks.useDiscountSummaryProps)
local PriceBoxLineModule = require(script.Parent.PriceBoxLine)
local PriceBoxLineVariantEnumModule = require(BulkPurchaseApp.Enums.PriceBoxLineVariantEnum)
local FFlagAddTimerToBulkPurchaseBuyButtonModule = require(BulkPurchaseApp.Flags.FFlagAddTimerToBulkPurchaseBuyButton)
local FIntBulkPurchaseEnabledCountdownMSModule = require(BulkPurchaseApp.Flags.FIntBulkPurchaseEnabledCountdownMS)
local config = {
	heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost",
	currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance",
	projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance",
	missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux",
	confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA",
	buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA"
}
local _ = require(BulkPurchaseApp.Store.Types)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseDiscountSummaryPropsModule (copy), ReactModule (copy), View (copy), PriceBoxLineModule (copy), PriceBoxLineVariantEnumModule (copy), DiscountSummary (copy), FoundationModule (copy), FFlagAddTimerToBulkPurchaseBuyButtonModule (copy), FIntBulkPurchaseEnabledCountdownMSModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseDiscountSummaryPropsModuleResult = UseDiscountSummaryPropsModule(p1.discountInformation, p1.totalCost)
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-y padding-xxlarge radius-medium bg-surface-100"
	}, {
		LineItems = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			BalanceLines = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, {
				PriceBoxCurrentBalance = ReactModule.createElement(PriceBoxLineModule, {
					LayoutOrder = 1,
					text = UseLocalizationResult.currentBalanceLine,
					amount = p1.currentBalance
				}),
				PriceBoxProjectedBalance = ReactModule.createElement(PriceBoxLineModule, {
					LayoutOrder = 2,
					text = if p1.missingRobux then UseLocalizationResult.missingRobuxLine else UseLocalizationResult.projectedBalanceLine,
					amount = math.abs(p1.totalCost - p1.currentBalance),
					variant = if p1.missingRobux then PriceBoxLineVariantEnumModule.Danger else nil
				})
			}),
			DiscountSummary = if UseDiscountSummaryPropsModuleResult then ReactModule.createElement(View, { LayoutOrder = 2, tag = "size-full-0 auto-y" }, {
				Content = ReactModule.createElement(DiscountSummary, UseDiscountSummaryPropsModuleResult)
			}) else nil,
			PriceBoxHeader = ReactModule.createElement(PriceBoxLineModule, {
				LayoutOrder = 3,
				text = UseLocalizationResult.heading,
				amount = p1.totalCost,
				originalPrice = if p1.discountInformation then p1.discountInformation.originalPrice else nil,
				variant = PriceBoxLineVariantEnumModule.Highlight
			})
		}),
		PriceBoxConfirmButton = ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 2,
			text = if p1.missingRobux then UseLocalizationResult.buyRobuxCTA else UseLocalizationResult.confirmCTA,
			onActivated = p1.onAccept or function() end,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			size = FoundationModule.Enums.InputSize.Medium,
			width = UDim.new(1, 0),
			ref = p1.buttonRef,
			isDisabled = p1.isDisabled,
			inputDelay = if FFlagAddTimerToBulkPurchaseBuyButtonModule then math.max(0, FIntBulkPurchaseEnabledCountdownMSModule) / 1000 else nil
		})
	})
end