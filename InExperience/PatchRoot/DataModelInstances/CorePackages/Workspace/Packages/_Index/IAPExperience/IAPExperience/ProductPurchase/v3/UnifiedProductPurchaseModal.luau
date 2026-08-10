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
local _ = require(parent.ProductPurchase.PricingTypes)
local blackbirdUpsellBanner = require(parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner

local function UnifiedProductPurchaseModal(p0) --[[ line: 87 ]]
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), urlBuilder (ref), unifiedPurchaseModalTypeEnumModule (ref), reactModule (ref), useInitialButtonDisableDelayModule (ref), useFocusNavigationRefsModule (ref), checkbox (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), text (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), view (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), blackbirdUpsellBanner (ref)
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
	local var14, var15 = reactModule.useState(p0.postPurchaseActions or {})
	local var16, var17 = reactModule.useState(var12.BuyItem)
	local var18 = useInitialButtonDisableDelayModule(p0.buttons.isDisabled)
	reactModule.useEffect(function() --[[ line: 124 ]]
		-- upvalues: p0 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var17 (ref), var12 (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p0.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var17(var12.GetSubscription)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var17(var12.BuyAvatar)
				
				return
			end
			var17(var12.BuyItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var17(var12.BuyExperience)
			
			return
		elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
			var17(var12.BuyItemV2)
			
			return
		end
		var17(var12.BuyItem)
	end, { p0.purchaseModalType })
	local var19, var20 = useFocusNavigationRefsModule(p0.buttons.cancelActivated, p0.onBuyItemButtonMounted)
	local var21 = reactModule.useCallback(function() --[[ line: 150 ]]
		-- upvalues: var14 (ref), p0 (ref)
		if var14 and p0.setPostPurchaseActions then
			p0.setPostPurchaseActions(var14)
		end
		p0.buttons.buyItemActivated()
	end, { p0.buttons.buyItemActivated, var14 })
	reactModule.useEffect(function() --[[ line: 158 ]]
		-- upvalues: var15 (ref), p0 (ref)
		var15(p0.postPurchaseActions or {})
	end, { p0.postPurchaseActions })
	local var22 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var12.Subscribe else var12.Buy
	local var23 = reactModule.useMemo(function() --[[ line: 167 ]]
		-- upvalues: var14 (ref), reactModule (copy), checkbox (copy), var18 (ref), var15 (ref)
		local t = {}
		
		for i, v in ipairs(var14 or {}) do
			t["PostPurchaseActionCheckBox_" .. tostring(i)] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = i,
				label = v.label,
				isChecked = not var18 and v.isActionSelected,
				isDisabled = var18,
				onActivated = function() --[[ line: 176 ]]
					-- upvalues: var15 (copy), i (ref), v (ref)
					var15(function(p1) --[[ line: 177 ]]
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
	end, { var14, var18 })
	local var24 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then p0.product.itemPrice else nil
	local var25 = if var24 then var24.priceInRobux else p0.product.itemRobuxCost
	local var26 = reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p0.purchaseModalType,
		product = p0.product,
		priceSuffix = var13
	})
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p0.buttons.cancelActivated,
		ref = if var18 then nil else var19
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p0.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var16,
				robuxBalanceAmount = p0.robuxBalanceAmount,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p0.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				ProductDetailsContainer = var26 or reactModule.createElement(view, {
					tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
					LayoutOrder = 1
				}, {
					ProductDetails = if p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = var25, itemPrice = var24 }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						itemIcon = p0.product.itemIcon,
						itemName = p0.product.itemName,
						itemRobuxCost = var25,
						itemPrice = var24,
						itemDisplayPrice = if fFlagEnableUnifiedPurchaseFlowForDevSubs then p0.product.itemDisplayPrice else nil,
						priceSuffix = var13,
						model = p0.product.model
					})
				}),
				PostPurchaseActions = if next(var23) then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" else "col gap-medium auto-y size-full-0 align-x-start align-y-start"
				}, { var23 }) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium",
				LayoutOrder = 1
			}, {
				BuyButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = var22,
					onActivated = var21,
					inputDelay = if p0.buttons.buyItemEnableInputDelayed and not var18 then 2.5 else 0,
					isDisabled = var18,
					ref = var20,
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
					Text = var12.TestPurchaseDisclaimer
				}) else nil,
				SubscribeTerms = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then reactModule.createElement(text, {
					LayoutOrder = 4,
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					Text = string.gsub(string.gsub(var12.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
				}) else nil
			})
		})
	})
end

return function(p2) --[[ line: 315 | named "UnifiedProductPurchaseModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedProductPurchaseModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(UnifiedProductPurchaseModal, p2)
	})
end