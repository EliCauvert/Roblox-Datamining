local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local discountSummary = require(parent.IAPExperience).DiscountSummary
local blackbirdUpsellBanner = require(parent.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner
local offerExpiryBadge = require(parent.AvatarExperienceCommon).Components.OfferExpiryBadge
local useDiscountSummaryPropsModule = require(bulkPurchaseApp.Hooks.useDiscountSummaryProps)
local priceBoxLineModule = require(script.Parent.PriceBoxLine)
local priceBoxLineVariantEnumModule = require(bulkPurchaseApp.Enums.PriceBoxLineVariantEnum)
local fFlagAddTimerToBulkPurchaseBuyButtonModule = require(bulkPurchaseApp.Flags.FFlagAddTimerToBulkPurchaseBuyButton)
local fIntBulkPurchaseEnabledCountdownMSModule = require(bulkPurchaseApp.Flags.FIntBulkPurchaseEnabledCountdownMS)
local fFlagAXAddPlusUpsellToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local fFlagAXAddOffersToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)
local fFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule = require(bulkPurchaseApp.Flags.FFlagAXUpdateBulkPurchaseOfferExpiryBadge)
local t = {
	heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost",
	currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance",
	projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance",
	missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux",
	confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA",
	buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA"
}
local _ = require(bulkPurchaseApp.Store.Types)

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), useDiscountSummaryPropsModule (ref), fFlagAXAddOffersToBulkPurchaseModule (ref), useTokens (ref), reactModule (ref), foundationModule (ref), fFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule (ref), offerExpiryBadge (ref), view (ref), priceBoxLineModule (ref), priceBoxLineVariantEnumModule (ref), discountSummary (ref), fFlagAddTimerToBulkPurchaseBuyButtonModule (ref), fIntBulkPurchaseEnabledCountdownMSModule (ref), fFlagAXAddPlusUpsellToBulkPurchaseModule (ref), blackbirdUpsellBanner (ref)
	local var1 = useLocalization(t)
	local var2 = useDiscountSummaryPropsModule(p1.discountInformation, p1.totalCost, if fFlagAXAddOffersToBulkPurchaseModule and p1.offerData then p1.offerData.savingsSummary else nil)
	local var3 = nil
	
	if fFlagAXAddOffersToBulkPurchaseModule then
		local var4 = useTokens()
		var3 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), foundationModule (copy), var4 (ref), fFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule (copy), offerExpiryBadge (copy)
			local t = {}
			local var5 = if p1.offerData then p1.offerData.offersAvailable else nil
			local toggleOfferSelected = p1.toggleOfferSelected
			
			if var5 and toggleOfferSelected then
				for i, v in var5 do
					t["Offer_" .. i] = reactModule.createElement("TextButton", {
						Text = "",
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						LayoutOrder = 0,
						[reactModule.Event.Activated] = function()
							-- upvalues: toggleOfferSelected (ref), i (ref)
							toggleOfferSelected(i)
						end
					}, {
						Content = reactModule.createElement(foundationModule.View, {
							tag = "row gap-medium auto-xy align-y-center",
							Position = UDim2.fromOffset(var4.Stroke.Standard, 0)
						}, {
							Checkbox = reactModule.createElement(foundationModule.Checkbox, {
								LayoutOrder = 1,
								label = if fFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule then v.localizedDescription else "",
								isChecked = v.selected,
								onActivated = function()
									-- upvalues: toggleOfferSelected (ref), i (ref)
									toggleOfferSelected(i)
								end,
								size = foundationModule.Enums.InputSize.Small
							}),
							Label = if not fFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule then reactModule.createElement(foundationModule.Text, {
								RichText = true,
								tag = "text-body-small content-default auto-xy",
								LayoutOrder = 2,
								Text = "<b>" .. v.localizedDescription .. "</b>"
							}) else nil,
							ExpiryBadge = if fFlagAXUpdateBulkPurchaseOfferExpiryBadgeModule and v.expirationTimeUtc then reactModule.createElement(offerExpiryBadge, {
								layoutOrder = 2,
								expirationTimeInUTC = v.expirationTimeUtc
							}) else nil
						})
					})
				end
			end
			return t
		end, { p1.offerData, p1.toggleOfferSelected })
	end
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
					text = var1.currentBalanceLine,
					amount = p1.currentBalance
				}),
				PriceBoxProjectedBalance = reactModule.createElement(priceBoxLineModule, {
					LayoutOrder = 2,
					text = if p1.missingRobux then var1.missingRobuxLine else var1.projectedBalanceLine,
					amount = math.abs(p1.totalCost - p1.currentBalance),
					variant = if p1.missingRobux then priceBoxLineVariantEnumModule.Danger else nil
				})
			}),
			OfferCheckboxes = if fFlagAXAddOffersToBulkPurchaseModule and next(var3) ~= nil then reactModule.createElement(foundationModule.View, {
				tag = "col gap-medium size-full-0 auto-y padding-top-medium",
				LayoutOrder = 2
			}, var3) else nil,
			DiscountSummary = if var2 then reactModule.createElement(view, {
				tag = "size-full-0 auto-y",
				LayoutOrder = if fFlagAXAddOffersToBulkPurchaseModule then 3 else 2
			}, {
				Content = reactModule.createElement(discountSummary, var2)
			}) else nil,
			PriceBoxHeader = reactModule.createElement(priceBoxLineModule, {
				text = var1.heading,
				amount = p1.totalCost,
				originalPrice = if p1.discountInformation then p1.discountInformation.originalPrice else nil,
				variant = priceBoxLineVariantEnumModule.Highlight,
				LayoutOrder = if fFlagAXAddOffersToBulkPurchaseModule then 4 else 3
			})
		}),
		PriceBoxConfirmButton = reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			text = if p1.missingRobux then var1.buyRobuxCTA else var1.confirmCTA,
			onActivated = p1.onAccept or function() end,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			size = foundationModule.Enums.InputSize.Medium,
			width = UDim.new(1, 0),
			ref = p1.buttonRef,
			isDisabled = p1.isDisabled,
			inputDelay = if fFlagAddTimerToBulkPurchaseBuyButtonModule then math.max(0, fIntBulkPurchaseEnabledCountdownMSModule) / 1000 else nil
		}),
		BlackbirdUpsellBanner = if fFlagAXAddPlusUpsellToBulkPurchaseModule and p1.shouldShowBlackbirdUpsellBanner and (p1.blackbirdUpsellBannerProductInfo and p1.onBlackbirdUpsellActivated) then reactModule.createElement(blackbirdUpsellBanner, {
			LayoutOrder = 3,
			productInfo = p1.blackbirdUpsellBannerProductInfo,
			onActivated = p1.onBlackbirdUpsellActivated
		}) else nil
	})
end