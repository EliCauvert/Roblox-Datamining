local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local checkbox = foundationModule.Checkbox
local sheet = foundationModule.Sheet
local button = foundationModule.Button
local view = foundationModule.View
local text = foundationModule.Text
local fillBehavior = foundationModule.Enums.FillBehavior
local unifiedProductDetailsModule = require(parent.Generic.UnifiedProductDetails)
local priceSummaryModule = require(parent.Generic.PriceSummary)
local unifiedPurchaseModalHeaderModule = require(parent.Generic.UnifiedPurchaseModalHeader)
local productDetailsContainerModule = require(parent.Generic.ProductDetailsContainer)
local useCartPricingModule = require(parent.ProductPurchase.v4.useCartPricing)
local buildCartPricingOfferCheckboxesModule = require(parent.ProductPurchase.v4.buildCartPricingOfferCheckboxes)
local _ = require(parent.ProductPurchase.v4.cartPricingResponseLineItem)
local cartPricingProductDetailsModule = require(parent.ProductPurchase.v4.CartPricingProductDetails)
local urlBuilder = require(parent_1.UrlBuilder).UrlBuilder
local useInitialButtonDisableDelayModule = require(parent.Generic.Hooks.useInitialButtonDisableDelay)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local _ = require(script.Parent.UnifiedProductPurchaseModalTypes)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagEnableOffersOnInExperienceSurface = require(parent.Parent.SharedFlags).FFlagEnableOffersOnInExperienceSurface
local fFlagOffersOnlyAffordableLock = require(parent.Parent.SharedFlags).FFlagOffersOnlyAffordableLock
local _ = require(parent.ProductPurchase.PricingTypes)
local blackbirdUpsellBanner = require(parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner

local function UnifiedProductPurchaseModal(p1)
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), urlBuilder (ref), unifiedPurchaseModalTypeEnumModule (ref), reactModule (ref), useInitialButtonDisableDelayModule (ref), fFlagEnableOffersOnInExperienceSurface (ref), useCartPricingModule (ref), fFlagOffersOnlyAffordableLock (ref), useFocusNavigationRefsModule (ref), checkbox (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), text (ref), cartPricingProductDetailsModule (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), blackbirdUpsellBanner (ref)
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
	local var3, var4 = reactModule.useState(p1.postPurchaseActions or {})
	local var5, var6 = reactModule.useState(var1.BuyItem)
	local var7 = useInitialButtonDisableDelayModule(p1.buttons.isDisabled)
	local var8 = nil
	local var9 = nil
	local var10 = nil
	local var11 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var8 = useCartPricingModule({
			product = p1.product,
			purchaseModalType = p1.purchaseModalType,
			cartPricingResponse = p1.cartPricingResponse,
			onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
		})
		local _ = 0
		var10 = p1.buttons.isDisabled or (if p1.isCartPricingLoading ~= true then var7 == true else true)
		local priceWithoutOffersDiscounts = var8.priceWithoutOffersDiscounts
		local priceAfterOffersDiscounts = var8.priceAfterOffersDiscounts
		local var12 = priceWithoutOffersDiscounts ~= nil and p1.robuxBalanceAmount < priceWithoutOffersDiscounts
		var11 = var10 or (var12 and (not fFlagOffersOnlyAffordableLock or (priceAfterOffersDiscounts ~= nil and priceAfterOffersDiscounts <= p1.robuxBalanceAmount)))
		var9 = if var8.showCartOfferUi then #var8.cartPricingOffers else 0
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var6 (ref), var1 (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p1.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var6(var1.GetSubscription)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var6(var1.BuyAvatar)
				
				return
			end
			var6(var1.BuyItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var6(var1.BuyExperience)
			
			return
		elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
			var6(var1.BuyItemV2)
			
			return
		end
		var6(var1.BuyItem)
	end, { p1.purchaseModalType })
	local var13, var14 = useFocusNavigationRefsModule(p1.buttons.cancelActivated, p1.onBuyItemButtonMounted)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		if var3 and p1.setPostPurchaseActions then
			p1.setPostPurchaseActions(var3)
		end
		p1.buttons.buyItemActivated()
	end, { p1.buttons.buyItemActivated, var3 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref)
		var4(p1.postPurchaseActions or {})
	end, { p1.postPurchaseActions })
	local var16 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var1.Subscribe else var1.Buy
	local var17 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), reactModule (copy), checkbox (copy), var7 (ref), var4 (ref)
		local t = {}
		
		for i, v in ipairs(var3 or {}) do
			t["PostPurchaseActionCheckBox_" .. tostring(i)] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = i,
				label = v.label,
				isChecked = not var7 and v.isActionSelected,
				isDisabled = var7,
				onActivated = function()
					-- upvalues: var4 (copy), i (ref), v (ref)
					var4(function(p2)
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
	end, { var3, var7 })
	local var18 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var17 = reactModule.useMemo(function()
			-- upvalues: var3 (ref), reactModule (copy), checkbox (copy), var9 (write), var10 (write), var4 (ref)
			local t = {}
			
			for i, v in var3 do
				t[v.actionKey] = reactModule.createElement(checkbox, {
					size = "XSmall",
					LayoutOrder = var9 + i,
					label = v.label,
					isChecked = v.isActionSelected,
					isDisabled = var10,
					onActivated = function()
						-- upvalues: var4 (copy), i (ref), v (ref)
						var4(function(p2)
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
		end, { var3, var9, var10 })
		local cloned = table.clone(buildCartPricingOfferCheckboxesModule({ cartPricing = var8, isDisabled = var11 }))
		
		for i, v in pairs(var17) do
			cloned[i] = v
		end
		var18 = reactModule.createElement(view, {
			tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
			LayoutOrder = 2
		}, cloned)
	end
	local itemPrice = p1.product.itemPrice
	local var19 = if itemPrice then itemPrice.priceInRobux else p1.product.itemRobuxCost
	local var20 = if fFlagEnableOffersOnInExperienceSurface then reactModule.createElement(cartPricingProductDetailsModule, {
		cartPricing = var8,
		purchaseModalType = p1.purchaseModalType,
		priceSuffix = var2,
		isCartPricingLoading = p1.isCartPricingLoading
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = p1.product,
		priceSuffix = var2
	})
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelActivated,
		ref = if var7 then nil else var13
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p1.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var5,
				robuxBalanceAmount = p1.robuxBalanceAmount,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				ProductDetailsContainer = var20 or reactModule.createElement(view, {
					tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
					LayoutOrder = 1
				}, {
					ProductDetails = if p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = var19, itemPrice = itemPrice }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						itemIcon = p1.product.itemIcon,
						itemName = p1.product.itemName,
						itemRobuxCost = var19,
						itemPrice = itemPrice,
						itemDisplayPrice = if fFlagEnableUnifiedPurchaseFlowForDevSubs then p1.product.itemDisplayPrice else nil,
						priceSuffix = var2,
						model = p1.product.model
					})
				}),
				PostPurchaseActions = if fFlagEnableOffersOnInExperienceSurface then var18 elseif next(var17) then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" else "col gap-medium auto-y size-full-0 align-x-start align-y-start"
				}, { var17 }) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium",
				LayoutOrder = 1
			}, {
				BuyButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = var16,
					onActivated = var15,
					inputDelay = if p1.buttons.buyItemEnableInputDelayed and not var7 then 2.5 else 0,
					isDisabled = if fFlagEnableOffersOnInExperienceSurface then var10 else var7,
					ref = var14,
					fillBehavior = fillBehavior.Fill,
					variant = buttonVariant.Emphasis
				}),
				BlackbirdUpsellBanner = if p1.BlackbirdUpsellBannerProductInfo and p1.onBlackbirdUpsellActivated then reactModule.createElement(blackbirdUpsellBanner, {
					LayoutOrder = 2,
					productInfo = p1.BlackbirdUpsellBannerProductInfo,
					onActivated = p1.onBlackbirdUpsellActivated
				}) else nil,
				TestPurchaseDisclaimer = if p1.isTestPurchase then reactModule.createElement(text, {
					tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap",
					LayoutOrder = 3,
					Text = var1.TestPurchaseDisclaimer
				}) else nil,
				SubscribeTerms = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then reactModule.createElement(text, {
					LayoutOrder = 4,
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					Text = string.gsub(string.gsub(var1.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
				}) else nil
			})
		})
	})
end

return function(p2)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedProductPurchaseModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(UnifiedProductPurchaseModal, p2)
	})
end