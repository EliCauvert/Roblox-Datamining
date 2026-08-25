local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local discountSummary = require(parent.IAPExperience).DiscountSummary
local useDiscountSummaryPropsModule = require(bulkPurchaseApp.Hooks.useDiscountSummaryProps)
local priceBoxLineModule = require(script.Parent.PriceBoxLine)
local priceBoxLineVariantEnumModule = require(bulkPurchaseApp.Enums.PriceBoxLineVariantEnum)
local fFlagAddTimerToBulkPurchaseBuyButtonModule = require(bulkPurchaseApp.Flags.FFlagAddTimerToBulkPurchaseBuyButton)
local fIntBulkPurchaseEnabledCountdownMSModule = require(bulkPurchaseApp.Flags.FIntBulkPurchaseEnabledCountdownMS)
local t = {
	heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost",
	currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance",
	projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance",
	missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux",
	confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA",
	buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA"
}
local _ = require(bulkPurchaseApp.Store.Types)

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), useDiscountSummaryPropsModule (ref), reactModule (ref), view (ref), priceBoxLineModule (ref), priceBoxLineVariantEnumModule (ref), discountSummary (ref), foundationModule (ref), fFlagAddTimerToBulkPurchaseBuyButtonModule (ref), fIntBulkPurchaseEnabledCountdownMSModule (ref)
	local var9 = useLocalization(t)
	local var10 = useDiscountSummaryPropsModule(p0.discountInformation, p0.totalCost)
	
	return reactModule.createElement(view, {
		tag = "col align-x-center gap-xxlarge size-full-0 auto-y padding-xxlarge radius-medium bg-surface-100"
	}, {
		LineItems = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-large size-full-0 auto-y"
		}, {
			BalanceLines = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, {
				PriceBoxCurrentBalance = reactModule.createElement(priceBoxLineModule, {
					LayoutOrder = 1,
					text = var9.currentBalanceLine,
					amount = p0.currentBalance
				}),
				PriceBoxProjectedBalance = reactModule.createElement(priceBoxLineModule, {
					LayoutOrder = 2,
					text = if p0.missingRobux then var9.missingRobuxLine else var9.projectedBalanceLine,
					amount = math.abs(p0.totalCost - p0.currentBalance),
					variant = if p0.missingRobux then priceBoxLineVariantEnumModule.Danger else nil
				})
			}),
			DiscountSummary = if var10 then reactModule.createElement(view, { LayoutOrder = 2, tag = "size-full-0 auto-y" }, {
				Content = reactModule.createElement(discountSummary, var10)
			}) else nil,
			PriceBoxHeader = reactModule.createElement(priceBoxLineModule, {
				LayoutOrder = 3,
				text = var9.heading,
				amount = p0.totalCost,
				originalPrice = if p0.discountInformation then p0.discountInformation.originalPrice else nil,
				variant = priceBoxLineVariantEnumModule.Highlight
			})
		}),
		PriceBoxConfirmButton = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			text = if p0.missingRobux then var9.buyRobuxCTA else var9.confirmCTA,
			onActivated = p0.onAccept or function() end,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Medium,
			width = UDim.new(1, 0),
			ref = p0.buttonRef,
			isDisabled = p0.isDisabled,
			inputDelay = if fFlagAddTimerToBulkPurchaseBuyButtonModule then math.max(0, fIntBulkPurchaseEnabledCountdownMSModule) / 1000 else nil
		})
	})
end