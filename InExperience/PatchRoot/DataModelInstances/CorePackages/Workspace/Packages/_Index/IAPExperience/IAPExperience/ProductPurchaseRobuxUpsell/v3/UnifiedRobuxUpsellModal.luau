local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local sharedFlagsModule = require(parent_1.SharedFlags)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
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

local function UpsellProductDetailsLegacyImpl(p0, p1) --[[ line: 107 ]]
	-- upvalues: badgeTypeModule (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), yellowBadgeModule (ref)
	local var32 = if p0.badgeType == badgeTypeModule.Popular then p1.Popular elseif p0.badgeType == badgeTypeModule.LastPurchased then p1.LastPurchased else nil
	local var33 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onSelected,
		tag = if p0.selected then var33 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var33 .. " bg-surface-300 stroke-emphasis stroke-standard",
		Size = if p0.isCompact then UDim2.new(1, 0, 0, 40) else nil
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
				Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.product.robuxAmount),
				tag = if p0.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p0.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. utf8.char(57346) .. formatNumberModule(localizationService.RobloxLocaleId, p0.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p0.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
			})
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if var32 then reactModule.createElement(yellowBadgeModule, {
				LayoutOrder = 1,
				Text = var32,
				Icon = if p0.badgeType == badgeTypeModule.Popular then "icons/menu/fire_fill" else nil
			}) else nil,
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = p0.product.price or "",
				tag = if p0.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayFixedImpl(p2, p3) --[[ line: 186 ]]
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var34 = getUpsellBadgeInfoModule(p2.badgeType, p3)
		text_1 = var34.text
		icon = var34.icon
	else
		text_1 = if p2.badgeType == badgeTypeModule.Popular then p3.Popular elseif p2.badgeType == badgeTypeModule.LastPurchased then p3.LastPurchased elseif p2.badgeType == badgeTypeModule.ForYou then p3.ForYouItem elseif p2.badgeType == badgeTypeModule.BetterValue then p3.BetterValue else nil
		icon = if p2.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p2.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p2.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var35 = if p2.isCompact then "size-full-1000 radius-medium padding-small row" else "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p2.layoutOrder,
		onActivated = p2.onSelected,
		tag = if p2.selected then var35 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var35 .. " bg-surface-300 stroke-default stroke-standard"
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center gap-small",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				Text = getIconRichText(enums.IconName.Robux) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p2.product.robuxAmount),
				tag = if p2.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p2.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. formatNumberModule(localizationService.RobloxLocaleId, p2.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p2.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-medium content-muted text-align-x-left"
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
				Text = p2.product.price or "",
				tag = if p2.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayImpl(p4, p5) --[[ line: 278 ]]
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var36 = getUpsellBadgeInfoModule(p4.badgeType, p5)
		text_1 = var36.text
		icon = var36.icon
	else
		text_1 = if p4.badgeType == badgeTypeModule.Popular then p5.Popular elseif p4.badgeType == badgeTypeModule.LastPurchased then p5.LastPurchased elseif p4.badgeType == badgeTypeModule.ForYou then p5.ForYouItem elseif p4.badgeType == badgeTypeModule.BetterValue then p5.BetterValue else nil
		icon = if p4.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p4.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p4.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var37 = if p4.isCompact then "size-full-0 auto-y radius-medium padding-small row" else "col align-x-left gap-medium size-full-0 auto-y padding-medium radius-medium"
	
	return reactModule.createElement(view, {
		LayoutOrder = p4.layoutOrder,
		onActivated = p4.onSelected,
		tag = if p4.selected then var37 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var37 .. " bg-surface-300 stroke-default stroke-standard",
		Size = if p4.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["row align-x-left align-y-center gap-small"] = true,
				["size-full-0 auto-y"] = not p4.isCompact
			},
			Size = if p4.isCompact then UDim2.new(0.65, 0, 1, 0) else nil
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				Text = getIconRichText(enums.IconName.Robux) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p4.product.robuxAmount),
				tag = if p4.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p4.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. formatNumberModule(localizationService.RobloxLocaleId, p4.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p4.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-medium content-muted text-align-x-left"
			}),
			Badge = if text_1 then reactModule.createElement(grayBadgeModule, { LayoutOrder = 3, Text = text_1, iconName = icon }) else nil
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["row align-x-right align-y-center gap-large"] = true,
				["size-full-0 auto-y"] = not p4.isCompact
			},
			Size = if p4.isCompact then UDim2.new(0.35, 0, 1, 0) else nil
		}, {
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = p4.product.price or "",
				tag = if p4.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetails(p6) --[[ line: 377 ]]
	-- upvalues: useLocalization (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UpsellProductDetailsMultiDisplayFixedImpl (ref), UpsellProductDetailsMultiDisplayImpl (ref), UpsellProductDetailsLegacyImpl (ref)
	local var38 = useLocalization({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() then if fFlagFixUpsellModalUnevenLayoutModule then UpsellProductDetailsMultiDisplayFixedImpl(p6, var38) else UpsellProductDetailsMultiDisplayImpl(p6, var38) else UpsellProductDetailsLegacyImpl(p6, var38)
end

local function UnifiedRobuxUpsellModal(p7) --[[ line: 424 ]]
	-- upvalues: fFlagEnableOffersOnInExperienceSurface (ref), useCartPricingModule (ref), reactModule (ref), useLocalization (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), fFlagAXMISWithBlackbird (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), unifiedPurchaseModalTypeEnumModule (ref), compactUpsellModalBreakpoint (ref), useInitialButtonDisableDelayModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (ref), useScaledValue (ref), fFlagShouldFixDevSubsFlashingTitleModule (ref), useFocusNavigationRefsModule (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), fFlagShouldApplyDevSubsUpsellFixModule (ref), image (ref), text (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), cartPricingLoadingModule (ref), UpsellProductDetails (ref), foundationModule (ref), fillBehavior (ref), buttonVariant (ref)
	local var39 = nil
	local var40 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var39 = useCartPricingModule({
			product = p7.product,
			purchaseModalType = p7.purchaseModalType,
			cartPricingResponse = p7.cartPricingResponse,
			onCartOfferAppliedChanged = p7.onCartOfferAppliedChanged
		})
		var40 = reactModule.useMemo(function() --[[ line: 435 ]]
			-- upvalues: var39 (write), p7 (ref)
			return if var39.showCartOfferUi then var39.mergedProductForDetails else p7.product
		end, {
			p7.product,
			var39.showCartOfferUi,
			var39.mergedProductForDetails
		})
	end
	local var41 = useLocalization({
		Buy = "IAPExperience.PurchasePrompt.Action.Buy",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL",
		TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse",
		BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience",
		BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem",
		BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems",
		Subscribe = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Action.Subscribe" else nil,
		BuyRobuxOnly = if fFlagAXMISWithBlackbird then "IAPExperience.PurchasePrompt.Title.BuyRobuxOnly" else nil,
		BuyRobuxAndAvatar = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" else nil,
		BuyRobuxAndSubscription = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "IAPExperience.PurchasePrompt.BuyRobuxAndSubscription" else nil,
		PerMonth = if fFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Text.PerMonth" else nil
	})
	local _ = nil
	local var42 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p7.screenSize.Y > 0 and p7.screenSize.Y < compactUpsellModalBreakpoint else p7.screenSize.Y < compactUpsellModalBreakpoint
	local var43 = useInitialButtonDisableDelayModule(false)
	local var44, var45 = reactModule.useState(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
	reactModule.useEffect(function() --[[ line: 481 ]]
		-- upvalues: getFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), fFlagFixUpsellModalUnevenLayoutModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), p7 (ref), unifiedPurchaseModalTypeEnumModule (copy), var45 (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (copy)
		if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() and not fFlagFixUpsellModalUnevenLayoutModule then
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				var45(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
				
				return
			end
			local upsellSuggestionsCount = #p7.upsellSuggestions
			
			if upsellSuggestionsCount == 1 then
				var45(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE)
				
				return
			elseif upsellSuggestionsCount == 2 then
				var45(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
				
				return
			end
			var45(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
			
			return
		elseif #p7.upsellSuggestions > 1 then
			var45(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var45(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
	end, { p7.upsellSuggestions, p7.purchaseModalType })
	local var46 = useScaledValue(var44 or 0)
	local var47, var48 = reactModule.useState(var41.BuyRobuxAndItem)
	reactModule.useEffect(function() --[[ line: 514 ]]
		-- upvalues: p7 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var41 (ref), fFlagShouldFixDevSubsFlashingTitleModule (copy), var48 (ref), fFlagAXMISWithBlackbird (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p7.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var48(if fFlagShouldFixDevSubsFlashingTitleModule and var41.BuyRobuxAndSubscription and var41.BuyRobuxAndSubscription ~= "" then var41.BuyRobuxAndSubscription else var41.BuyRobuxAndItem)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagAXMISWithBlackbird then
				if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p7.product.itemName ~= "RobuxUpsell" then
					var48(var41.BuyRobuxAndAvatar)
					
					return
				end
				var48(var41.BuyRobuxOnly)
				
				return
			elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var48(var41.BuyRobuxAndAvatar)
				
				return
			end
			var48(var41.BuyRobuxAndItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var48(var41.BuyRobuxAndExperience)
			
			return
		end
		var48(var41.BuyRobuxAndItem)
	end, {
		p7.purchaseModalType, var41.BuyRobuxAndAvatar, var41.BuyRobuxAndExperience,
		var41.BuyRobuxAndItem, var41.BuyRobuxAndItems, var41.BuyRobuxAndSubscription,
		if fFlagAXMISWithBlackbird then p7.product.itemName else nil,
		if fFlagAXMISWithBlackbird then var41.BuyRobuxOnly else nil
	})
	local var49, var50 = useFocusNavigationRefsModule(p7.buttons.cancelPurchaseActivated, p7.onBuyItemButtonMounted)
	reactModule.useEffect(function() --[[ line: 567 ]] end, { p7.upsellSuggestions })
	
	local _ = function(p8) --[[ line: 570 ]]
		-- upvalues: p7 (ref)
		p7.onUpsellSuggestionsSelected(p8)
	end
	
	local parts = string.split(var41.DisclosureTermsURL, " {termsofuse} ")
	local termsOfUse = var41.TermsOfUse
	
	if p7.termsOfUseActivated then
		termsOfUse = "<u>" .. termsOfUse .. "</u>"
	end
	local var52 = fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local var53 = if var52 then var41.PerMonth else nil
	local var54 = if var52 then var41.Subscribe else var41.Buy
	local var55 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		local var56 = buildCartPricingOfferCheckboxesModule({
			cartPricing = var39,
			isDisabled = if p7.isCartPricingLoading ~= true then var43 else true
		})
		var55 = if next(var56) then reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, var56) else nil
	end
	local _ = nil
	local var57 = if var52 and fFlagShouldApplyDevSubsUpsellFixModule then reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-medium size-full-0 auto-y"
	}, {
		ItemIcon = reactModule.createElement(image, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(72, 72),
			ScaleType = Enum.ScaleType.Fit,
			Image = p7.product.itemIcon
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
				Text = p7.product.itemName or ""
			}),
			ItemPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-y text-title-medium text-align-x-left content-emphasis",
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = utf8.char(57346) .. " " .. tostring(p7.product.itemRobuxCost or 0) .. (var53 or "")
			})
		})
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p7.purchaseModalType,
		product = if fFlagEnableOffersOnInExperienceSurface then var40 else p7.product,
		isCompact = var42,
		model = if fFlagEnableOffersOnInExperienceSurface then var40.model else p7.product.model,
		priceSuffix = var53,
		hideDiscountSummary = if fFlagEnableOffersOnInExperienceSurface then p7.isCartPricingLoading else nil,
		savingsSummary = if fFlagEnableOffersOnInExperienceSurface then var39.cartPricingSavingsSummary else nil
	})
	local var58 = getFFlagIAPExperienceEnableMultiDisplayUpsellModule()
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p7.buttons.cancelPurchaseActivated,
		snapPoints = { var46, 0.8 },
		centerSheetHeight = if fFlagFixUpsellModalUnevenLayoutModule then nil elseif var58 then var46 else nil,
		ref = if var43 then nil else var49
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p7.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var47,
				robuxBalanceAmount = p7.userBalance,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p7.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = if var58 then "col align-x-center align-y-start gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-start"
			}, {
				ProductDetailsContainer = var57 or reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = if var58 then "col align-x-center align-y-center gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
				}, {
					ProductDetails = if p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = p7.product.itemRobuxCost }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						isCompact = var42,
						itemIcon = if fFlagEnableOffersOnInExperienceSurface then var40.itemIcon else p7.product.itemIcon,
						itemName = if fFlagEnableOffersOnInExperienceSurface then var40.itemName else p7.product.itemName,
						itemRobuxCost = if fFlagEnableOffersOnInExperienceSurface then var40.itemRobuxCost else p7.product.itemRobuxCost,
						model = if fFlagEnableOffersOnInExperienceSurface then var40.model else p7.product.model,
						priceSuffix = var53
					})
				}),
				CartPricingLoading = if fFlagEnableOffersOnInExperienceSurface then reactModule.createElement(cartPricingLoadingModule, { LayoutOrder = 1, isLoading = p7.isCartPricingLoading }) else nil,
				PostPurchaseActions = if fFlagEnableOffersOnInExperienceSurface then var55 else nil,
				UpsellSuggestions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if var58 then "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" else "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
				}, if var58 then (function() --[[ line: 748 ]]
					-- upvalues: p7 (ref), reactModule (copy), UpsellProductDetails (copy), var42 (write)
					local t = {}
					
					for i, v in ipairs(p7.upsellSuggestions) do
						t["UpsellPackage" .. tostring(i)] = reactModule.createElement(UpsellProductDetails, {
							layoutOrder = i,
							product = v,
							selected = p7.selectedUpsellIndex == i,
							isCompact = var42,
							onSelected = function() --[[ line: 757 ]]
								-- upvalues: i (ref), p7 (copy)
								p7.onUpsellSuggestionsSelected(i)
							end,
							badgeType = v.badgeType
						})
					end
					return t
				end)() else {
					UpsellPackage1 = reactModule.createElement(UpsellProductDetails, {
						layoutOrder = 1,
						product = p7.upsellSuggestions[1],
						selected = p7.selectedUpsellIndex == 1,
						isCompact = var42,
						onSelected = function() --[[ line: 771 ]]
							-- upvalues: p7 (ref)
							p7.onUpsellSuggestionsSelected(1)
						end
					}),
					UpsellPackage2 = if #p7.upsellSuggestions > 1 then reactModule.createElement(UpsellProductDetails, {
						layoutOrder = 2,
						product = p7.upsellSuggestions[2],
						selected = p7.selectedUpsellIndex == 2,
						isCompact = var42,
						onSelected = function() --[[ line: 781 ]]
							-- upvalues: p7 (ref)
							p7.onUpsellSuggestionsSelected(2)
						end,
						badgeType = p7.upsellSuggestions[2].badgeType
					}) else nil
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = if var58 then "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" else "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
			}, {
				reactModule.createElement(foundationModule.Button, {
					LayoutOrder = 1,
					text = var54,
					onActivated = p7.buttons.buyItemActivated,
					inputDelay = if p7.buttons.buyItemEnableInputDelayed and not var43 then 2.5 else 0,
					isDisabled = var43,
					ref = var50,
					fillBehavior = fillBehavior.Fill,
					variant = buttonVariant.Emphasis,
					size = if var42 then "Small" elseif var58 then "Medium" else nil
				}),
				DisclosureTerms = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if var58 then "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" else "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
				}, {
					DisclosurePayment = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = var41.DisclosurePayment
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
						onActivated = p7.termsOfUseActivated
					}),
					AfterText = reactModule.createElement(text, {
						LayoutOrder = 4,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = parts[2]
					})
				})
			})
		})
	})
end

return function(p9) --[[ line: 842 | named "UnifiedRobuxUpsellModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModal = reactModule.createElement(UnifiedRobuxUpsellModal, p9)
	})
end