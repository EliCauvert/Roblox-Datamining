local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local sharedFlagsModule = require(parent_1.SharedFlags)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local checkbox = foundationModule.Checkbox
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local orientation = foundationModule.Enums.Orientation
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
local productDetailsContainerModule = require(parent.Generic.ProductDetailsContainer)
local cartPricingLoadingModule = require(parent.ProductPurchase.v4.CartPricingLoading)
local buildCartPricingOfferCheckboxesModule = require(parent.ProductPurchase.v4.buildCartPricingOfferCheckboxes)
local useCartPricingModule = require(parent.ProductPurchase.v4.useCartPricing)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(parent.ProductPurchase.v4.cartPricingResponseLineItem)
local formatNumberModule = require(parent.Utility.formatNumber)
local getUpsellBadgeInfoModule = require(parent.Utility.getUpsellBadgeInfo)
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXFixMISUpsellDiscountSummary = sharedFlagsModule.FFlagAXFixMISUpsellDiscountSummary
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local compactUpsellModalBreakpoint = game:DefineFastInt("CompactUpsellModalBreakpoint", 400)
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagPurchasePromptFetchCartPricing = sharedFlagsModule.FFlagPurchasePromptFetchCartPricing
local fFlagShouldApplyDevSubsUpsellFixModule = require(parent.Flags.FFlagShouldApplyDevSubsUpsellFix)
local fFlagShouldFixDevSubsFlashingTitleModule = require(parent.Flags.FFlagShouldFixDevSubsFlashingTitle)
local getFFlagIAPExperienceEnableMultiDisplayUpsellModule = require(parent.Flags.GetFFlagIAPExperienceEnableMultiDisplayUpsell)
local getFFlagIAPExperienceUseUpsellBadgeHelperModule = require(parent.Flags.GetFFlagIAPExperienceUseUpsellBadgeHelper)
local _ = require(parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local badgeTypeModule = require(parent.Enums.BadgeType)
local _ = require(parent.Enums.VirtualItemBadgeType)
local _ = require(parent.ProductPurchase.v3.UnifiedProductPurchaseModalTypes)

local function UpsellProductDetailsLegacyImpl(p0, p1) --[[ line: 95 ]]
	-- upvalues: badgeTypeModule (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), yellowBadgeModule (ref)
	local var27 = if p0.badgeType == badgeTypeModule.Popular then p1.Popular elseif p0.badgeType == badgeTypeModule.LastPurchased then p1.LastPurchased else nil
	local var28 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onSelected,
		tag = if p0.selected then var28 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var28 .. " bg-surface-300 stroke-emphasis stroke-standard",
		Size = if p0.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
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
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if var27 then reactModule.createElement(yellowBadgeModule, {
				LayoutOrder = 1,
				Text = var27,
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

local function UpsellProductDetailsMultiDisplayImpl(p2, p3) --[[ line: 168 ]]
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var29 = getUpsellBadgeInfoModule(p2.badgeType, p3)
		text_1 = var29.text
		icon = var29.icon
	else
		text_1 = if p2.badgeType == badgeTypeModule.Popular then p3.Popular elseif p2.badgeType == badgeTypeModule.LastPurchased then p3.LastPurchased elseif p2.badgeType == badgeTypeModule.ForYou then p3.ForYouItem elseif p2.badgeType == badgeTypeModule.BetterValue then p3.BetterValue else nil
		icon = if p2.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p2.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p2.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var30 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p2.layoutOrder,
		onActivated = p2.onSelected,
		tag = if p2.selected then var30 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var30 .. " bg-surface-300 stroke-emphasis stroke-standard",
		Size = if p2.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = reactModule.createElement(text, {
				LayoutOrder = 1,
				RichText = true,
				Text = getIconRichText(enums.IconName.Robux) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p2.product.robuxAmount),
				tag = if p2.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p2.product.robuxAmountBeforeBonus and reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. getIconRichText(enums.IconName.Robux) .. formatNumberModule(localizationService.RobloxLocaleId, p2.product.robuxAmountBeforeBonus) .. "</s>",
				tag = if p2.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
			}),
			Badge = if text_1 then reactModule.createElement(grayBadgeModule, { LayoutOrder = 3, Text = text_1, iconName = icon }) else nil
		}),
		RightSide = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = p2.product.price or "",
				tag = if p2.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetails(p4) --[[ line: 259 ]]
	-- upvalues: useLocalization (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), UpsellProductDetailsMultiDisplayImpl (ref), UpsellProductDetailsLegacyImpl (ref)
	local var31 = useLocalization({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() then UpsellProductDetailsMultiDisplayImpl(p4, var31) else UpsellProductDetailsLegacyImpl(p4, var31)
end

local function UnifiedRobuxUpsellModalV2(_) --[[ line: 308 ]]
	-- upvalues: fFlagPurchasePromptFetchCartPricing (ref), useCartPricingModule (ref), reactModule (ref), useLocalization (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), fFlagAXMISWithBlackbird (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), unifiedPurchaseModalTypeEnumModule (ref), compactUpsellModalBreakpoint (ref), fFlagShouldFixDevSubsFlashingTitleModule (ref), useFocusNavigationRefsModule (ref), buildCartPricingOfferCheckboxesModule (ref), checkbox (ref), view (ref), fFlagShouldApplyDevSubsUpsellFixModule (ref), image (ref), text (ref), fFlagAXFixMISUpsellDiscountSummary (ref), productDetailsContainerModule (ref), dialog (ref), dialogSize (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), cartPricingLoadingModule (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), UpsellProductDetails (ref), orientation (ref), buttonVariant (ref)
-- FATAL: Failed to generate AST for `UnifiedRobuxUpsellModalV2` function:
runtime : [KeyError] :11990: 162
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

return function(p5) --[[ line: 749 | named "UnifiedRobuxUpsellModalV2Container" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModalV2 (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModalV2 = reactModule.createElement(UnifiedRobuxUpsellModalV2, p5)
	})
end