local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local blackbirdUpsellBanner = require(parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner
local foundationModule = require(parent_1.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local checkbox = foundationModule.Checkbox
local view = foundationModule.View
local dialogSize = foundationModule.Enums.DialogSize
local productDetailsContainerModule = require(parent.Generic.ProductDetailsContainer)
local cartPricingProductDetailsModule = require(script.Parent.CartPricingProductDetails)
local buildCartPricingOfferCheckboxesModule = require(script.Parent.buildCartPricingOfferCheckboxes)
local useCartPricingModule = require(script.Parent.useCartPricing)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local urlBuilder = require(parent_1.UrlBuilder).UrlBuilder
local subtitleComponentMapModule = require(script.Parent.SubtitleComponentMap)
local _ = require(script.Parent.Parent.v3.UnifiedProductPurchaseModalTypes)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagUnifiedPurchaseAddSkeleton = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagPurchasePromptFetchCartPricing = require(parent.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local fFlagPurchasePromptFixOfferMarginUpsell = require(parent.Parent.SharedFlags).FFlagPurchasePromptFixOfferMarginUpsell
local fFlagOffersOnlyAffordableLock = require(parent.Parent.SharedFlags).FFlagOffersOnlyAffordableLock
local _ = require(script.Parent.cartPricingResponseLineItem)

local function UnifiedProductPurchaseModalV2(p1)
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), urlBuilder (ref), unifiedPurchaseModalTypeEnumModule (ref), fFlagPurchasePromptFetchCartPricing (ref), useCartPricingModule (ref), reactModule (ref), useFocusNavigationRefsModule (ref), fFlagUnifiedPurchaseAddSkeleton (ref), fFlagPurchasePromptFixOfferMarginUpsell (ref), fFlagOffersOnlyAffordableLock (ref), checkbox (ref), subtitleComponentMapModule (ref), productDetailsContainerModule (ref), cartPricingProductDetailsModule (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), buttonVariant (ref), foundationModule (ref), dialog (ref), dialogSize (ref), blackbirdUpsellBanner (ref)
	local var1 = useLocalization({
		Buy = "IAPExperience.PurchasePrompt.Action.Buy",
		Subscribe = "Feature.Subscription.Action.Subscribe",
		BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem",
		GetSubscription = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription",
		BuyExperience = "IAPExperience.PurchasePrompt.Title.BuyExperience",
		BuyItems = "IAPExperience.PurchasePrompt.Title.BuyItems",
		TestPurchaseDisclaimer = "IAPExperience.PurchasePrompt.Text.TestPurchase",
		BuyItemV2 = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Title.BuyItemV2" else nil,
		BuyAvatar = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Header.BuyAvatar" else nil,
		PerMonth = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Text.PerMonth" else nil,
		SubscribeTermsAgreement = if fFlagEnableUnifiedPurchaseFlowForDevSubs then {
			"Feature.Subscription.Footer.PurchasePromptLegalText",
			SubscribeButtonTitle = "\"Subscribe\"",
			tosUrl = urlBuilder.static.about.terms()
		} else nil
	})
	local var2 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var1.PerMonth else nil
	local var3 = if fFlagPurchasePromptFetchCartPricing then useCartPricingModule({
		product = p1.product,
		purchaseModalType = p1.purchaseModalType,
		cartPricingResponse = p1.cartPricingResponse,
		onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
	}) else nil
	local var4, var5 = reactModule.useState(p1.postPurchaseActions or {})
	local _ = nil
	local purchaseModalType = p1.purchaseModalType
	local var6 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var1.GetSubscription elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then var1.BuyAvatar elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then var1.BuyExperience else var1.BuyItemV2
	local _ = nil
	local _ = nil
	local var7, var8 = useFocusNavigationRefsModule(p1.buttons.cancelActivated, p1.onBuyItemButtonMounted)
	local var9 = var8
	local var10 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p1 (ref)
		if var4 and p1.setPostPurchaseActions then
			p1.setPostPurchaseActions(var4)
		end
		p1.buttons.buyItemActivated()
	end, { p1.buttons.buyItemActivated, var4 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p1 (ref)
		var5(p1.postPurchaseActions or {})
	end, { p1.postPurchaseActions })
	local isDisabled = nil
	local var11 = nil
	local var12 = 0
	
	if fFlagPurchasePromptFetchCartPricing then
		isDisabled = p1.buttons.isDisabled or (if fFlagPurchasePromptFetchCartPricing then true else fFlagUnifiedPurchaseAddSkeleton and p1.isLoading == true)
		
		if fFlagPurchasePromptFixOfferMarginUpsell then
			local priceWithoutOffersDiscounts = var3.priceWithoutOffersDiscounts
			local priceAfterOffersDiscounts = var3.priceAfterOffersDiscounts
			local var13 = priceWithoutOffersDiscounts ~= nil and p1.robuxBalanceAmount < priceWithoutOffersDiscounts
			var11 = isDisabled or (var13 and (not fFlagOffersOnlyAffordableLock or (priceAfterOffersDiscounts ~= nil and priceAfterOffersDiscounts <= p1.robuxBalanceAmount)))
		else
			var11 = isDisabled
		end
		var12 = if var3.showCartOfferUi then #var3.cartPricingOffers else 0
	end
	local var14 = if not fFlagPurchasePromptFetchCartPricing then reactModule.useMemo(function()
		-- upvalues: var4 (ref), reactModule (copy), checkbox (copy), p1 (ref), fFlagUnifiedPurchaseAddSkeleton (copy), var5 (ref)
		local t = {}
		
		for i, v in ipairs(var4 or {}) do
			t["PostPurchaseActionCheckBox_" .. tostring(i)] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = i,
				label = v.label,
				isChecked = v.isActionSelected,
				isDisabled = p1.buttons.isDisabled or (if fFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil),
				onActivated = function()
					-- upvalues: var5 (copy), i (ref), v (ref)
					var5(function(p2)
						-- upvalues: i (copy), v (copy)
						local cloned = table.clone(p2)
						cloned[i] = {
							label = v.label,
							isActionSelected = not v.isActionSelected,
							actionKey = v.actionKey
						}
						
						return cloned
					end)
				end
			})
		end
		return t
	end, {
		var4,
		if fFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil
	}) else reactModule.useMemo(function()
		-- upvalues: var4 (ref), reactModule (copy), checkbox (copy), var12 (write), isDisabled (write), var5 (ref)
		local t = {}
		
		for i, v in var4 do
			t[v.actionKey] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = var12 + i,
				label = v.label,
				isChecked = v.isActionSelected,
				isDisabled = isDisabled,
				onActivated = function()
					-- upvalues: var5 (copy), i (ref), v (ref)
					var5(function(p2)
						-- upvalues: i (copy), v (copy)
						local cloned = table.clone(p2)
						cloned[i] = {
							label = v.label,
							isActionSelected = not v.isActionSelected,
							actionKey = v.actionKey
						}
						
						return cloned
					end)
				end
			})
		end
		return t
	end, { var4, var12, isDisabled })
	local var15 = nil
	
	if p1.subtitleView then
		local componentName = subtitleComponentMapModule[p1.subtitleView.componentName]
		
		if componentName then
			var15 = reactModule.createElement(componentName, p1.subtitleView.props)
		end
	end
	local var16 = if fFlagPurchasePromptFetchCartPricing then reactModule.createElement(cartPricingProductDetailsModule, {
		cartPricing = var3,
		purchaseModalType = p1.purchaseModalType,
		subtitleView = var15,
		priceSuffix = var2,
		isLoading = p1.isLoading,
		isCartPricingLoading = p1.isCartPricingLoading
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = p1.product,
		subtitleView = var15,
		priceSuffix = var2,
		isLoading = if fFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil
	})
	local var17 = nil
	local cloned = nil
	
	if fFlagPurchasePromptFetchCartPricing then
		var17 = buildCartPricingOfferCheckboxesModule({ cartPricing = var3, isDisabled = var11 })
		cloned = table.clone(var17)
		
		for i, v in pairs(var14) do
			cloned[i] = v
		end
	end
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p1.buttons.cancelActivated,
		ref = var7
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var6 }),
		DialogContent = reactModule.createElement(view, {
			tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
			LayoutOrder = 1
		}, { ProductDetailsContainer = var16 }),
		ActionsSection = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-xlarge",
			LayoutOrder = 3
		}, {
			PostPurchaseActions = if fFlagPurchasePromptFetchCartPricing and (next(var17) or next(var14)) or not fFlagPurchasePromptFetchCartPricing and next(var14) then reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
				LayoutOrder = 1
			}, if fFlagPurchasePromptFetchCartPricing then cloned else { var14 }) else nil,
			BuyAndUpsell = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y gap-medium",
				LayoutOrder = 2
			}, {
				DialogActions = reactModule.createElement(dialog.Actions, {
					LayoutOrder = 1,
					orientation = foundationModule.Enums.Orientation.Horizontal,
					actions = {
						{
							text = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var1.Subscribe else var1.Buy,
							variant = buttonVariant.Emphasis,
							onActivated = var10,
							isDisabled = if fFlagPurchasePromptFetchCartPricing then isDisabled else p1.buttons.isDisabled or (if fFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil),
							ref = var9,
							inputDelay = if p1.buttons.buyItemEnableInputDelayed and not p1.buttons.isDisabled then 2.5 else 0
						}
					}
				}),
				BlackbirdUpsellBanner = if p1.BlackbirdUpsellBannerProductInfo and p1.onBlackbirdUpsellActivated then reactModule.createElement(blackbirdUpsellBanner, {
					LayoutOrder = 2,
					productInfo = p1.BlackbirdUpsellBannerProductInfo,
					onActivated = p1.onBlackbirdUpsellActivated
				}) else nil
			})
		}),
		TestDisclaimer = if p1.isTestPurchase then reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 5,
			tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap",
			Text = var1.TestPurchaseDisclaimer
		}) else nil,
		SubscribeTerms = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 6,
			tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
			Text = string.gsub(string.gsub(var1.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
		}) else nil
	})
end

return function(p2)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedProductPurchaseModalV2 (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(UnifiedProductPurchaseModalV2, p2)
	})
end