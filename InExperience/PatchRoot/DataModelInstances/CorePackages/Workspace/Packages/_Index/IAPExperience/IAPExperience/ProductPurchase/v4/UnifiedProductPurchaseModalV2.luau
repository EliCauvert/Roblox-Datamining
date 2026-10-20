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
local _ = require(Parent.Generic.ProductDetailsContainer)
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
local FFlagOffersOnlyAffordableLock = require(Parent.Parent.SharedFlags).FFlagOffersOnlyAffordableLock
local _ = require(script.Parent.cartPricingResponseLineItem)

local function UnifiedProductPurchaseModalV2(p1) --[[ Line: 99 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), UrlBuilder (copy), UnifiedPurchaseModalTypeEnumModule (copy), UseCartPricingModule (copy), ReactModule (copy), UseFocusNavigationRefsModule (copy), FFlagUnifiedPurchaseAddSkeleton (copy), FFlagOffersOnlyAffordableLock (copy), Checkbox (copy), SubtitleComponentMapModule (copy), CartPricingProductDetailsModule (copy), BuildCartPricingOfferCheckboxesModule (copy), View (copy), ButtonVariant (copy), FoundationModule (copy), Dialog (copy), DialogSize (copy), BlackbirdUpsellBanner (copy)
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
	local UseCartPricingModuleResult = UseCartPricingModule({
		product = p1.product,
		purchaseModalType = p1.purchaseModalType,
		cartPricingResponse = p1.cartPricingResponse,
		onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.postPurchaseActions or {})
	local PurchaseModalType = p1.purchaseModalType
	local GetSubscription = if FFlagEnableUnifiedPurchaseFlowForDevSubs and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then UseLocalizationResult.GetSubscription elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then UseLocalizationResult.BuyAvatar elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.Experience then UseLocalizationResult.BuyExperience else UseLocalizationResult.BuyItemV2
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.cancelActivated, p1.onBuyItemButtonMounted)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 154 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		if UseStateResult and p1.setPostPurchaseActions then
			p1.setPostPurchaseActions(UseStateResult)
		end
		p1.buttons.buyItemActivated()
	end, { p1.buttons.buyItemActivated, UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 162 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.postPurchaseActions or {})
	end, { p1.postPurchaseActions })
	local IsDisabled = p1.buttons.isDisabled or (p1.isCartPricingLoading == true or FFlagUnifiedPurchaseAddSkeleton and p1.isLoading == true)
	local PriceWithoutOffersDiscounts = UseCartPricingModuleResult.priceWithoutOffersDiscounts
	local PriceAfterOffersDiscounts = UseCartPricingModuleResult.priceAfterOffersDiscounts
	local IsRobuxBalanceAmountBelow: boolean = PriceWithoutOffersDiscounts ~= nil and p1.robuxBalanceAmount < PriceWithoutOffersDiscounts
	local IsPriceAfterOffersDiscountsBelow: boolean = PriceAfterOffersDiscounts ~= nil and PriceAfterOffersDiscounts <= p1.robuxBalanceAmount
	local IsDisabled1 = IsDisabled or IsRobuxBalanceAmountBelow and (not FFlagOffersOnlyAffordableLock or IsPriceAfterOffersDiscountsBelow)
	local CountCartPricingOffers: number = if UseCartPricingModuleResult.showCartOfferUi then #UseCartPricingModuleResult.cartPricingOffers else 0
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 190 ]]
		-- upvalues: UseStateResult (copy), ReactModule (upval), Checkbox (upval), CountCartPricingOffers (copy), IsDisabled (copy), UseStateResult2 (copy)
		local Elements = {}
		
		for i, value in UseStateResult do
			Elements[value.actionKey] = ReactModule.createElement(Checkbox, {
				size = "XSmall",
				LayoutOrder = CountCartPricingOffers + i,
				label = value.label,
				isChecked = value.isActionSelected,
				isDisabled = IsDisabled,
				onActivated = function() --[[ Line: 199 ]]
					-- upvalues: UseStateResult2 (upval), i (copy), value (copy)
					UseStateResult2(function(Tbl) --[[ Line: 200 ]]
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
	end, { UseStateResult, CountCartPricingOffers, IsDisabled })
	local Element = nil
	
	if p1.subtitleView then
		local SubtitleComponentMapModuleEntry = SubtitleComponentMapModule[p1.subtitleView.componentName]
		
		if SubtitleComponentMapModuleEntry then
			Element = ReactModule.createElement(SubtitleComponentMapModuleEntry, p1.subtitleView.props)
		end
	end
	local Element1 = ReactModule.createElement(CartPricingProductDetailsModule, {
		cartPricing = UseCartPricingModuleResult,
		purchaseModalType = p1.purchaseModalType,
		subtitleView = Element,
		priceSuffix = PerMonth,
		isLoading = p1.isLoading,
		isCartPricingLoading = p1.isCartPricingLoading
	})
	local CartPricingOfferCheckboxesModule = BuildCartPricingOfferCheckboxesModule({
		cartPricing = UseCartPricingModuleResult,
		isDisabled = IsDisabled1
	})
	local Copy = table.clone(CartPricingOfferCheckboxesModule)
	
	for i, value in pairs(UseMemoResult) do
		Copy[i] = value
	end
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = p1.buttons.cancelActivated,
		ref = UseFocusNavigationRefsModuleResult
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = GetSubscription }),
		DialogContent = ReactModule.createElement(View, {
			tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
			LayoutOrder = 1
		}, { ProductDetailsContainer = Element1 }),
		ActionsSection = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y gap-xlarge",
			LayoutOrder = 3
		}, {
			PostPurchaseActions = if next(CartPricingOfferCheckboxesModule) or next(UseMemoResult) then ReactModule.createElement(View, {
				tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
				LayoutOrder = 1
			}, Copy) else nil,
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
							isDisabled = IsDisabled,
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

return function(p2) --[[ Line: 337 | Named "UnifiedProductPurchaseModalV2Container" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedProductPurchaseModalV2 (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = ReactModule.createElement(UnifiedProductPurchaseModalV2, p2)
	})
end