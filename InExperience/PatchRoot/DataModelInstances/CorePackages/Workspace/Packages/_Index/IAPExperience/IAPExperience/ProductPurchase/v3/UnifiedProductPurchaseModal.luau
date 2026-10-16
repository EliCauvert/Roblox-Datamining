local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Checkbox = FoundationModule.Checkbox
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local View = FoundationModule.View
local Text = FoundationModule.Text
local FillBehavior = FoundationModule.Enums.FillBehavior
local UnifiedProductDetailsModule = require(Parent.Generic.UnifiedProductDetails)
local PriceSummaryModule = require(Parent.Generic.PriceSummary)
local UnifiedPurchaseModalHeaderModule = require(Parent.Generic.UnifiedPurchaseModalHeader)
local _ = require(Parent.Generic.ProductDetailsContainer)
local UseCartPricingModule = require(Parent.ProductPurchase.v4.useCartPricing)
local BuildCartPricingOfferCheckboxesModule = require(Parent.ProductPurchase.v4.buildCartPricingOfferCheckboxes)
local _ = require(Parent.ProductPurchase.v4.cartPricingResponseLineItem)
local CartPricingProductDetailsModule = require(Parent.ProductPurchase.v4.CartPricingProductDetails)
local UrlBuilder = require(Parent1.UrlBuilder).UrlBuilder
local UseInitialButtonDisableDelayModule = require(Parent.Generic.Hooks.useInitialButtonDisableDelay)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local _ = require(script.Parent.UnifiedProductPurchaseModalTypes)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagOffersOnlyAffordableLock = require(Parent.Parent.SharedFlags).FFlagOffersOnlyAffordableLock
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local _ = require(Parent.ProductPurchase.PricingTypes)
local BlackbirdUpsellBanner = require(Parent1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner

local function UnifiedProductPurchaseModal(p1) --[[ Line: 100 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), UrlBuilder (copy), UnifiedPurchaseModalTypeEnumModule (copy), ReactModule (copy), UseInitialButtonDisableDelayModule (copy), UseCartPricingModule (copy), FFlagOffersOnlyAffordableLock (copy), UseFocusNavigationRefsModule (copy), Checkbox (copy), BuildCartPricingOfferCheckboxesModule (copy), View (copy), Text (copy), CartPricingProductDetailsModule (copy), Sheet (copy), UnifiedPurchaseModalHeaderModule (copy), PriceSummaryModule (copy), UnifiedProductDetailsModule (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy), BlackbirdUpsellBanner (copy)
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
		PerMonth = if FFlagEnableUnifiedPurchaseFlowForDevSubs or FFlagLuaAppsEnablePromptVIPServerPurchase then "Feature.Subscription.Text.PerMonth" else nil,
		Free = if FFlagLuaAppsEnablePromptVIPServerPurchase then "Feature.Catalog.LabelFree" else nil,
		FreeWithPlus = if FFlagLuaAppsEnablePromptVIPServerPurchase then "Feature.PrivateServers.Action.FreeWithBlackbird" else nil,
		CreatePrivateServer = if FFlagLuaAppsEnablePromptVIPServerPurchase then "Feature.PrivateServers.Action.CreatePrivateServer" else nil,
		SubscribeTermsAgreement = if FFlagEnableUnifiedPurchaseFlowForDevSubs then {
			"Feature.Subscription.Footer.PurchasePromptLegalText",
			SubscribeButtonTitle = "\"Subscribe\"",
			tosUrl = UrlBuilder.static.about.terms()
		} else nil
	})
	local PerMonth = if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then UseLocalizationResult.PerMonth elseif FFlagLuaAppsEnablePromptVIPServerPurchase and p1.isMonthlyPrice then UseLocalizationResult.PerMonth else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.postPurchaseActions or {})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseLocalizationResult.BuyItem)
	local UseInitialButtonDisableDelayModuleResult = UseInitialButtonDisableDelayModule(p1.buttons.isDisabled)
	local UseCartPricingModuleResult = UseCartPricingModule({
		product = p1.product,
		purchaseModalType = p1.purchaseModalType,
		cartPricingResponse = p1.cartPricingResponse,
		onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
	})
	local IsDisabled = p1.buttons.isDisabled or (p1.isCartPricingLoading == true or UseInitialButtonDisableDelayModuleResult == true)
	local PriceWithoutOffersDiscounts = UseCartPricingModuleResult.priceWithoutOffersDiscounts
	local PriceAfterOffersDiscounts = UseCartPricingModuleResult.priceAfterOffersDiscounts
	local IsRobuxBalanceAmountBelow: boolean = PriceWithoutOffersDiscounts ~= nil and p1.robuxBalanceAmount < PriceWithoutOffersDiscounts
	local IsPriceAfterOffersDiscountsBelow: boolean = PriceAfterOffersDiscounts ~= nil and PriceAfterOffersDiscounts <= p1.robuxBalanceAmount
	local IsDisabled1 = IsDisabled or IsRobuxBalanceAmountBelow and (not FFlagOffersOnlyAffordableLock or IsPriceAfterOffersDiscountsBelow)
	local CountCartPricingOffers: number = if UseCartPricingModuleResult.showCartOfferUi then #UseCartPricingModuleResult.cartPricingOffers else 0
	ReactModule.useEffect(function() --[[ Line: 177 ]]
		-- upvalues: p1 (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), UnifiedPurchaseModalTypeEnumModule (upval), UseStateResult2_1 (copy), UseLocalizationResult (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval), FFlagLuaAppsEnablePromptVIPServerPurchase (upval)
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
			if FFlagLuaAppsEnablePromptVIPServerPurchase and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.VIPServer then
				UseStateResult2_1(UseLocalizationResult.CreatePrivateServer)
				
				return
			end
			if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				UseStateResult2_1(UseLocalizationResult.BuyItemV2)
				
				return
			else
				UseStateResult2_1(UseLocalizationResult.BuyItem)
			end
		end
	end, { p1.purchaseModalType })
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.cancelActivated, p1.onBuyItemButtonMounted)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 205 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		if UseStateResult and p1.setPostPurchaseActions then
			p1.setPostPurchaseActions(UseStateResult)
		end
		p1.buttons.buyItemActivated()
	end, { p1.buttons.buyItemActivated, UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 213 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p1.postPurchaseActions or {})
	end, { p1.postPurchaseActions })
	local Subscribe = if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then UseLocalizationResult.Subscribe else UseLocalizationResult.Buy
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 223 ]]
		-- upvalues: UseStateResult (copy), ReactModule (upval), Checkbox (upval), CountCartPricingOffers (copy), IsDisabled (copy), UseStateResult2 (copy)
		local Elements = {}
		
		for i, value in UseStateResult do
			Elements[value.actionKey] = ReactModule.createElement(Checkbox, {
				size = "XSmall",
				LayoutOrder = CountCartPricingOffers + i,
				label = value.label,
				isChecked = value.isActionSelected,
				isDisabled = IsDisabled,
				onActivated = function() --[[ Line: 232 ]]
					-- upvalues: UseStateResult2 (upval), i (copy), value (copy)
					UseStateResult2(function(Tbl) --[[ Line: 233 ]]
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
	local Copy = table.clone((BuildCartPricingOfferCheckboxesModule({
		cartPricing = UseCartPricingModuleResult,
		isDisabled = IsDisabled1
	})))
	
	for i, value in pairs(UseMemoResult) do
		Copy[i] = value
	end
	local ItemPrice = p1.product.itemPrice
	local PriceInRobux = if ItemPrice then ItemPrice.priceInRobux else p1.product.itemRobuxCost
	local FreeWithPlus = if FFlagLuaAppsEnablePromptVIPServerPurchase and PriceInRobux == 0 then if p1.isFreeWithRobloxPlus then UseLocalizationResult.FreeWithPlus elseif p1.isMonthlyPrice then UseLocalizationResult.Free else nil else nil
	local IsPurchaseModalTypeMatch: boolean = FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local Element = ReactModule.createElement(CartPricingProductDetailsModule, {
		cartPricing = UseCartPricingModuleResult,
		purchaseModalType = p1.purchaseModalType,
		priceSuffix = PerMonth,
		priceText = if FFlagLuaAppsEnablePromptVIPServerPurchase then FreeWithPlus else nil,
		includePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.isMonthlyPrice else nil,
		isCartPricingLoading = p1.isCartPricingLoading
	})
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelActivated,
		ref = if UseInitialButtonDisableDelayModuleResult then nil else UseFocusNavigationRefsModuleResult
	}, {
		Header = ReactModule.createElement(Sheet.Header, {
			hasCloseAffordance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.hideUserRobuxBalance then true else nil
		}, {
			ModalHeader = ReactModule.createElement(UnifiedPurchaseModalHeaderModule, {
				titleText = UseStateResult1,
				robuxBalanceAmount = p1.robuxBalanceAmount,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				ProductDetailsContainer = if Element then Element else ReactModule.createElement(View, {
					tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
					LayoutOrder = 1
				}, {
					ProductDetails = if p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then ReactModule.createElement(PriceSummaryModule, { amount = PriceInRobux, itemPrice = ItemPrice }) else ReactModule.createElement(UnifiedProductDetailsModule, {
						isPortrait = false,
						itemIcon = p1.product.itemIcon,
						itemName = p1.product.itemName,
						itemRobuxCost = PriceInRobux,
						itemPrice = ItemPrice,
						itemDisplayPrice = if FFlagEnableUnifiedPurchaseFlowForDevSubs then p1.product.itemDisplayPrice else nil,
						priceSuffix = PerMonth,
						model = p1.product.model
					})
				}),
				PostPurchaseActions = ReactModule.createElement(View, {
					tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
					LayoutOrder = 2
				}, Copy)
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ReactModule.createElement(View, {
				tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium",
				LayoutOrder = 1
			}, {
				BuyButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					text = Subscribe,
					onActivated = UseResult,
					inputDelay = if p1.buttons.buyItemEnableInputDelayed and not UseInitialButtonDisableDelayModuleResult then 2.5 else 0,
					isDisabled = IsDisabled,
					ref = UseFocusNavigationRefsModuleResult2,
					fillBehavior = FillBehavior.Fill,
					variant = ButtonVariant.Emphasis
				}),
				BlackbirdUpsellBanner = if p1.BlackbirdUpsellBannerProductInfo and p1.onBlackbirdUpsellActivated then ReactModule.createElement(BlackbirdUpsellBanner, {
					LayoutOrder = 2,
					productInfo = p1.BlackbirdUpsellBannerProductInfo,
					onActivated = p1.onBlackbirdUpsellActivated
				}) else nil,
				TestPurchaseDisclaimer = if p1.isTestPurchase then ReactModule.createElement(Text, {
					tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap",
					LayoutOrder = 3,
					Text = UseLocalizationResult.TestPurchaseDisclaimer
				}) else nil,
				SubscribeTerms = if IsPurchaseModalTypeMatch then ReactModule.createElement(Text, {
					LayoutOrder = 4,
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					Text = string.gsub(string.gsub(UseLocalizationResult.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
				}) else nil
			})
		})
	})
end

return function(p2) --[[ Line: 396 | Named "UnifiedProductPurchaseModalContainer" ]]
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedProductPurchaseModal (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = ReactModule.createElement(UnifiedProductPurchaseModal, p2)
	})
end