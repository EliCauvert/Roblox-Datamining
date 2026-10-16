local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local sharedFlagsModule = require(parent_1.SharedFlags)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local buttonGroup = foundationModule.ButtonGroup
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local orientation = foundationModule.Enums.Orientation
local sheet = foundationModule.Sheet
local useScaledValue = foundationModule.Hooks.useScaledValue
local enums = foundationModule.Enums
local getIconRichText = foundationModule.Utility.getIconRichText
local localizationService = game:GetService("LocalizationService")
local localization = require(parent_1.AppLocales).Localization
local localizationModule = require(parent_1.Localization)
local localizationProvider = localizationModule.LocalizationProvider
local useLocalization = localizationModule.Hooks.useLocalization
local unifiedProductDetailsModule = require(parent.Generic.UnifiedProductDetails)
local yellowBadgeModule = require(parent.Generic.YellowBadge)
local grayBadgeModule = require(parent.Generic.GrayBadge)
local priceSummaryModule = require(parent.Generic.PriceSummary)
local unifiedPurchaseModalHeaderModule = require(parent.Generic.UnifiedPurchaseModalHeader)
local productDetailsContainerModule = require(parent.Generic.ProductDetailsContainer)
local cartPricingLoadingModule = require(parent.ProductPurchase.v4.CartPricingLoading)
local buildCartPricingOfferCheckboxesModule = require(parent.ProductPurchase.v4.buildCartPricingOfferCheckboxes)
local useCartPricingModule = require(parent.ProductPurchase.v4.useCartPricing)
local useInitialButtonDisableDelayModule = require(parent.Generic.Hooks.useInitialButtonDisableDelay)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(parent.ProductPurchase.v4.cartPricingResponseLineItem)
local formatNumberModule = require(parent.Utility.formatNumber)
local getUpsellBadgeInfoModule = require(parent.Utility.getUpsellBadgeInfo)
local constantsModule = require(parent.Generic.Constants)
local UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE = constantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE
local UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT = constantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT
local UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES = constantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagEnableRobuxUpsellPlusButtonExperimentModule = require(parent.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local compactUpsellModalBreakpoint = game:DefineFastInt("CompactUpsellModalBreakpoint", 400)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagShouldApplyDevSubsUpsellFixModule = require(parent.Flags.FFlagShouldApplyDevSubsUpsellFix)
local fFlagShouldFixDevSubsFlashingTitleModule = require(parent.Flags.FFlagShouldFixDevSubsFlashingTitle)
local getFFlagIAPExperienceEnableMultiDisplayUpsellModule = require(parent.Flags.GetFFlagIAPExperienceEnableMultiDisplayUpsell)
local getFFlagIAPExperienceUseUpsellBadgeHelperModule = require(parent.Flags.GetFFlagIAPExperienceUseUpsellBadgeHelper)
local fFlagFixUpsellModalUnevenLayoutModule = require(parent.Flags.FFlagFixUpsellModalUnevenLayout)
local fFlagEnableOffersOnInExperienceSurface = require(parent.Parent.SharedFlags).FFlagEnableOffersOnInExperienceSurface
local _ = require(parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local badgeTypeModule = require(parent.Enums.BadgeType)
local _ = require(parent.Enums.VirtualItemBadgeType)
local _ = require(parent.ProductPurchase.PricingTypes)

local function UpsellProductDetailsLegacyImpl(p1, p2)
	-- upvalues: badgeTypeModule (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), yellowBadgeModule (ref)
	local var1 = if p1.badgeType == badgeTypeModule.Popular then p2.Popular elseif p1.badgeType == badgeTypeModule.LastPurchased then p2.LastPurchased else nil
	local var2 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then var2 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var2 .. " bg-surface-300 stroke-emphasis stroke-standard",
		Size = if p1.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-y-center gap-small"] = true,
				["align-x-start"] = true
			},
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. utf8.char(57346) .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
			})
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if var1 then reactModule.createElement(yellowBadgeModule, {
				LayoutOrder = 1,
				Text = var1,
				Icon = if p1.badgeType == badgeTypeModule.Popular then "icons/menu/fire_fill" else nil
			}) else nil,
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = p1.product.price or "",
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayFixedImpl(p1, p2)
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var1 = getUpsellBadgeInfoModule(p1.badgeType, p2)
		text_1 = var1.text
		icon = var1.icon
	else
		text_1 = if p1.badgeType == badgeTypeModule.Popular then p2.Popular elseif p1.badgeType == badgeTypeModule.LastPurchased then p2.LastPurchased elseif p1.badgeType == badgeTypeModule.ForYou then p2.ForYouItem elseif p1.badgeType == badgeTypeModule.BetterValue then p2.BetterValue else nil
		icon = if p1.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p1.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p1.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var2 = if p1.isCompact then "size-full-1000 radius-medium padding-small row" else "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then var2 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var2 .. " bg-surface-300 stroke-default stroke-standard"
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center gap-small",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				Text = getIconRichText(enums.IconName.Robux) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-medium content-muted text-align-x-left"
			}),
			Badge = if text_1 then reactModule.createElement(grayBadgeModule, { LayoutOrder = 3, Text = text_1, iconName = icon }) else nil
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p1.product.price or "",
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayImpl(p1, p2)
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var1 = getUpsellBadgeInfoModule(p1.badgeType, p2)
		text_1 = var1.text
		icon = var1.icon
	else
		text_1 = if p1.badgeType == badgeTypeModule.Popular then p2.Popular elseif p1.badgeType == badgeTypeModule.LastPurchased then p2.LastPurchased elseif p1.badgeType == badgeTypeModule.ForYou then p2.ForYouItem elseif p1.badgeType == badgeTypeModule.BetterValue then p2.BetterValue else nil
		icon = if p1.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p1.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p1.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var2 = if p1.isCompact then "size-full-0 auto-y radius-medium padding-small row" else "col align-x-left gap-medium size-full-0 auto-y padding-medium radius-medium"
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then var2 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var2 .. " bg-surface-300 stroke-default stroke-standard",
		Size = if p1.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-x-left align-y-center gap-small"] = true,
				["size-full-0 auto-y"] = not p1.isCompact
			},
			Size = if p1.isCompact then UDim2.new(0.65, 0, 1, 0) else nil
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				Text = getIconRichText(enums.IconName.Robux) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. formatNumberModule(localizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-medium content-muted text-align-x-left"
			}),
			Badge = if text_1 then reactModule.createElement(grayBadgeModule, { LayoutOrder = 3, Text = text_1, iconName = icon }) else nil
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row align-x-right align-y-center gap-large"] = true,
				["size-full-0 auto-y"] = not p1.isCompact
			},
			Size = if p1.isCompact then UDim2.new(0.35, 0, 1, 0) else nil
		}, {
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p1.product.price or "",
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetails(p1)
	-- upvalues: useLocalization (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UpsellProductDetailsMultiDisplayFixedImpl (ref), UpsellProductDetailsMultiDisplayImpl (ref), UpsellProductDetailsLegacyImpl (ref)
	local var1 = useLocalization({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() then if fFlagFixUpsellModalUnevenLayoutModule then UpsellProductDetailsMultiDisplayFixedImpl(p1, var1) else UpsellProductDetailsMultiDisplayImpl(p1, var1) else UpsellProductDetailsLegacyImpl(p1, var1)
end

local function _(p1)
	local robloxPlusDiscountPercentage = p1.robloxPlusDiscountPercentage
	
	if type(robloxPlusDiscountPercentage) == "number" then
		return robloxPlusDiscountPercentage, p1.onRobloxPlusButtonActivated
	end
	return nil, nil
end

local function UnifiedRobuxUpsellModal(p1)
	-- upvalues: fFlagEnableRobuxUpsellPlusButtonExperimentModule (ref), fFlagEnableOffersOnInExperienceSurface (ref), useCartPricingModule (ref), reactModule (ref), useLocalization (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), fFlagAXMISWithBlackbird (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), unifiedPurchaseModalTypeEnumModule (ref), compactUpsellModalBreakpoint (ref), useInitialButtonDisableDelayModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (ref), useScaledValue (ref), fFlagShouldFixDevSubsFlashingTitleModule (ref), useFocusNavigationRefsModule (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), fFlagShouldApplyDevSubsUpsellFixModule (ref), image (ref), text (ref), productDetailsContainerModule (ref), fillBehavior (ref), buttonVariant (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), cartPricingLoadingModule (ref), UpsellProductDetails (ref), buttonGroup (ref), orientation (ref), enums (ref), foundationModule (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagEnableRobuxUpsellPlusButtonExperimentModule then
		local var3, onRobloxPlusButtonActivated
		local robloxPlusDiscountPercentage = p1.robloxPlusDiscountPercentage
		
		if type(robloxPlusDiscountPercentage) == "number" then
			var3 = robloxPlusDiscountPercentage
			onRobloxPlusButtonActivated = p1.onRobloxPlusButtonActivated
		else
			var3 = nil
			onRobloxPlusButtonActivated = nil
		end
		var1 = var3
		var2 = onRobloxPlusButtonActivated
	end
	local var4 = nil
	local var5 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var4 = useCartPricingModule({
			product = p1.product,
			purchaseModalType = p1.purchaseModalType,
			cartPricingResponse = p1.cartPricingResponse,
			onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
		})
		var5 = reactModule.useMemo(function()
			-- upvalues: var4 (write), p1 (ref)
			return if var4.showCartOfferUi then var4.mergedProductForDetails else p1.product
		end, {
			p1.product,
			var4.showCartOfferUi,
			var4.mergedProductForDetails
		})
	end
	local var6 = useLocalization({
		Buy = "IAPExperience.PurchasePrompt.Action.Buy",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL",
		TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse",
		BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience",
		BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem",
		BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems",
		GetTenPercentOff = if var1 ~= nil then nil else {
			"IAPExperience.RobuxUpsell.Action.GetPercentOff",
			discountPercentage = var1
		},
		Subscribe = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Action.Subscribe" else nil,
		BuyRobuxOnly = if fFlagAXMISWithBlackbird then "IAPExperience.PurchasePrompt.Title.BuyRobuxOnly" else nil,
		BuyRobuxAndAvatar = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" else nil,
		BuyRobuxAndSubscription = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "IAPExperience.PurchasePrompt.BuyRobuxAndSubscription" else nil,
		PerMonth = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Text.PerMonth" else nil
	})
	local _ = nil
	local var7 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p1.screenSize.Y > 0 and p1.screenSize.Y < compactUpsellModalBreakpoint else p1.screenSize.Y < compactUpsellModalBreakpoint
	local var8 = useInitialButtonDisableDelayModule(false)
	local var9, var10 = reactModule.useState(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
	reactModule.useEffect(function()
		-- upvalues: getFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), fFlagFixUpsellModalUnevenLayoutModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), p1 (ref), unifiedPurchaseModalTypeEnumModule (copy), var10 (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (copy)
		if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() and not fFlagFixUpsellModalUnevenLayoutModule then
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				var10(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
				
				return
			end
			local upsellSuggestionsCount = #p1.upsellSuggestions
			
			if upsellSuggestionsCount == 1 then
				var10(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE)
				
				return
			elseif upsellSuggestionsCount == 2 then
				var10(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
				
				return
			end
			var10(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
			
			return
		elseif #p1.upsellSuggestions > 1 then
			var10(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var10(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
	end, { p1.upsellSuggestions, p1.purchaseModalType })
	local var11 = useScaledValue(var9 or 0)
	local var12, var13 = reactModule.useState(var6.BuyRobuxAndItem)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var6 (ref), fFlagShouldFixDevSubsFlashingTitleModule (copy), var13 (ref), fFlagAXMISWithBlackbird (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p1.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var13(if fFlagShouldFixDevSubsFlashingTitleModule and var6.BuyRobuxAndSubscription and var6.BuyRobuxAndSubscription ~= "" then var6.BuyRobuxAndSubscription else var6.BuyRobuxAndItem)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagAXMISWithBlackbird then
				if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.product.itemName ~= "RobuxUpsell" then
					var13(var6.BuyRobuxAndAvatar)
					
					return
				end
				var13(var6.BuyRobuxOnly)
				
				return
			elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var13(var6.BuyRobuxAndAvatar)
				
				return
			end
			var13(var6.BuyRobuxAndItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var13(var6.BuyRobuxAndExperience)
			
			return
		end
		var13(var6.BuyRobuxAndItem)
	end, {
		p1.purchaseModalType, var6.BuyRobuxAndAvatar, var6.BuyRobuxAndExperience,
		var6.BuyRobuxAndItem, var6.BuyRobuxAndItems, var6.BuyRobuxAndSubscription,
		if fFlagAXMISWithBlackbird then p1.product.itemName else nil,
		if fFlagAXMISWithBlackbird then var6.BuyRobuxOnly else nil
	})
	local var14, var15 = useFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, p1.onBuyItemButtonMounted)
	reactModule.useEffect(function() end, { p1.upsellSuggestions })
	
	local _ = function(p2)
		-- upvalues: p1 (ref)
		p1.onUpsellSuggestionsSelected(p2)
	end
	
	local parts = string.split(var6.DisclosureTermsURL, " {termsofuse} ")
	local termsOfUse = var6.TermsOfUse
	
	if p1.termsOfUseActivated then
		termsOfUse = "<u>" .. termsOfUse .. "</u>"
	end
	local var16 = fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local var17 = if var16 then var6.PerMonth else nil
	local var18 = if var16 then var6.Subscribe else var6.Buy
	local var19 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		local var20 = buildCartPricingOfferCheckboxesModule({
			cartPricing = var4,
			isDisabled = if p1.isCartPricingLoading ~= true then var8 else true
		})
		var19 = if next(var20) then reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, var20) else nil
	end
	local t_8
	local _ = nil
	local var21 = if var16 and fFlagShouldApplyDevSubsUpsellFixModule then reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-medium size-full-0 auto-y"
	}, {
		ItemIcon = reactModule.createElement(image, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(72, 72),
			ScaleType = Enum.ScaleType.Fit,
			Image = p1.product.itemIcon
		}),
		ItemInfo = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col gap-xxsmall auto-y",
			Size = UDim2.new(1, -84, 0, 0)
		}, {
			ItemName = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Size = UDim2.new(1, 0, 0, 0),
				Text = p1.product.itemName or ""
			}),
			ItemPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-y text-title-medium text-align-x-left content-emphasis",
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = utf8.char(57346) .. " " .. tostring(p1.product.itemRobuxCost or 0) .. (var17 or "")
			})
		})
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = if fFlagEnableOffersOnInExperienceSurface then var5 else p1.product,
		isCompact = var7,
		model = if fFlagEnableOffersOnInExperienceSurface then var5.model else p1.product.model,
		priceSuffix = var17,
		hideDiscountSummary = if fFlagEnableOffersOnInExperienceSurface then p1.isCartPricingLoading else nil,
		savingsSummary = if fFlagEnableOffersOnInExperienceSurface then var4.cartPricingSavingsSummary else nil
	})
	local var22 = getFFlagIAPExperienceEnableMultiDisplayUpsellModule()
	local var23 = if var22 then "col align-x-center align-y-start gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-start"
	local var24 = if var22 then "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" else "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
	local var25 = if var2 then "col gap-small size-full-0 auto-y" elseif var22 then "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" else "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
	local var26 = if var22 then "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" else "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
	local var27 = if var7 then "Small" elseif var22 then "Medium" else nil
	local t = {
		LayoutOrder = 1,
		text = var18,
		onActivated = p1.buttons.buyItemActivated,
		inputDelay = if p1.buttons.buyItemEnableInputDelayed and not var8 then 2.5 else 0,
		isDisabled = var8,
		ref = var15,
		fillBehavior = fillBehavior.Fill,
		variant = buttonVariant.Emphasis,
		size = var27
	}
	local var28 = if var22 then "col align-x-center align-y-center gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t_1 = {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelPurchaseActivated,
		snapPoints = { var11, 0.8 },
		centerSheetHeight = if fFlagFixUpsellModalUnevenLayoutModule then nil elseif var22 then var11 else nil,
		ref = if var8 then nil else var14
	}
	local t_2 = {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p1.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var12,
				robuxBalanceAmount = p1.userBalance,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local content = sheet.Content
	local t_3 = { LayoutOrder = 2 }
	local t_4 = {}
	local createElement_2 = reactModule.createElement
	local t_5 = { tag = var23 }
	local t_6 = {
		ProductDetailsContainer = var21 or reactModule.createElement(view, { LayoutOrder = 1, tag = var28 }, {
			ProductDetails = if p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = p1.product.itemRobuxCost }) else reactModule.createElement(unifiedProductDetailsModule, {
				isPortrait = false,
				isCompact = var7,
				itemIcon = if fFlagEnableOffersOnInExperienceSurface then var5.itemIcon else p1.product.itemIcon,
				itemName = if fFlagEnableOffersOnInExperienceSurface then var5.itemName else p1.product.itemName,
				itemRobuxCost = if fFlagEnableOffersOnInExperienceSurface then var5.itemRobuxCost else p1.product.itemRobuxCost,
				model = if fFlagEnableOffersOnInExperienceSurface then var5.model else p1.product.model,
				priceSuffix = var17
			})
		}),
		CartPricingLoading = if fFlagEnableOffersOnInExperienceSurface then reactModule.createElement(cartPricingLoadingModule, { LayoutOrder = 1, isLoading = p1.isCartPricingLoading }) else nil,
		PostPurchaseActions = if fFlagEnableOffersOnInExperienceSurface then var19 else nil
	}
	local createElement_3 = reactModule.createElement
	local t_7 = { LayoutOrder = 2, tag = var24 }
	
	if var22 then
		local t_9 = {}
		
		for i, v in ipairs(p1.upsellSuggestions) do
			t_9["UpsellPackage" .. tostring(i)] = reactModule.createElement(UpsellProductDetails, {
				layoutOrder = i,
				product = v,
				selected = p1.selectedUpsellIndex == i,
				isCompact = var7,
				onSelected = function()
					-- upvalues: i (ref), p1 (ref)
					p1.onUpsellSuggestionsSelected(i)
				end,
				badgeType = v.badgeType
			})
		end
		t_8 = t_9
	else
		t_8 = {
			UpsellPackage1 = reactModule.createElement(UpsellProductDetails, {
				layoutOrder = 1,
				product = p1.upsellSuggestions[1],
				selected = p1.selectedUpsellIndex == 1,
				isCompact = var7,
				onSelected = function()
					-- upvalues: p1 (ref)
					p1.onUpsellSuggestionsSelected(1)
				end
			}),
			UpsellPackage2 = if #p1.upsellSuggestions > 1 then reactModule.createElement(UpsellProductDetails, {
				layoutOrder = 2,
				product = p1.upsellSuggestions[2],
				selected = p1.selectedUpsellIndex == 2,
				isCompact = var7,
				onSelected = function()
					-- upvalues: p1 (ref)
					p1.onUpsellSuggestionsSelected(2)
				end,
				badgeType = p1.upsellSuggestions[2].badgeType
			}) else nil
		}
	end
	t_6.UpsellSuggestions = createElement_3(view, t_7, t_8)
	t_4.SheetContentContainer = createElement_2(view, t_5, t_6)
	t_2.Content = createElement_1(content, t_3, t_4)
	t_2.Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
		reactModule.createElement(view, { LayoutOrder = 1, tag = var25 }, {
			BuyAndPlusRow = if var2 then reactModule.createElement(buttonGroup, {
				LayoutOrder = 1,
				orientation = orientation.Vertical,
				size = var27,
				buttons = {
					{
						text = t.text,
						onActivated = t.onActivated,
						inputDelay = t.inputDelay,
						isDisabled = t.isDisabled,
						ref = t.ref,
						variant = t.variant
					},
					{
						text = var6.GetTenPercentOff,
						onActivated = var2,
						isDisabled = var8,
						variant = buttonVariant.Standard,
						icon = enums.IconName.RobloxPlus
					}
				}
			}) else reactModule.createElement(foundationModule.Button, t),
			DisclosureTerms = reactModule.createElement(view, { LayoutOrder = 2, tag = var26 }, {
				DisclosurePayment = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
					Text = var6.DisclosurePayment
				}),
				BeforeText = reactModule.createElement(text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
					Text = parts[1]
				}),
				TextLink = reactModule.createElement(text, {
					LayoutOrder = 3,
					RichText = true,
					tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
					Text = termsOfUse,
					onActivated = p1.termsOfUseActivated
				}),
				AfterText = reactModule.createElement(text, {
					LayoutOrder = 4,
					tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
					Text = parts[2]
				})
			})
		})
	})
	
	return createElement(root, t_1, t_2)
end

return function(p2)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModal = reactModule.createElement(UnifiedRobuxUpsellModal, p2)
	})
end