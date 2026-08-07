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
local _ = require(script.Parent.cartPricingResponseLineItem)

local function UnifiedProductPurchaseModalV2(p0) --[[ line: 102 ]]
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), urlBuilder (ref), unifiedPurchaseModalTypeEnumModule (ref), fFlagPurchasePromptFetchCartPricing (ref), useCartPricingModule (ref), reactModule (ref), useFocusNavigationRefsModule (ref), fFlagUnifiedPurchaseAddSkeleton (ref), checkbox (ref), subtitleComponentMapModule (ref), productDetailsContainerModule (ref), cartPricingProductDetailsModule (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), buttonVariant (ref), foundationModule (ref), dialog (ref), dialogSize (ref), blackbirdUpsellBanner (ref)
	local var12 = useLocalization({
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
	local var13 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var12.PerMonth else nil
	local var14 = if fFlagPurchasePromptFetchCartPricing then useCartPricingModule({
		product = p0.product,
		purchaseModalType = p0.purchaseModalType,
		cartPricingResponse = p0.cartPricingResponse,
		onCartOfferAppliedChanged = p0.onCartOfferAppliedChanged
	}) else nil
	local var15, var16 = reactModule.useState(p0.postPurchaseActions or {})
	local _ = nil
	local purchaseModalType = p0.purchaseModalType
	local var17 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var12.GetSubscription elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then var12.BuyAvatar elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then var12.BuyExperience else var12.BuyItemV2
	local _ = nil
	local _ = nil
	local var18, var19 = useFocusNavigationRefsModule(p0.buttons.cancelActivated, p0.onBuyItemButtonMounted)
	local var20 = var19
	local var21 = reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: var15 (ref), p0 (ref)
		if var15 and p0.setPostPurchaseActions then
			p0.setPostPurchaseActions(var15)
		end
		p0.buttons.buyItemActivated()
	end, { p0.buttons.buyItemActivated, var15 })
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: var16 (ref), p0 (ref)
		var16(p0.postPurchaseActions or {})
	end, { p0.postPurchaseActions })
	local isDisabled = nil
	local var23 = 0
	
	if fFlagPurchasePromptFetchCartPricing then
		isDisabled = p0.buttons.isDisabled or (if fFlagPurchasePromptFetchCartPricing then true else fFlagUnifiedPurchaseAddSkeleton and p0.isLoading == true)
		var23 = if var14.showCartOfferUi then #var14.cartPricingOffers else 0
	end
	local var24 = if not fFlagPurchasePromptFetchCartPricing then reactModule.useMemo(function() --[[ line: 185 ]]
		-- upvalues: var15 (ref), reactModule (copy), checkbox (copy), p0 (ref), fFlagUnifiedPurchaseAddSkeleton (copy), var16 (ref)
		local t = {}
		
		for i, v in ipairs(var15 or {}) do
			t["PostPurchaseActionCheckBox_" .. tostring(i)] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = i,
				label = v.label,
				isChecked = v.isActionSelected,
				isDisabled = p0.buttons.isDisabled or (if fFlagUnifiedPurchaseAddSkeleton then p0.isLoading else nil),
				onActivated = function() --[[ line: 196 ]]
					-- upvalues: var16 (copy), i (ref), v (ref)
					var16(function(p2) --[[ line: 197 ]]
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
		var15,
		if fFlagUnifiedPurchaseAddSkeleton then p0.isLoading else nil
	}) else reactModule.useMemo(function() --[[ line: 213 ]]
		-- upvalues: var15 (ref), reactModule (copy), checkbox (copy), var23 (write), isDisabled (write), var16 (ref)
		local t = {}
		
		for i, v in var15 do
			t[v.actionKey] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = var23 + i,
				label = v.label,
				isChecked = v.isActionSelected,
				isDisabled = isDisabled,
				onActivated = function() --[[ line: 222 ]]
					-- upvalues: var16 (copy), i (ref), v (ref)
					var16(function(p1) --[[ line: 223 ]]
						-- upvalues: i (copy), v (copy)
						local cloned = table.clone(p1)
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
	end, { var15, var23, isDisabled })
	local var25 = nil
	
	if p0.subtitleView then
		local componentName = subtitleComponentMapModule[p0.subtitleView.componentName]
		
		if componentName then
			var25 = reactModule.createElement(componentName, p0.subtitleView.props)
		end
	end
	local var26 = if fFlagPurchasePromptFetchCartPricing then reactModule.createElement(cartPricingProductDetailsModule, {
		cartPricing = var14,
		purchaseModalType = p0.purchaseModalType,
		subtitleView = var25,
		priceSuffix = var13,
		isLoading = p0.isLoading,
		isCartPricingLoading = p0.isCartPricingLoading
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p0.purchaseModalType,
		product = p0.product,
		subtitleView = var25,
		priceSuffix = var13,
		isLoading = if fFlagUnifiedPurchaseAddSkeleton then p0.isLoading else nil
	})
	local var27 = nil
	local cloned = nil
	
	if fFlagPurchasePromptFetchCartPricing then
		var27 = buildCartPricingOfferCheckboxesModule({ cartPricing = var14, isDisabled = isDisabled })
		cloned = table.clone(var27)
		
		for i, v in pairs(var24) do
			cloned[i] = v
		end
	end
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		size = dialogSize.Medium,
		onClose = p0.buttons.cancelActivated,
		ref = var18
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var17 }),
		DialogContent = reactModule.createElement(view, {
			tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
			LayoutOrder = 1
		}, { ProductDetailsContainer = var26 }),
		ActionsSection = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y gap-xlarge",
			LayoutOrder = 3
		}, {
			PostPurchaseActions = if fFlagPurchasePromptFetchCartPricing and (next(var27) or next(var24)) or not fFlagPurchasePromptFetchCartPricing and next(var24) then reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
				LayoutOrder = 1
			}, if fFlagPurchasePromptFetchCartPricing then cloned else { var24 }) else nil,
			BuyAndUpsell = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y gap-medium",
				LayoutOrder = 2
			}, {
				DialogActions = reactModule.createElement(dialog.Actions, {
					LayoutOrder = 1,
					orientation = foundationModule.Enums.Orientation.Horizontal,
					actions = {
						{
							text = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var12.Subscribe else var12.Buy,
							variant = buttonVariant.Emphasis,
							onActivated = var21,
							isDisabled = if fFlagPurchasePromptFetchCartPricing then isDisabled else p0.buttons.isDisabled or (if fFlagUnifiedPurchaseAddSkeleton then p0.isLoading else nil),
							ref = var20,
							inputDelay = if p0.buttons.buyItemEnableInputDelayed and not p0.buttons.isDisabled then 2.5 else 0
						}
					}
				}),
				BlackbirdUpsellBanner = if p0.BlackbirdUpsellBannerProductInfo and p0.onBlackbirdUpsellActivated then reactModule.createElement(blackbirdUpsellBanner, {
					LayoutOrder = 2,
					productInfo = p0.BlackbirdUpsellBannerProductInfo,
					onActivated = p0.onBlackbirdUpsellActivated
				}) else nil
			})
		}),
		TestDisclaimer = if p0.isTestPurchase then reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 5,
			tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap",
			Text = var12.TestPurchaseDisclaimer
		}) else nil,
		SubscribeTerms = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then reactModule.createElement(foundationModule.Text, {
			LayoutOrder = 6,
			tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
			Text = string.gsub(string.gsub(var12.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
		}) else nil
	})
end

return function(p3) --[[ line: 379 | named "UnifiedProductPurchaseModalV2Container" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedProductPurchaseModalV2 (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(UnifiedProductPurchaseModalV2, p3)
	})
end