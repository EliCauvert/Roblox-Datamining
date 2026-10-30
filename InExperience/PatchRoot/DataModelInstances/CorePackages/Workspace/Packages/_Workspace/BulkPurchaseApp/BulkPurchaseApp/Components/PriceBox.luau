local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local DiscountSummary = require(Parent.IAPExperience).DiscountSummary
local BlackbirdUpsellBanner = require(Parent.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner
local OfferExpiryBadge = require(Parent.AvatarExperienceCommon).Components.OfferExpiryBadge
local UseDiscountSummaryPropsModule = require(BulkPurchaseApp.Hooks.useDiscountSummaryProps)
local PriceBoxLineModule = require(script.Parent.PriceBoxLine)
local PriceBoxLineVariantEnumModule = require(BulkPurchaseApp.Enums.PriceBoxLineVariantEnum)
local FFlagAddTimerToBulkPurchaseBuyButtonModule = require(BulkPurchaseApp.Flags.FFlagAddTimerToBulkPurchaseBuyButton)
local FIntBulkPurchaseEnabledCountdownMSModule = require(BulkPurchaseApp.Flags.FIntBulkPurchaseEnabledCountdownMS)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)
local FFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule = require(BulkPurchaseApp.Flags.FFlagAXUpdateBulkPurchaseOfferExpiryBadge)
local FFlagBulkPurchaseTestPurchaseHintModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseTestPurchaseHint)
local config = {
	heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost",
	currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance",
	projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance",
	missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux",
	confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA",
	buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA",
	testPurchaseDisclaimer = "IAPExperience.PurchasePrompt.Text.TestPurchase"
}
local _ = require(BulkPurchaseApp.Store.Types)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseDiscountSummaryPropsModule (copy), FFlagAXAddOffersToBulkPurchaseModule (copy), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule (copy), OfferExpiryBadge (copy), View (copy), PriceBoxLineModule (copy), PriceBoxLineVariantEnumModule (copy), DiscountSummary (copy), FFlagAddTimerToBulkPurchaseBuyButtonModule (copy), FIntBulkPurchaseEnabledCountdownMSModule (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy), BlackbirdUpsellBanner (copy), FFlagBulkPurchaseTestPurchaseHintModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseDiscountSummaryPropsModuleResult = UseDiscountSummaryPropsModule(p1.discountInformation, p1.totalCost, if FFlagAXAddOffersToBulkPurchaseModule and p1.offerData then p1.offerData.savingsSummary else nil)
	local UseMemoResult = nil
	
	if FFlagAXAddOffersToBulkPurchaseModule then
		local UseTokensResult = UseTokensFunction()
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), FFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule (upval), OfferExpiryBadge (upval)
			local TextButtons = {}
			local OffersAvailable = if p1.offerData then p1.offerData.offersAvailable else nil
			local ToggleOfferSelectedFunction = p1.toggleOfferSelected
			
			if OffersAvailable and ToggleOfferSelectedFunction then
				for i, value in OffersAvailable do
					TextButtons["Offer_" .. i] = ReactModule.createElement("TextButton", {
						Text = "",
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						LayoutOrder = 0,
						[ReactModule.Event.Activated] = function()
							-- upvalues: ToggleOfferSelectedFunction (copy), i (copy)
							ToggleOfferSelectedFunction(i)
						end
					}, {
						Content = ReactModule.createElement(FoundationModule.View, {
							tag = "row gap-medium auto-xy align-y-center",
							Position = UDim2.fromOffset(UseTokensResult.Stroke.Standard, 0)
						}, {
							Checkbox = ReactModule.createElement(FoundationModule.Checkbox, {
								LayoutOrder = 1,
								label = if FFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule then value.localizedDescription else "",
								isChecked = value.selected,
								onActivated = function()
									-- upvalues: ToggleOfferSelectedFunction (copy), i (copy)
									ToggleOfferSelectedFunction(i)
								end,
								size = FoundationModule.Enums.InputSize.Small
							}),
							Label = if FFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule then nil else ReactModule.createElement(FoundationModule.Text, {
								RichText = true,
								tag = "text-body-small content-default auto-xy",
								LayoutOrder = 2,
								Text = "<b>" .. value.localizedDescription .. "</b>"
							}),
							ExpiryBadge = if FFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule and value.expirationTimeUtc then ReactModule.createElement(OfferExpiryBadge, {
								layoutOrder = 2,
								expirationTimeInUTC = value.expirationTimeUtc
							}) else nil
						})
					})
				end
			end
			return TextButtons
		end, { p1.offerData, p1.toggleOfferSelected })
	end
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
			OfferCheckboxes = if FFlagAXAddOffersToBulkPurchaseModule and next(UseMemoResult) ~= nil then ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-medium size-full-0 auto-y padding-top-medium",
				LayoutOrder = 2
			}, UseMemoResult) else nil,
			DiscountSummary = if UseDiscountSummaryPropsModuleResult then ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				LayoutOrder = if FFlagAXAddOffersToBulkPurchaseModule then 3 else 2
			}, {
				Content = ReactModule.createElement(DiscountSummary, UseDiscountSummaryPropsModuleResult)
			}) else nil,
			PriceBoxHeader = ReactModule.createElement(PriceBoxLineModule, {
				text = UseLocalizationResult.heading,
				amount = p1.totalCost,
				originalPrice = if p1.discountInformation then p1.discountInformation.originalPrice else nil,
				variant = PriceBoxLineVariantEnumModule.Highlight,
				LayoutOrder = if FFlagAXAddOffersToBulkPurchaseModule then 4 else 3
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
		}),
		BlackbirdUpsellBanner = if FFlagAXAddPlusUpsellToBulkPurchaseModule and p1.shouldShowBlackbirdUpsellBanner and p1.blackbirdUpsellBannerProductInfo and p1.onBlackbirdUpsellActivated then ReactModule.createElement(BlackbirdUpsellBanner, {
			LayoutOrder = 3,
			productInfo = p1.blackbirdUpsellBannerProductInfo,
			onActivated = p1.onBlackbirdUpsellActivated
		}) else nil,
		TestPurchaseDisclaimer = if FFlagBulkPurchaseTestPurchaseHintModule and p1.isTestPurchase then ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 4,
			tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center",
			Text = UseLocalizationResult.testPurchaseDisclaimer
		}) else nil
	})
end