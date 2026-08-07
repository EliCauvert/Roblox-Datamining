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
local useInitialButtonDisableDelayModule = require(parent.Generic.Hooks.useInitialButtonDisableDelay)
local useFocusNavigationRefsModule = require(parent.Generic.Hooks.useFocusNavigationRefs)
local unifiedPurchaseModalTypeEnumModule = require(parent.Enums.UnifiedPurchaseModalTypeEnum)
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
local _ = require(parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local badgeTypeModule = require(parent.Enums.BadgeType)
local _ = require(parent.Enums.VirtualItemBadgeType)
local _ = require(parent.ProductPurchase.PricingTypes)

local function UpsellProductDetailsLegacyImpl(p0, p1) --[[ line: 100 ]]
	-- upvalues: badgeTypeModule (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), yellowBadgeModule (ref)
	local var29 = if p0.badgeType == badgeTypeModule.Popular then p1.Popular elseif p0.badgeType == badgeTypeModule.LastPurchased then p1.LastPurchased else nil
	local var30 = "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onSelected,
		tag = if p0.selected then var30 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var30 .. " bg-surface-300 stroke-emphasis stroke-standard",
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
			Badge = if var29 then reactModule.createElement(yellowBadgeModule, {
				LayoutOrder = 1,
				Text = var29,
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

local function UpsellProductDetailsMultiDisplayFixedImpl(p2, p3) --[[ line: 179 ]]
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var31 = getUpsellBadgeInfoModule(p2.badgeType, p3)
		text_1 = var31.text
		icon = var31.icon
	else
		text_1 = if p2.badgeType == badgeTypeModule.Popular then p3.Popular elseif p2.badgeType == badgeTypeModule.LastPurchased then p3.LastPurchased elseif p2.badgeType == badgeTypeModule.ForYou then p3.ForYouItem elseif p2.badgeType == badgeTypeModule.BetterValue then p3.BetterValue else nil
		icon = if p2.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p2.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p2.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var32 = if p2.isCompact then "size-full-1000 radius-medium padding-small row" else "size-full-1400 radius-medium padding-x-large row"
	
	return reactModule.createElement(view, {
		LayoutOrder = p2.layoutOrder,
		onActivated = p2.onSelected,
		tag = if p2.selected then var32 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var32 .. " bg-surface-300 stroke-default stroke-standard"
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

local function UpsellProductDetailsMultiDisplayImpl(p4, p5) --[[ line: 271 ]]
	-- upvalues: getFFlagIAPExperienceUseUpsellBadgeHelperModule (ref), getUpsellBadgeInfoModule (ref), badgeTypeModule (ref), enums (ref), reactModule (ref), view (ref), text (ref), getIconRichText (ref), formatNumberModule (ref), localizationService (ref), grayBadgeModule (ref)
	local text_1, icon
	local _ = nil
	local _ = nil
	
	if getFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local var33 = getUpsellBadgeInfoModule(p4.badgeType, p5)
		text_1 = var33.text
		icon = var33.icon
	else
		text_1 = if p4.badgeType == badgeTypeModule.Popular then p5.Popular elseif p4.badgeType == badgeTypeModule.LastPurchased then p5.LastPurchased elseif p4.badgeType == badgeTypeModule.ForYou then p5.ForYouItem elseif p4.badgeType == badgeTypeModule.BetterValue then p5.BetterValue else nil
		icon = if p4.badgeType == badgeTypeModule.Popular then enums.IconName.Flame elseif p4.badgeType == badgeTypeModule.ForYou then enums.IconName.CircleStar elseif p4.badgeType == badgeTypeModule.BetterValue then enums.IconName.Tag else nil
	end
	local var34 = if p4.isCompact then "size-full-0 auto-y radius-medium padding-small row" else "col align-x-left gap-medium size-full-0 auto-y padding-medium radius-medium"
	
	return reactModule.createElement(view, {
		LayoutOrder = p4.layoutOrder,
		onActivated = p4.onSelected,
		tag = if p4.selected then var34 .. " bg-surface-200 stroke-system-contrast stroke-thick" else var34 .. " bg-surface-300 stroke-default stroke-standard",
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

local function UpsellProductDetails(p6) --[[ line: 370 ]]
	-- upvalues: useLocalization (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UpsellProductDetailsMultiDisplayFixedImpl (ref), UpsellProductDetailsMultiDisplayImpl (ref), UpsellProductDetailsLegacyImpl (ref)
	local var35 = useLocalization({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() then if fFlagFixUpsellModalUnevenLayoutModule then UpsellProductDetailsMultiDisplayFixedImpl(p6, var35) else UpsellProductDetailsMultiDisplayImpl(p6, var35) else UpsellProductDetailsLegacyImpl(p6, var35)
end

local function UnifiedRobuxUpsellModal(p7) --[[ line: 414 ]]
	-- upvalues: useLocalization (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), fFlagAXMISWithBlackbird (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), unifiedPurchaseModalTypeEnumModule (ref), compactUpsellModalBreakpoint (ref), useInitialButtonDisableDelayModule (ref), reactModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (ref), getFFlagIAPExperienceEnableMultiDisplayUpsellModule (ref), fFlagFixUpsellModalUnevenLayoutModule (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (ref), useScaledValue (ref), fFlagShouldFixDevSubsFlashingTitleModule (ref), useFocusNavigationRefsModule (ref), fFlagShouldApplyDevSubsUpsellFixModule (ref), view (ref), image (ref), text (ref), productDetailsContainerModule (ref), sheet (ref), unifiedPurchaseModalHeaderModule (ref), priceSummaryModule (ref), unifiedProductDetailsModule (ref), UpsellProductDetails (ref), foundationModule (ref), fillBehavior (ref), buttonVariant (ref)
	local var36 = useLocalization({
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
	local var37 = if fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p7.screenSize.Y > 0 and p7.screenSize.Y < compactUpsellModalBreakpoint else p7.screenSize.Y < compactUpsellModalBreakpoint
	local var38 = useInitialButtonDisableDelayModule(false)
	local var39, var40 = reactModule.useState(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
	reactModule.useEffect(function() --[[ line: 453 ]]
		-- upvalues: getFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), fFlagFixUpsellModalUnevenLayoutModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), p7 (ref), unifiedPurchaseModalTypeEnumModule (copy), var40 (ref), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE (copy), UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT (copy)
		if getFFlagIAPExperienceEnableMultiDisplayUpsellModule() and not fFlagFixUpsellModalUnevenLayoutModule then
			if fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				var40(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
				
				return
			end
			local upsellSuggestionsCount = #p7.upsellSuggestions
			
			if upsellSuggestionsCount == 1 then
				var40(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE)
				
				return
			elseif upsellSuggestionsCount == 2 then
				var40(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT)
				
				return
			end
			var40(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
			
			return
		elseif #p7.upsellSuggestions > 1 then
			var40(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var40(UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES)
		end
	end, { p7.upsellSuggestions, p7.purchaseModalType })
	local var41 = useScaledValue(var39 or 0)
	local var42, var43 = reactModule.useState(var36.BuyRobuxAndItem)
	reactModule.useEffect(function() --[[ line: 486 ]]
		-- upvalues: p7 (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), unifiedPurchaseModalTypeEnumModule (copy), var36 (ref), fFlagShouldFixDevSubsFlashingTitleModule (copy), var43 (ref), fFlagAXMISWithBlackbird (copy), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy)
		local purchaseModalType = p7.purchaseModalType
		
		if fFlagEnableUnifiedPurchaseFlowForDevSubs and purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			var43(if fFlagShouldFixDevSubsFlashingTitleModule and var36.BuyRobuxAndSubscription and var36.BuyRobuxAndSubscription ~= "" then var36.BuyRobuxAndSubscription else var36.BuyRobuxAndItem)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then
			if fFlagAXMISWithBlackbird then
				if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p7.product.itemName ~= "RobuxUpsell" then
					var43(var36.BuyRobuxAndAvatar)
					
					return
				end
				var43(var36.BuyRobuxOnly)
				
				return
			elseif fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var43(var36.BuyRobuxAndAvatar)
				
				return
			end
			var43(var36.BuyRobuxAndItems)
			
			return
		elseif purchaseModalType == unifiedPurchaseModalTypeEnumModule.Experience then
			var43(var36.BuyRobuxAndExperience)
			
			return
		end
		var43(var36.BuyRobuxAndItem)
	end, {
		p7.purchaseModalType, var36.BuyRobuxAndAvatar, var36.BuyRobuxAndExperience,
		var36.BuyRobuxAndItem, var36.BuyRobuxAndItems, var36.BuyRobuxAndSubscription,
		if fFlagAXMISWithBlackbird then p7.product.itemName else nil,
		if fFlagAXMISWithBlackbird then var36.BuyRobuxOnly else nil
	})
	local var44, var45 = useFocusNavigationRefsModule(p7.buttons.cancelPurchaseActivated, p7.onBuyItemButtonMounted)
	reactModule.useEffect(function() --[[ line: 539 ]] end, { p7.upsellSuggestions })
	
	local _ = function(p8) --[[ line: 542 ]]
		-- upvalues: p7 (ref)
		p7.onUpsellSuggestionsSelected(p8)
	end
	
	local parts = string.split(var36.DisclosureTermsURL, " {termsofuse} ")
	local termsOfUse = var36.TermsOfUse
	
	if p7.termsOfUseActivated then
		termsOfUse = "<u>" .. termsOfUse .. "</u>"
	end
	local var47 = fFlagEnableUnifiedPurchaseFlowForDevSubs and p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local var48 = if var47 then var36.PerMonth else nil
	local var49 = if var47 then var36.Subscribe else var36.Buy
	local _ = nil
	local var50 = if var47 and fFlagShouldApplyDevSubsUpsellFixModule then reactModule.createElement(view, {
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
				Text = utf8.char(57346) .. " " .. tostring(p7.product.itemRobuxCost or 0) .. (var48 or "")
			})
		})
	}) else reactModule.createElement(productDetailsContainerModule, {
		purchaseModalType = p7.purchaseModalType,
		product = p7.product,
		isCompact = var37,
		model = p7.product.model,
		priceSuffix = var48
	})
	local var51 = getFFlagIAPExperienceEnableMultiDisplayUpsellModule()
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		onClose = p7.buttons.cancelPurchaseActivated,
		snapPoints = { var41, 0.8 },
		centerSheetHeight = if fFlagFixUpsellModalUnevenLayoutModule then nil elseif var51 then var41 else nil,
		ref = if var38 then nil else var44
	}, {
		Header = reactModule.createElement(sheet.Header, {
			hasCloseAffordance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then if p7.hideUserRobuxBalance then true else nil else nil
		}, {
			ModalHeader = reactModule.createElement(unifiedPurchaseModalHeaderModule, {
				titleText = var42,
				robuxBalanceAmount = p7.userBalance,
				hideUserRobuxBalance = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p7.hideUserRobuxBalance else nil
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = if var51 then "col align-x-center align-y-start gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-start"
			}, {
				ProductDetailsContainer = var50 or reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = if var51 then "col align-x-center align-y-center gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
				}, {
					ProductDetails = if p7.purchaseModalType == unifiedPurchaseModalTypeEnumModule.MultiItem then reactModule.createElement(priceSummaryModule, { amount = p7.product.itemRobuxCost }) else reactModule.createElement(unifiedProductDetailsModule, {
						isPortrait = false,
						isCompact = var37,
						itemIcon = p7.product.itemIcon,
						itemName = p7.product.itemName,
						itemRobuxCost = p7.product.itemRobuxCost,
						model = p7.product.model,
						priceSuffix = var48
					})
				}),
				UpsellSuggestions = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if var51 then "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" else "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
				}, if var51 then (function() --[[ line: 683 ]]
					-- upvalues: p7 (ref), reactModule (copy), UpsellProductDetails (copy), var37 (write)
					local t = {}
					
					for i, v in ipairs(p7.upsellSuggestions) do
						t["UpsellPackage" .. tostring(i)] = reactModule.createElement(UpsellProductDetails, {
							layoutOrder = i,
							product = v,
							selected = p7.selectedUpsellIndex == i,
							isCompact = var37,
							onSelected = function() --[[ line: 692 ]]
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
						isCompact = var37,
						onSelected = function() --[[ line: 706 ]]
							-- upvalues: p7 (ref)
							p7.onUpsellSuggestionsSelected(1)
						end
					}),
					UpsellPackage2 = if #p7.upsellSuggestions > 1 then reactModule.createElement(UpsellProductDetails, {
						layoutOrder = 2,
						product = p7.upsellSuggestions[2],
						selected = p7.selectedUpsellIndex == 2,
						isCompact = var37,
						onSelected = function() --[[ line: 716 ]]
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
				tag = if var51 then "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" else "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
			}, {
				reactModule.createElement(foundationModule.Button, {
					LayoutOrder = 1,
					text = var49,
					onActivated = p7.buttons.buyItemActivated,
					inputDelay = if p7.buttons.buyItemEnableInputDelayed and not var38 then 2.5 else 0,
					isDisabled = var38,
					ref = var45,
					fillBehavior = fillBehavior.Fill,
					variant = buttonVariant.Emphasis,
					size = if var37 then "Small" elseif var51 then "Medium" else nil
				}),
				DisclosureTerms = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if var51 then "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" else "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
				}, {
					DisclosurePayment = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = var36.DisclosurePayment
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

return function(p9) --[[ line: 777 | named "UnifiedRobuxUpsellModalContainer" ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), UnifiedRobuxUpsellModal (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModal = reactModule.createElement(UnifiedRobuxUpsellModal, p9)
	})
end