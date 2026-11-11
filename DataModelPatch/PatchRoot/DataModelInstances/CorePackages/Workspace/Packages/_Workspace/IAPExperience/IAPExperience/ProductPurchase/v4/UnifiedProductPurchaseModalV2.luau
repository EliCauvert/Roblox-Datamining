local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local BlackbirdUpsellBanner = require(Parent1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner
local FoundationModule = require(Parent1.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local Checkbox = FoundationModule.Checkbox
local View = FoundationModule.View
local DialogSize = FoundationModule.Enums.DialogSize
local ProductDetailsContainerModule = require(Parent.Generic.ProductDetailsContainer)
local CartPricingProductDetailsModule = require(script.Parent.CartPricingProductDetails)
local BuildCartPricingOfferCheckboxesModule = require(script.Parent.buildCartPricingOfferCheckboxes)
local UseCartPricingModule = require(script.Parent.useCartPricing)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UrlBuilder = require(Parent1.UrlBuilder).UrlBuilder
local SubtitleComponentMapModule = require(script.Parent.SubtitleComponentMap)
local _ = require(script.Parent.Parent.v3.UnifiedProductPurchaseModalTypes)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagUnifiedPurchaseAddSkeleton = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local UnifiedPurchaseFixTitleFlash = game:DefineFastFlag("UnifiedPurchaseFixTitleFlash", false)
local FFlagPurchasePromptFetchCartPricing = require(Parent.Parent.SharedFlags).FFlagPurchasePromptFetchCartPricing
local _ = require(script.Parent.cartPricingResponseLineItem)

local function UnifiedProductPurchaseModalV2(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), UrlBuilder (copy), UnifiedPurchaseModalTypeEnumModule (copy), FFlagPurchasePromptFetchCartPricing (copy), UseCartPricingModule (copy), ReactModule (copy), UnifiedPurchaseFixTitleFlash (copy), UseFocusNavigationRefsModule (copy), FFlagUnifiedPurchaseAddSkeleton (copy), Checkbox (copy), SubtitleComponentMapModule (copy), ProductDetailsContainerModule (copy), CartPricingProductDetailsModule (copy), BuildCartPricingOfferCheckboxesModule (copy), View (copy), ButtonVariant (copy), FoundationModule (copy), Dialog (copy), DialogSize (copy), BlackbirdUpsellBanner (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Buy = "IAPExperience.PurchasePrompt.Action.Buy",
		Subscribe = "Feature.Subscription.Action.Subscribe",
		BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem",
		GetSubscription = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription",
		BuyExperience = "IAPExperience.PurchasePrompt.Title.BuyExperience",
		BuyItems = "IAPExperience.PurchasePrompt.Title.BuyItems",
		TestPurchaseDisclaimer = "IAPExperience.PurchasePrompt.Text.TestPurchase",
		BuyItemV2 = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Title.BuyItemV2" else nil,
		BuyAvatar = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Header.BuyAvatar" else nil,
		PerMonth = if FFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Text.PerMonth" else nil,
		SubscribeTermsAgreement = if FFlagEnableUnifiedPurchaseFlowForDevSubs then {
			"Feature.Subscription.Footer.PurchasePromptLegalText",
			SubscribeButtonTitle = "\"Subscribe\"",
			tosUrl = UrlBuilder.static.about.terms()
		} else nil
	})
	local PerMonth = if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then UseLocalizationResult.PerMonth else nil
	local UseCartPricingModuleResult = if FFlagPurchasePromptFetchCartPricing then UseCartPricingModule({
		product = p1.product,
		purchaseModalType = p1.purchaseModalType,
		cartPricingResponse = p1.cartPricingResponse,
		onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
	}) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.postPurchaseActions or {})
	local UseStateResult2_1 = nil
	local UseStateResult1 = nil
	
	if UnifiedPurchaseFixTitleFlash then
		local PurchaseModalType = p1.purchaseModalType
		UseStateResult1 = if FFlagEnableUnifiedPurchaseFlowForDevSubs and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then UseLocalizationResult.GetSubscription elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then UseLocalizationResult.BuyAvatar elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.Experience then UseLocalizationResult.BuyExperience else UseLocalizationResult.BuyItemV2
	else
		UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseLocalizationResult.BuyItem)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), UnifiedPurchaseModalTypeEnumModule (upval), UseStateResult2_1 (ref), UseLocalizationResult (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval)
			local PurchaseModalType = p1.purchaseModalType
			
			if FFlagEnableUnifiedPurchaseFlowForDevSubs and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				UseStateResult2_1(UseLocalizationResult.GetSubscription)
				
				return
			end
			if PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then
				if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
					UseStateResult2_1(UseLocalizationResult.BuyAvatar)
					
					return
				else
					UseStateResult2_1(UseLocalizationResult.BuyItems)
					
					return
				end
			elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.Experience then
				UseStateResult2_1(UseLocalizationResult.BuyExperience)
				
				return
			else
				if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
					UseStateResult2_1(UseLocalizationResult.BuyItemV2)
					
					return
				else
					UseStateResult2_1(UseLocalizationResult.BuyItem)
				end
			end
		end, { p1.purchaseModalType })
	end
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.cancelActivated, p1.onBuyItemButtonMounted)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), p1 (copy)
		if UseStateResult and p1.setPostPurchaseActions then
			p1.setPostPurchaseActions(UseStateResult)
		end
		p1.buttons.buyItemActivated()
	end, { p1.buttons.buyItemActivated, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.postPurchaseActions or {})
	end, { p1.postPurchaseActions })
	local IsDisabled = nil
	local CountCartPricingOffers = 0
	
	if FFlagPurchasePromptFetchCartPricing then
		IsDisabled = p1.buttons.isDisabled or (FFlagPurchasePromptFetchCartPricing and p1.isCartPricingLoading == true or FFlagUnifiedPurchaseAddSkeleton and p1.isLoading == true)
		CountCartPricingOffers = if UseCartPricingModuleResult.showCartOfferUi then #UseCartPricingModuleResult.cartPricingOffers else 0
	end
	local UseMemoResult = if FFlagPurchasePromptFetchCartPricing then ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), ReactModule (upval), Checkbox (upval), CountCartPricingOffers (ref), IsDisabled (ref), UseStateResult2 (copy)
		local Elements = {}
		
		for i, value in UseStateResult do
			Elements[value.actionKey] = ReactModule.createElement(Checkbox, {
				size = "XSmall",
				LayoutOrder = CountCartPricingOffers + i,
				label = value.label,
				isChecked = value.isActionSelected,
				isDisabled = IsDisabled,
				onActivated = function()
					-- upvalues: UseStateResult2 (upval), i (copy), value (copy)
					UseStateResult2(function(Tbl)
						-- upvalues: i (upval), value (upval)
						local Copy = table.clone(Tbl)
						Copy[i] = {
							label = value.label,
							isActionSelected = not value.isActionSelected,
							actionKey = value.actionKey
						}
						
						return Copy
					end)
				end
			})
		end
		return Elements
	end, { UseStateResult, CountCartPricingOffers, IsDisabled }) else ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), ReactModule (upval), Checkbox (upval), p1 (copy), FFlagUnifiedPurchaseAddSkeleton (upval), UseStateResult2 (copy)
		local Elements = {}
		local Iterator = ipairs
		local UseStateResult1 = UseStateResult or {}
		for LayoutOrder, value in Iterator(UseStateResult1) do
			Elements["PostPurchaseActionCheckBox_" .. tostring(LayoutOrder)] = ReactModule.createElement(Checkbox, {
				size = "XSmall",
				LayoutOrder = LayoutOrder,
				label = value.label,
				isChecked = value.isActionSelected,
				isDisabled = p1.buttons.isDisabled or (if FFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil),
				onActivated = function()
					-- upvalues: UseStateResult2 (upval), LayoutOrder (copy), value (copy)
					UseStateResult2(function(Tbl)
						-- upvalues: LayoutOrder (upval), value (upval)
						local Copy = table.clone(Tbl)
						Copy[LayoutOrder] = {
							label = value.label,
							isActionSelected = not value.isActionSelected,
							actionKey = value.actionKey
						}
						
						return Copy
					end)
				end
			})
		end
		return Elements
	end, {
		UseStateResult,
		if FFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil
	})
	local SubtitleView = nil
	
	if p1.subtitleView then
		local SubtitleComponentMapModuleEntry = SubtitleComponentMapModule[p1.subtitleView.componentName]
		
		if SubtitleComponentMapModuleEntry then
			SubtitleView = ReactModule.createElement(SubtitleComponentMapModuleEntry, p1.subtitleView.props)
		end
	end
	local Element = if FFlagPurchasePromptFetchCartPricing then ReactModule.createElement(CartPricingProductDetailsModule, {
		cartPricing = UseCartPricingModuleResult,
		purchaseModalType = p1.purchaseModalType,
		subtitleView = SubtitleView,
		priceSuffix = PerMonth,
		isLoading = p1.isLoading,
		isCartPricingLoading = p1.isCartPricingLoading
	}) else ReactModule.createElement(ProductDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = p1.product,
		subtitleView = SubtitleView,
		priceSuffix = PerMonth,
		isLoading = if FFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil
	})
	local Tbl = nil
	local v1 = nil
	
	if FFlagPurchasePromptFetchCartPricing then
		Tbl = BuildCartPricingOfferCheckboxesModule({
			cartPricing = UseCartPricingModuleResult,
			isDisabled = IsDisabled
		})
		v1 = table.clone(Tbl)
		
		for i, value in pairs(UseMemoResult) do
			v1[i] = value
		end
	end
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = p1.buttons.cancelActivated,
		ref = UseFocusNavigationRefsModuleResult
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseStateResult1 }),
		DialogContent = ReactModule.createElement(View, {
			tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
			LayoutOrder = 1
		}, { ProductDetailsContainer = Element }),
		ActionsSection = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-xlarge",
			LayoutOrder = 3
		}, {
			PostPurchaseActions = if FFlagPurchasePromptFetchCartPricing and (next(Tbl) or next(UseMemoResult)) then ReactModule.createElement(View, {
				tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
				LayoutOrder = 1
			}, if FFlagPurchasePromptFetchCartPricing then v1 else { UseMemoResult }) elseif FFlagPurchasePromptFetchCartPricing or not next(UseMemoResult) then nil else ReactModule.createElement(View, {
				tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
				LayoutOrder = 1
			}, if FFlagPurchasePromptFetchCartPricing then v1 else { UseMemoResult }),
			BuyAndUpsell = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y gap-medium",
				LayoutOrder = 2
			}, {
				DialogActions = ReactModule.createElement(Dialog.Actions, {
					LayoutOrder = 1,
					orientation = FoundationModule.Enums.Orientation.Horizontal,
					actions = {
						{
							text = if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then UseLocalizationResult.Subscribe else UseLocalizationResult.Buy,
							variant = ButtonVariant.Emphasis,
							onActivated = UseResult,
							isDisabled = if FFlagPurchasePromptFetchCartPricing then IsDisabled else p1.buttons.isDisabled or (if FFlagUnifiedPurchaseAddSkeleton then p1.isLoading else nil),
							ref = UseFocusNavigationRefsModuleResult2,
							inputDelay = if p1.buttons.buyItemEnableInputDelayed and not p1.buttons.isDisabled then 2.5 else 0
						}
					}
				}),
				BlackbirdUpsellBanner = if p1.BlackbirdUpsellBannerProductInfo and p1.onBlackbirdUpsellActivated then ReactModule.createElement(BlackbirdUpsellBanner, {
					LayoutOrder = 2,
					productInfo = p1.BlackbirdUpsellBannerProductInfo,
					onActivated = p1.onBlackbirdUpsellActivated
				}) else nil
			})
		}),
		TestDisclaimer = if p1.isTestPurchase then ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 5,
			tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap",
			Text = UseLocalizationResult.TestPurchaseDisclaimer
		}) else nil,
		SubscribeTerms = if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 6,
			tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
			Text = string.gsub(string.gsub(UseLocalizationResult.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
		}) else nil
	})
end

return function(p2)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedProductPurchaseModalV2 (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = ReactModule.createElement(UnifiedProductPurchaseModalV2, p2)
	})
end