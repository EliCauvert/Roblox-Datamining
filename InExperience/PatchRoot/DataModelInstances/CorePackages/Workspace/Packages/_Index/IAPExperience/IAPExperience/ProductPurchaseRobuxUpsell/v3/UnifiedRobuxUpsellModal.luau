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

local function UnifiedRobuxUpsellModal(p1)
	-- upvalues: fFlagEnableOffersOnInExperienceSurface (ref), useCartPricingModule (ref), reactModule (ref), useLocalization (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), fFlagAXMISWithBlackbird (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), unifiedPurchaseModalTypeEnumModule (ref), compactUpsellModalBreakpoint (ref), useInitialButtonDisableDelayModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (ref), useScaledValue (ref), fFlagShouldFixDevSubsFlashingTitleModule (ref), useFocusNavigationRefsModule (ref), buildCartPricingOfferCheckboxesModule (ref), view (ref), fFlagShouldApplyDevSubsUpsellFixModule (ref), image (ref), text (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), cartPricingLoadingModule (ref), UpsellProductDetails (ref), foundationModule (ref), fillBehavior (ref), buttonVariant (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		var1 = useCartPricingModule({
			product = p1.product,
			purchaseModalType = p1.purchaseModalType,
			cartPricingResponse = p1.cartPricingResponse,
			onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
		})
		var2 = reactModule.useMemo(function()
			-- upvalues: var1 (write), p1 (ref)
			return if var1.showCartOfferUi then var1.mergedProductForDetails else p1.product
		end, {
			p1.product,
			var1.showCartOfferUi,
			var1.mergedProductForDetails
		})
	end
	local var3 = useLocalization({
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
	local var4 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p1.screenSize.Y > 0 and p1.screenSize.Y < compactUpsellModalBreakpoint else p1.screenSize.Y < compactUpsellModalBreakpoint
	local var5 = useInitialButtonDisableDelayModule(false)
	local var6, var7 = reactModule.useState(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
	reactModule.useEffect(function()
		-- upvalues: getFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), fFlagFixUpsellModalUnevenLayoutModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), p1 (ref), unifiedPurchaseModalTypeEnumModule (copy), var7 (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (copy)
		if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() and not fFlagFixUpsellModalUnevenLayoutModule then
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				var7(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
				
				return
			end
			local upsellSuggestionsCount = #p1.upsellSuggestions
			
			if upsellSuggestionsCount == 1 then
				var7(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE)
				
				return
			elseif upsellSuggestionsCount == 2 then
				var7(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
				
				return
			end
			var7(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
			
			return
		elseif #p1.upsellSuggestions > 1 then
			var7(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var7(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
	end, { p1.upsellSuggestions, p1.purchaseModalType })
	local var8 = useScaledValue(var6 or 0)
	local var9, var10 = reactModule.useState(var3.BuyRobuxAndItem)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var3 (ref), fFlagShouldFixDevSubsFlashingTitleModule (copy), var10 (ref), fFlagAXMISWithBlackbird (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p1.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var10(if fFlagShouldFixDevSubsFlashingTitleModule and var3.BuyRobuxAndSubscription and var3.BuyRobuxAndSubscription ~= "" then var3.BuyRobuxAndSubscription else var3.BuyRobuxAndItem)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagAXMISWithBlackbird then
				if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.product.itemName ~= "RobuxUpsell" then
					var10(var3.BuyRobuxAndAvatar)
					
					return
				end
				var10(var3.BuyRobuxOnly)
				
				return
			elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var10(var3.BuyRobuxAndAvatar)
				
				return
			end
			var10(var3.BuyRobuxAndItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var10(var3.BuyRobuxAndExperience)
			
			return
		end
		var10(var3.BuyRobuxAndItem)
	end, {
		p1.purchaseModalType, var3.BuyRobuxAndAvatar, var3.BuyRobuxAndExperience,
		var3.BuyRobuxAndItem, var3.BuyRobuxAndItems, var3.BuyRobuxAndSubscription,
		if fFlagAXMISWithBlackbird then p1.product.itemName else nil,
		if fFlagAXMISWithBlackbird then var3.BuyRobuxOnly else nil
	})
	local var11, var12 = useFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, p1.onBuyItemButtonMounted)
	reactModule.useEffect(function() end, { p1.upsellSuggestions })
	
	local _ = function(p2)
		-- upvalues: p1 (ref)
		p1.onUpsellSuggestionsSelected(p2)
	end
	
	local parts = string.split(var3.DisclosureTermsURL, " {termsofuse} ")
	local termsOfUse = var3.TermsOfUse
	
	if p1.termsOfUseActivated then
		termsOfUse = "<u>" .. termsOfUse .. "</u>"
	end
	local var13 = fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local var14 = if var13 then var3.PerMonth else nil
	local var15 = if var13 then var3.Subscribe else var3.Buy
	local var16 = nil
	
	if fFlagEnableOffersOnInExperienceSurface then
		local var17 = buildCartPricingOfferCheckboxesModule({
			cartPricing = var1,
			isDisabled = if p1.isCartPricingLoading ~= true then var5 else true
		})
		var16 = if next(var17) then reactModule.createElement(view, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, var17) else nil
	end
	local _ = nil
	local var18 = if var13 and fFlagShouldApplyDevSubsUpsellFixModule then reactModule.createElement(view, {
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
				Text = utf8.char(57346) .. " " .. tostring(p1.product.itemRobuxCost or 0) .. (var14 or "")
			})
		})
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = if fFlagEnableOffersOnInExperienceSurface then var2 else p1.product,
		isCompact = var4,
		model = if fFlagEnableOffersOnInExperienceSurface then var2.model else p1.product.model,
		priceSuffix = var14,
		hideDiscountSummary = if fFlagEnableOffersOnInExperienceSurface then p1.isCartPricingLoading else nil,
		savingsSummary = if fFlagEnableOffersOnInExperienceSurface then var1.cartPricingSavingsSummary else nil
	})
	local var19 = getFFlagIAPExperienceEnableMultiDisplayUpsellModule()
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelPurchaseActivated,
		snapPoints = { var8, 0.8 },
		centerSheetHeight = if fFlagFixUpsellModalUnevenLayoutModule then nil elseif var19 then var8 else nil,
		ref = if var5 then nil else var11
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p1.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var9,
				robuxBalanceAmount = p1.userBalance,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = if var19 then "col align-x-center align-y-start gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-start"
			}, {
				ProductDetailsContainer = var18 or reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = if var19 then "col align-x-center align-y-center gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
				}, {
					ProductDetails = if p1.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = p1.product.itemRobuxCost }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						isCompact = var4,
						itemIcon = if fFlagEnableOffersOnInExperienceSurface then var2.itemIcon else p1.product.itemIcon,
						itemName = if fFlagEnableOffersOnInExperienceSurface then var2.itemName else p1.product.itemName,
						itemRobuxCost = if fFlagEnableOffersOnInExperienceSurface then var2.itemRobuxCost else p1.product.itemRobuxCost,
						model = if fFlagEnableOffersOnInExperienceSurface then var2.model else p1.product.model,
						priceSuffix = var14
					})
				}),
				CartPricingLoading = if fFlagEnableOffersOnInExperienceSurface then reactModule.createElement(cartPricingLoadingModule, { LayoutOrder = 1, isLoading = p1.isCartPricingLoading }) else nil,
				PostPurchaseActions = if fFlagEnableOffersOnInExperienceSurface then var16 else nil,
				UpsellSuggestions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if var19 then "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" else "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
				}, if var19 then (function()
					-- upvalues: p1 (ref), reactModule (copy), UpsellProductDetails (copy), var4 (write)
					local t = {}
					
					for i, v in ipairs(p1.upsellSuggestions) do
						t["UpsellPackage" .. tostring(i)] = reactModule.createElement(UpsellProductDetails, {
							layoutOrder = i,
							product = v,
							selected = p1.selectedUpsellIndex == i,
							isCompact = var4,
							onSelected = function()
								-- upvalues: i (ref), p1 (copy)
								p1.onUpsellSuggestionsSelected(i)
							end,
							badgeType = v.badgeType
						})
					end
					return t
				end)() else {
					UpsellPackage1 = reactModule.createElement(UpsellProductDetails, {
						layoutOrder = 1,
						product = p1.upsellSuggestions[1],
						selected = p1.selectedUpsellIndex == 1,
						isCompact = var4,
						onSelected = function()
							-- upvalues: p1 (ref)
							p1.onUpsellSuggestionsSelected(1)
						end
					}),
					UpsellPackage2 = if #p1.upsellSuggestions > 1 then reactModule.createElement(UpsellProductDetails, {
						layoutOrder = 2,
						product = p1.upsellSuggestions[2],
						selected = p1.selectedUpsellIndex == 2,
						isCompact = var4,
						onSelected = function()
							-- upvalues: p1 (ref)
							p1.onUpsellSuggestionsSelected(2)
						end,
						badgeType = p1.upsellSuggestions[2].badgeType
					}) else nil
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = if var19 then "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" else "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
			}, {
				reactModule.createElement(foundationModule.Button, {
					LayoutOrder = 1,
					text = var15,
					onActivated = p1.buttons.buyItemActivated,
					inputDelay = if p1.buttons.buyItemEnableInputDelayed and not var5 then 2.5 else 0,
					isDisabled = var5,
					ref = var12,
					fillBehavior = fillBehavior.Fill,
					variant = buttonVariant.Emphasis,
					size = if var4 then "Small" elseif var19 then "Medium" else nil
				}),
				DisclosureTerms = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if var19 then "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" else "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
				}, {
					DisclosurePayment = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = var3.DisclosurePayment
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
	})
end

return function(p2)
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModal = reactModule.createElement(UnifiedRobuxUpsellModal, p2)
	})
end