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
local fFlagFixUnifiedModalsMountedTwiceModule = require(parent.Flags.FFlagFixUnifiedModalsMountedTwice)
local fFlagAddFocusNavigationToUnifiedPurchaseModule = require(parent.Flags.FFlagAddFocusNavigationToUnifiedPurchase)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local _ = require(parent.ProductPurchase.PricingTypes)
local blackbirdUpsellBanner = require(parent_1.RobloxSubscriptionPurchaseApp).Components.BlackbirdUpsellBanner

local function UnifiedProductPurchaseModal(p0) --[[ line: 90 ]]
	-- upvalues: useLocalization (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), urlBuilder (ref), unifiedPurchaseModalTypeEnumModule (ref), reactModule (ref), useInitialButtonDisableDelayModule (ref), fFlagFixUnifiedModalsMountedTwiceModule (ref), fFlagAddFocusNavigationToUnifiedPurchaseModule (ref), useFocusNavigationRefsModule (ref), checkbox (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), text (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), view (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), button (ref), fillBehavior (ref), buttonVariant (ref), blackbirdUpsellBanner (ref)
	local var14 = useLocalization({
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
	local var15 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var14.PerMonth else nil
	local var16, var17 = reactModule.useState(p0.postPurchaseActions or {})
	local var18, var19 = reactModule.useState(var14.BuyItem)
	local var20 = useInitialButtonDisableDelayModule(p0.buttons.isDisabled)
	reactModule.useEffect(function() --[[ line: 127 ]]
		-- upvalues: p0 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var19 (ref), var14 (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p0.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var19(var14.GetSubscription)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var19(var14.BuyAvatar)
				
				return
			end
			var19(var14.BuyItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var19(var14.BuyExperience)
			
			return
		elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
			var19(var14.BuyItemV2)
			
			return
		end
		var19(var14.BuyItem)
	end, { p0.purchaseModalType })
	local var21 = if fFlagFixUnifiedModalsMountedTwiceModule then reactModule.useCallback(function(p2) --[[ line: 160 ]]
		-- upvalues: p0 (ref), var20 (ref)
		if p2 and p0.onBuyItemButtonMounted and not var20 then
			p0.onBuyItemButtonMounted(p2)
		end
	end, { p0.onBuyItemButtonMounted, var20 }) else reactModule.useCallback(function(p1) --[[ line: 151 ]]
		-- upvalues: p0 (ref)
		if p1 and p0.onBuyItemButtonMounted then
			p0.onBuyItemButtonMounted(p1)
		end
	end, { p0.onBuyItemButtonMounted })
	local var22 = nil
	local var23 = nil
	
	if fFlagAddFocusNavigationToUnifiedPurchaseModule then
		local var24, var25 = useFocusNavigationRefsModule(p0.buttons.cancelActivated, p0.onBuyItemButtonMounted)
		var22 = var24
		var23 = var25
	end
	local var26 = reactModule.useCallback(function() --[[ line: 174 ]]
		-- upvalues: var16 (ref), p0 (ref)
		if var16 and p0.setPostPurchaseActions then
			p0.setPostPurchaseActions(var16)
		end
		p0.buttons.buyItemActivated()
	end, { p0.buttons.buyItemActivated, var16 })
	reactModule.useEffect(function() --[[ line: 182 ]]
		-- upvalues: var17 (ref), p0 (ref)
		var17(p0.postPurchaseActions or {})
	end, { p0.postPurchaseActions })
	local var27 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then var14.Subscribe else var14.Buy
	local var28 = reactModule.useMemo(function() --[[ line: 191 ]]
		-- upvalues: var16 (ref), reactModule (copy), checkbox (copy), var20 (ref), var17 (ref)
		local t = {}
		
		for i, v in ipairs(var16 or {}) do
			t["PostPurchaseActionCheckBox_" .. tostring(i)] = reactModule.createElement(checkbox, {
				size = "XSmall",
				LayoutOrder = i,
				label = v.label,
				isChecked = not var20 and v.isActionSelected,
				isDisabled = var20,
				onActivated = function() --[[ line: 200 ]]
					-- upvalues: var17 (copy), i (ref), v (ref)
					var17(function(p3) --[[ line: 201 ]]
						-- upvalues: i (copy), v (copy)
						local cloned = table.clone(p3)
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
	end, { var16, var20 })
	local var29 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then p0.product.itemPrice else nil
	local var30 = if var29 then var29.priceInRobux else p0.product.itemRobuxCost
	local var31 = reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p0.purchaseModalType,
		product = p0.product,
		priceSuffix = var15
	})
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p0.buttons.cancelActivated,
		ref = if var20 then nil elseif fFlagAddFocusNavigationToUnifiedPurchaseModule then var22 else nil
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p0.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var18,
				robuxBalanceAmount = p0.robuxBalanceAmount,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p0.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
			}, {
				ProductDetailsContainer = var31 or reactModule.createElement(view, {
					tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center",
					LayoutOrder = 1
				}, {
					ProductDetails = if p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = var30, itemPrice = var29 }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						itemIcon = p0.product.itemIcon,
						itemName = p0.product.itemName,
						itemRobuxCost = var30,
						itemPrice = var29,
						itemDisplayPrice = if fFlagEnableUnifiedPurchaseFlowForDevSubs then p0.product.itemDisplayPrice else nil,
						priceSuffix = var15,
						model = p0.product.model
					})
				}),
				PostPurchaseActions = if next(var28) then reactModule.createElement(view, {
					LayoutOrder = 3,
					tag = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "col gap-medium auto-y size-full-0 align-x-start align-y-start padding-top-small" else "col gap-medium auto-y size-full-0 align-x-start align-y-start"
				}, { var28 }) else nil
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium",
				LayoutOrder = 1
			}, {
				BuyButton = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = var27,
					onActivated = var26,
					inputDelay = if p0.buttons.buyItemEnableInputDelayed and not var20 then 2.5 else 0,
					isDisabled = var20,
					ref = if fFlagAddFocusNavigationToUnifiedPurchaseModule then var23 else var21,
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
					Text = var14.TestPurchaseDisclaimer
				}) else nil,
				SubscribeTerms = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then reactModule.createElement(text, {
					LayoutOrder = 4,
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					Text = string.gsub(string.gsub(var14.SubscribeTermsAgreement or "", "<a.->(.-)</a>", "%1"), "<.->", "")
				}) else nil
			})
		})
	})
end

return function(p4) --[[ line: 341 | named "UnifiedProductPurchaseModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedProductPurchaseModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		ProductPurchaseModal = reactModule.createElement(UnifiedProductPurchaseModal, p4)
	})
end