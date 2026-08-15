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
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local fFlagEnableOffersOnInExperienceSurface = require(parent.Parent.SharedFlags).FFlagEnableOffersOnInExperienceSurface
local _ = require(parent.ProductPurchase.PricingTypes)
local blackbirdUpsellBanner = require(parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner

local function UnifiedProductPurchaseModal(p0) --[[ line: 100 ]]
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), urlBuilder (ref), unifiedPurchaseModalTypeEnumModule (ref), reactModule (ref), useInitialButtonDisableDelayModule (ref), fFlagEnableOffersOnInExperienceSurface (ref), useCartPricingModule (ref), useFocusNavigationRefsModule (ref), checkbox (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), text (ref), cartPricingProductDetailsModule (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), blackbirdUpsellBanner (ref)
	local var15 = useLocalization({
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
	local var16 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var15.PerMonth else nil
	local var17, var18 = reactModule.useState(p0.postPurchaseActions or {})
	local var19, var20 = reactModule.useState(var15.BuyItem)
	local var21 = useInitialButtonDisableDelayModule(p0.buttons.isDisabled)
	local var22 = nil
	local var23 = nil
	local var24 = nil
	local var25 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var22 = useCartPricingModule({
			product = p0.product,
			purchaseModalType = p0.purchaseModalType,
			cartPricingResponse = p0.cartPricingResponse,
			onCartOfferAppliedChanged = p0.onCartOfferAppliedChanged
		})
		local _ = 0
		var24 = p0.buttons.isDisabled or (if p0.isCartPricingLoading ~= true then var21 == true else true)
		local priceWithoutOffersDiscounts = var22.priceWithoutOffersDiscounts
		var25 = var24 or (priceWithoutOffersDiscounts ~= nil and p0.robuxBalanceAmount < priceWithoutOffersDiscounts)
		var23 = if var22.showCartOfferUi then #var22.cartPricingOffers else 0
	end
	reactModule.useEffect(function() --[[ line: 164 ]]
		-- upvalues: p0 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var20 (ref), var15 (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p0.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var20(var15.GetSubscription)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var20(var15.BuyAvatar)
				
				return
			end
			var20(var15.BuyItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var20(var15.BuyExperience)
			
			return
		elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
			var20(var15.BuyItemV2)
			
			return
		end
		var20(var15.BuyItem)
	end, { p0.purchaseModalType })
	local var26, var27 = useFocusNavigationRefsModule(p0.buttons.cancelActivated, p0.onBuyItemButtonMounted)
	local var28 = reactModule.useCallback(function() --[[ line: 190 ]]
		-- upvalues: var17 (ref), p0 (ref)
		if var17 and p0.setPostPurchaseActions then
			p0.setPostPurchaseActions(var17)
		end
		p0.buttons.buyItemActivated()
	end, { p0.buttons.buyItemActivated, var17 })
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: var18 (ref), p0 (ref)
		var18(p0.postPurchaseActions or {})
	end, { p0.postPurchaseActions })
	local var29 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var15.Subscribe else var15.Buy
	local var30 = reactModule.useMemo(function() --[[ line: 207 ]]
		-- upvalues: var17 (ref), reactModule (copy), checkbox (copy), var21 (ref), var18 (ref)
		local t = {}
		
		for i, v in ipairs(var17 or {}) do
			t["PostPurchaseActionCheckBox_" .. tostring(i)] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = i,
				label = v.label,
				isChecked = not var21 and v.isActionSelected,
				isDisabled = var21,
				onActivated = function() --[[ line: 216 ]]
					-- upvalues: var18 (copy), i (ref), v (ref)
					var18(function(p1) --[[ line: 217 ]]
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
	end, { var17, var21 })
	local var31 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var30 = reactModule.useMemo(function() --[[ line: 235 ]]
			-- upvalues: var17 (ref), reactModule (copy), checkbox (copy), var23 (write), var24 (write), var18 (ref)
			local t = {}
			
			for i, v in var17 do
				t[v.actionKey] = reactModule.createElement(checkbox, {
					size = "XSmall",
					LayoutOrder = var23 + i,
					label = v.label,
					isChecked = v.isActionSelected,
					isDisabled = var24,
					onActivated = function() --[[ line: 244 ]]
						-- upvalues: var18 (copy), i (ref), v (ref)
						var18(function(p2) --[[ line: 245 ]]
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
		end, { var17, var23, var24 })
		local cloned = table.clone(buildCartPricingOfferCheckboxesModule({ cartPricing = var22, isDisabled = var25 }))
		
		for i, v in pairs(var30) do
			cloned[i] = v
		end
		var31 = reactModule.createElement(view, {
			tag = "col gap-medium auto-y size-full-0 align-x-start align-y-start",
			LayoutOrder = 2
		}, cloned)
	end
	local var33 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then p0.product.itemPrice else nil
	local var34 = if var33 then var33.priceInRobux else p0.product.itemRobuxCost
	local var35 = if fFlagEnableOffersOnInExperienceSurface then reactModule.createElement(cartPricingProductDetailsModule, {
		cartPricing = var22,
		purchaseModalType = p0.purchaseModalType,
		priceSuffix = var16,
		isCartPricingLoading = p0.isCartPricingLoading
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p0.purchaseModalType,
		product = p0.product,
		priceSuffix = var16
	})
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p0.buttons.cancelActivated,
		ref = if var21 then nil else var26
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p0.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var19,
				robuxBalanceAmount = p0.robuxBalanceAmount,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p0.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				ProductDetailsContainer = var35 or reactModule.createElement(view, {
					tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
					LayoutOrder = 1
				}, {
					ProductDetails = if p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = var34, itemPrice = var33 }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						itemIcon = p0.product.itemIcon,
						itemName = p0.product.itemName,
						itemRobuxCost = var34,
						itemPrice = var33,
						itemDisplayPrice = if fFlagEnableUnifiedPurchaseFlowForDevSubs then p0.product.itemDisplayPrice else nil,
						priceSuffix = var16,
						model = p0.product.model
					})
				}),
				PostPurchaseActions = if fFlagEnableOffersOnInExperienceSurface then var31 elseif next(var30) then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" else "col gap-medium auto-y size-full-0 align-x-start align-y-start"
				}, { var30 }) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium",
				LayoutOrder = 1
			}, {
				BuyButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = var29,
					onActivated = var28,
					inputDelay = if p0.buttons.buyItemEnableInputDelayed and not var21 then 2.5 else 0,
					isDisabled = if fFlagEnableOffersOnInExperienceSurface then var24 else var21,
					ref = var27,
					fillBehavior = fillBehavior.Fill,
					variant = buttonVariant.Emphasis
				}),
				BlackbirdUpsellBanner = if p0.BlackbirdUpsellBannerProductInfo and p0.onBlackbirdUpsellActivated then reactModule.createElement(blackbirdUpsellBanner, {
					LayoutOrder = 2,
					productInfo = p0.BlackbirdUpsellBannerProductInfo,
					onActivated = p0.onBlackbirdUpsellActivated
				}) else nil,
				TestPurchaseDisclaimer = if p0.isTestPurchase then reactModule.createElement(text, {
					tag = "auto-y size-full-0 text-caption-small text-align-x-center text-wrap wrap",
					LayoutOrder = 3,
					Text = var15.TestPurchaseDisclaimer
				}) else nil,
				SubscribeTerms = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then reactModule.createElement(text, {
					LayoutOrder = 4,
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					Text = string.gsub(string.gsub(var15.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
				}) else nil
			})
		})
	})
end

return function(p3) --[[ line: 415 | named "UnifiedProductPurchaseModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedProductPurchaseModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(UnifiedProductPurchaseModal, p3)
	})
end