local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Sheet = FoundationModule.Sheet
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local Enums = FoundationModule.Enums
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent1.AppLocales).Localization
local LocalizationModule = require(Parent1.Localization)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UnifiedProductDetailsModule = require(Parent.Generic.UnifiedProductDetails)
local YellowBadgeModule = require(Parent.Generic.YellowBadge)
local GrayBadgeModule = require(Parent.Generic.GrayBadge)
local PriceSummaryModule = require(Parent.Generic.PriceSummary)
local UnifiedPurchaseModalHeaderModule = require(Parent.Generic.UnifiedPurchaseModalHeader)
local ProductDetailsContainerModule = require(Parent.Generic.ProductDetailsContainer)
local UseInitialButtonDisableDelayModule = require(Parent.Generic.Hooks.useInitialButtonDisableDelay)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local GetUpsellBadgeInfoModule = require(Parent.Utility.getUpsellBadgeInfo)
local ConstantsModule = require(Parent.Generic.Constants)
local UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE = ConstantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE
local UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT = ConstantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT
local UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES = ConstantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES
local FFlagAXMISWithBlackbird = require(Parent1.SharedFlags).FFlagAXMISWithBlackbird
local FFlagUnifiedPurchaseModalUiImprovementsModule = require(Parent.Flags.FFlagUnifiedPurchaseModalUiImprovements)
local FFlagFixUnifiedModalsMountedTwiceModule = require(Parent.Flags.FFlagFixUnifiedModalsMountedTwice)
local FFlagAddFocusNavigationToUnifiedPurchaseModule = require(Parent.Flags.FFlagAddFocusNavigationToUnifiedPurchase)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddCompactUnifiedUpsellModalModeModule = require(Parent.Flags.FFlagAddCompactUnifiedUpsellModalMode)
local CompactUpsellModalBreakpoint = game:DefineFastInt("CompactUpsellModalBreakpoint", 400)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagShouldApplyDevSubsUpsellFixModule = require(Parent.Flags.FFlagShouldApplyDevSubsUpsellFix)
local FFlagShouldFixDevSubsFlashingTitleModule = require(Parent.Flags.FFlagShouldFixDevSubsFlashingTitle)
local GetFFlagIAPExperienceEnableMultiDisplayUpsellModule = require(Parent.Flags.GetFFlagIAPExperienceEnableMultiDisplayUpsell)
local GetFFlagIAPExperienceUseUpsellBadgeHelperModule = require(Parent.Flags.GetFFlagIAPExperienceUseUpsellBadgeHelper)
local FFlagFixUpsellModalUnevenLayoutModule = require(Parent.Flags.FFlagFixUpsellModalUnevenLayout)
local _ = require(Parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local BadgeTypeModule = require(Parent.Enums.BadgeType)
local _ = require(Parent.Enums.VirtualItemBadgeType)
local _ = require(Parent.ProductPurchase.PricingTypes)

local function UpsellProductDetailsLegacyImpl(p1, p2)
	-- upvalues: BadgeTypeModule (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), ReactModule (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy), YellowBadgeModule (copy)
	local Popular = if p1.badgeType == BadgeTypeModule.Popular then p2.Popular elseif p1.badgeType == BadgeTypeModule.LastPurchased then p2.LastPurchased else nil
	local FireFill = if p1.badgeType == BadgeTypeModule.Popular then "icons/menu/fire_fill" else nil
	local v1 = "size-full-1400 radius-medium padding-x-large row"
	local AutoXyTextTitleSmallContentMutedTextAlignXLeft: string = if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then v1 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v1 .. " bg-surface-300 stroke-emphasis stroke-standard",
		Size = if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["row align-y-center gap-small"] = true,
				["align-x-start"] = true
			},
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = {
					[if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"] = FFlagAddCompactUnifiedUpsellModalModeModule,
					["auto-xy text-title-large text-align-x-left content-emphasis"] = not FFlagAddCompactUnifiedUpsellModalModeModule
				}
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. utf8.char(57346) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
				tag = {
					[AutoXyTextTitleSmallContentMutedTextAlignXLeft] = FFlagAddCompactUnifiedUpsellModalModeModule,
					["auto-xy text-title-large text-align-x-left content-muted"] = not FFlagAddCompactUnifiedUpsellModalModeModule
				}
			})
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if Popular then ReactModule.createElement(YellowBadgeModule, { LayoutOrder = 1, Text = Popular, Icon = FireFill }) else nil,
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = p1.product.price or "",
				tag = {
					[if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"] = FFlagAddCompactUnifiedUpsellModalModeModule,
					["auto-xy text-title-large text-align-x-right content-emphasis"] = not FFlagAddCompactUnifiedUpsellModalModeModule
				}
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayFixedImpl(p3, p4)
	-- upvalues: GetFFlagIAPExperienceUseUpsellBadgeHelperModule (copy), GetUpsellBadgeInfoModule (copy), BadgeTypeModule (copy), Enums (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), ReactModule (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), FormatNumberModule (copy), LocalizationService (copy), GrayBadgeModule (copy)
	local Text1 = nil
	local Icon = nil
	if GetFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local UpsellBadgeInfoModule = GetUpsellBadgeInfoModule(p3.badgeType, p4)
		Text1 = UpsellBadgeInfoModule.text
		Icon = UpsellBadgeInfoModule.icon
	else
		Text1 = if p3.badgeType == BadgeTypeModule.Popular then p4.Popular elseif p3.badgeType == BadgeTypeModule.LastPurchased then p4.LastPurchased elseif p3.badgeType == BadgeTypeModule.ForYou then p4.ForYouItem elseif p3.badgeType == BadgeTypeModule.BetterValue then p4.BetterValue else nil
		Icon = if p3.badgeType == BadgeTypeModule.Popular then Enums.IconName.Flame elseif p3.badgeType == BadgeTypeModule.ForYou then Enums.IconName.CircleStar elseif p3.badgeType == BadgeTypeModule.BetterValue then Enums.IconName.Tag else nil
	end
	local SizeFull1000RadiusMediumPaddingSmallRow: string = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "size-full-1000 radius-medium padding-small row" else "size-full-1400 radius-medium padding-x-large row"
	local AutoXyTextTitleSmallContentMutedTextAlignXLeft: string = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "auto-xy text-title-small content-muted text-align-x-left" elseif FFlagAddCompactUnifiedUpsellModalModeModule then "auto-xy text-title-medium content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p3.layoutOrder,
		onActivated = p3.onSelected,
		tag = if p3.selected then SizeFull1000RadiusMediumPaddingSmallRow .. " bg-surface-200 stroke-system-contrast stroke-thick" else SizeFull1000RadiusMediumPaddingSmallRow .. " bg-surface-300 stroke-default stroke-standard"
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center gap-small",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				RichText = true,
				Text = GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p3.product.robuxAmount),
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p3.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. GetIconRichTextFunction(Enums.IconName.Robux) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p3.product.robuxAmountBeforeBonus) .. "</s>",
				tag = AutoXyTextTitleSmallContentMutedTextAlignXLeft
			}),
			Badge = if Text1 then ReactModule.createElement(GrayBadgeModule, { LayoutOrder = 3, Text = Text1, iconName = Icon }) else nil
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = p3.product.price or "",
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayImpl(p3, p4)
	-- upvalues: GetFFlagIAPExperienceUseUpsellBadgeHelperModule (copy), GetUpsellBadgeInfoModule (copy), BadgeTypeModule (copy), Enums (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), ReactModule (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), FormatNumberModule (copy), LocalizationService (copy), GrayBadgeModule (copy)
	local Text1 = nil
	local Icon = nil
	if GetFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local UpsellBadgeInfoModule = GetUpsellBadgeInfoModule(p3.badgeType, p4)
		Text1 = UpsellBadgeInfoModule.text
		Icon = UpsellBadgeInfoModule.icon
	else
		Text1 = if p3.badgeType == BadgeTypeModule.Popular then p4.Popular elseif p3.badgeType == BadgeTypeModule.LastPurchased then p4.LastPurchased elseif p3.badgeType == BadgeTypeModule.ForYou then p4.ForYouItem elseif p3.badgeType == BadgeTypeModule.BetterValue then p4.BetterValue else nil
		Icon = if p3.badgeType == BadgeTypeModule.Popular then Enums.IconName.Flame elseif p3.badgeType == BadgeTypeModule.ForYou then Enums.IconName.CircleStar elseif p3.badgeType == BadgeTypeModule.BetterValue then Enums.IconName.Tag else nil
	end
	local SizeFull0AutoYRadiusMediumPaddingSmallRow: string = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "size-full-0 auto-y radius-medium padding-small row" else "col align-x-left gap-medium size-full-0 auto-y padding-medium radius-medium"
	local AutoXyTextTitleSmallContentMutedTextAlignXLeft: string = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "auto-xy text-title-small content-muted text-align-x-left" elseif FFlagAddCompactUnifiedUpsellModalModeModule then "auto-xy text-title-medium content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p3.layoutOrder,
		onActivated = p3.onSelected,
		tag = if p3.selected then SizeFull0AutoYRadiusMediumPaddingSmallRow .. " bg-surface-200 stroke-system-contrast stroke-thick" else SizeFull0AutoYRadiusMediumPaddingSmallRow .. " bg-surface-300 stroke-default stroke-standard",
		Size = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["row align-x-left align-y-center gap-small"] = true,
				["size-full-0 auto-y"] = not (FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact)
			},
			Size = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then UDim2.new(0.65, 0, 1, 0) else nil
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				RichText = true,
				Text = GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p3.product.robuxAmount),
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p3.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. GetIconRichTextFunction(Enums.IconName.Robux) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p3.product.robuxAmountBeforeBonus) .. "</s>",
				tag = AutoXyTextTitleSmallContentMutedTextAlignXLeft
			}),
			Badge = if Text1 then ReactModule.createElement(GrayBadgeModule, { LayoutOrder = 3, Text = Text1, iconName = Icon }) else nil
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["row align-x-right align-y-center gap-large"] = true,
				["size-full-0 auto-y"] = not (FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact)
			},
			Size = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then UDim2.new(0.35, 0, 1, 0) else nil
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = p3.product.price or "",
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p3.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetails(p3)
	-- upvalues: UseLocalizationFunction (copy), GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), FFlagFixUpsellModalUnevenLayoutModule (copy), UpsellProductDetailsMultiDisplayFixedImpl (copy), UpsellProductDetailsMultiDisplayImpl (copy), UpsellProductDetailsLegacyImpl (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if GetFFlagIAPExperienceEnableMultiDisplayUpsellModule() then if FFlagFixUpsellModalUnevenLayoutModule then UpsellProductDetailsMultiDisplayFixedImpl(p3, UseLocalizationResult) else UpsellProductDetailsMultiDisplayImpl(p3, UseLocalizationResult) else UpsellProductDetailsLegacyImpl(p3, UseLocalizationResult)
end

local function UnifiedRobuxUpsellModal(p3)
	-- upvalues: UseLocalizationFunction (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), FFlagAXMISWithBlackbird (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), UnifiedPurchaseModalTypeEnumModule (copy), CompactUpsellModalBreakpoint (copy), UseInitialButtonDisableDelayModule (copy), FFlagUnifiedPurchaseModalUiImprovementsModule (copy), ReactModule (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT (copy), GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), FFlagFixUpsellModalUnevenLayoutModule (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE (copy), UseScaledValueFunction (copy), FFlagShouldFixDevSubsFlashingTitleModule (copy), FFlagFixUnifiedModalsMountedTwiceModule (copy), FFlagAddFocusNavigationToUnifiedPurchaseModule (copy), UseFocusNavigationRefsModule (copy), FFlagShouldApplyDevSubsUpsellFixModule (copy), View (copy), Image (copy), Text (copy), ProductDetailsContainerModule (copy), Sheet (copy), UnifiedPurchaseModalHeaderModule (copy), PriceSummaryModule (copy), UnifiedProductDetailsModule (copy), UpsellProductDetails (copy), FoundationModule (copy), FillBehavior (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Buy = "IAPExperience.PurchasePrompt.Action.Buy",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL",
		TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse",
		BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience",
		BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem",
		BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems",
		Subscribe = if FFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Action.Subscribe" else nil,
		BuyRobuxOnly = if FFlagAXMISWithBlackbird then "IAPExperience.PurchasePrompt.Title.BuyRobuxOnly" else nil,
		BuyRobuxAndAvatar = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" else nil,
		BuyRobuxAndSubscription = if FFlagEnableUnifiedPurchaseFlowForDevSubs then "IAPExperience.PurchasePrompt.BuyRobuxAndSubscription" else nil,
		PerMonth = if FFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Text.PerMonth" else nil
	})
	local IsYBelow = if FFlagAddCompactUnifiedUpsellModalModeModule then if FFlagEnableUnifiedPurchaseFlowForDevSubs and p3.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p3.screenSize.Y > 0 and p3.screenSize.Y < CompactUpsellModalBreakpoint else p3.screenSize.Y < CompactUpsellModalBreakpoint else nil
	local UseInitialButtonDisableDelayModuleResult = UseInitialButtonDisableDelayModule(false)
	local v2 = nil
	local Callback = nil
	
	if FFlagUnifiedPurchaseModalUiImprovementsModule then
		v2, Callback = ReactModule.useState(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT)
	end
	if FFlagUnifiedPurchaseModalUiImprovementsModule then
		ReactModule.useEffect(function()
			-- upvalues: GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (upval), FFlagFixUpsellModalUnevenLayoutModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), p3 (copy), UnifiedPurchaseModalTypeEnumModule (upval), Callback (ref), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES (upval), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE (upval), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT (upval)
			if not GetFFlagIAPExperienceEnableMultiDisplayUpsellModule() or FFlagFixUpsellModalUnevenLayoutModule then
				if #p3.upsellSuggestions > 1 then
					Callback(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
				end
				if FFlagEnableUnifiedPurchaseFlowForDevSubs and p3.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
					Callback(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
				end
				return
			elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and p3.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				Callback(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
				
				return
			else
				local CountUpsellSuggestions = #p3.upsellSuggestions
				
				if CountUpsellSuggestions == 1 then
					Callback(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE)
					
					return
				end
				if CountUpsellSuggestions == 2 then
					Callback(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT)
					
					return
				else
					Callback(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
				end
			end
		end, { p3.upsellSuggestions, p3.purchaseModalType })
	end
	local UseScaledValueResult = UseScaledValueFunction(v2 or 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseLocalizationResult.BuyRobuxAndItem)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), UnifiedPurchaseModalTypeEnumModule (upval), UseLocalizationResult (copy), FFlagShouldFixDevSubsFlashingTitleModule (upval), UseStateResult2 (copy), FFlagAXMISWithBlackbird (upval), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval)
		local PurchaseModalType = p3.purchaseModalType
		
		if FFlagEnableUnifiedPurchaseFlowForDevSubs and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			UseStateResult2(if FFlagShouldFixDevSubsFlashingTitleModule and UseLocalizationResult.BuyRobuxAndSubscription and UseLocalizationResult.BuyRobuxAndSubscription ~= "" then UseLocalizationResult.BuyRobuxAndSubscription else UseLocalizationResult.BuyRobuxAndItem)
			
			return
		end
		if PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then
			if FFlagAXMISWithBlackbird then
				if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p3.product.itemName ~= "RobuxUpsell" then
					UseStateResult2(UseLocalizationResult.BuyRobuxAndAvatar)
					
					return
				else
					UseStateResult2(UseLocalizationResult.BuyRobuxOnly)
					
					return
				end
			elseif FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				UseStateResult2(UseLocalizationResult.BuyRobuxAndAvatar)
				
				return
			else
				UseStateResult2(UseLocalizationResult.BuyRobuxAndItems)
				
				return
			end
		elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.Experience then
			UseStateResult2(UseLocalizationResult.BuyRobuxAndExperience)
			
			return
		else
			UseStateResult2(UseLocalizationResult.BuyRobuxAndItem)
		end
	end, {
		p3.purchaseModalType, UseLocalizationResult.BuyRobuxAndAvatar,
		UseLocalizationResult.BuyRobuxAndExperience,
		UseLocalizationResult.BuyRobuxAndItem, UseLocalizationResult.BuyRobuxAndItems,
		UseLocalizationResult.BuyRobuxAndSubscription,
		if FFlagAXMISWithBlackbird then p3.product.itemName else nil,
		if FFlagAXMISWithBlackbird then UseLocalizationResult.BuyRobuxOnly else nil
	})
	local UseResult = if FFlagFixUnifiedModalsMountedTwiceModule then ReactModule.useCallback(function(p4)
		-- upvalues: p3 (copy), UseInitialButtonDisableDelayModuleResult (copy)
		if p4 and p3.onBuyItemButtonMounted and not UseInitialButtonDisableDelayModuleResult then
			p3.onBuyItemButtonMounted(p4)
		end
	end, {
		p3.onBuyItemButtonMounted,
		UseInitialButtonDisableDelayModuleResult
	}) else ReactModule.useCallback(function(p4)
		-- upvalues: p3 (copy)
		if p4 and p3.onBuyItemButtonMounted then
			p3.onBuyItemButtonMounted(p4)
		end
	end, { p3.onBuyItemButtonMounted })
	local v3 = nil
	local v4 = nil
	
	if FFlagAddFocusNavigationToUnifiedPurchaseModule then
		v3, v76 = UseFocusNavigationRefsModule(p3.buttons.cancelPurchaseActivated, p3.onBuyItemButtonMounted)
	end
	ReactModule.useEffect(function() end, { p3.upsellSuggestions })
	
	local function _(p4)
		-- upvalues: p3 (copy)
		p3.onUpsellSuggestionsSelected(p4)
	end
	
	local Parts = string.split(UseLocalizationResult.DisclosureTermsURL, " {termsofuse} ")
	local TermsOfUse = UseLocalizationResult.TermsOfUse
	
	if p3.termsOfUseActivated then
		TermsOfUse = "<u>" .. TermsOfUse .. "</u>"
	end
	local IsPurchaseModalTypeMatch: boolean = FFlagEnableUnifiedPurchaseFlowForDevSubs and p3.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local PerMonth = if IsPurchaseModalTypeMatch then UseLocalizationResult.PerMonth else nil
	local Element = if IsPurchaseModalTypeMatch and FFlagShouldApplyDevSubsUpsellFixModule then ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-medium size-full-0 auto-y"
	}, {
		ItemIcon = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(72, 72),
			ScaleType = Enum.ScaleType.Fit,
			Image = p3.product.itemIcon
		}),
		ItemInfo = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col gap-xxsmall auto-y",
			Size = UDim2.new(1, -84, 0, 0)
		}, {
			ItemName = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Size = UDim2.new(1, 0, 0, 0),
				Text = p3.product.itemName or ""
			}),
			ItemPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-y text-title-medium text-align-x-left content-emphasis",
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = utf8.char(57346) .. " " .. tostring(p3.product.itemRobuxCost or 0) .. (PerMonth or "")
			})
		})
	}) else ReactModule.createElement(ProductDetailsContainerModule, {
		purchaseModalType = p3.purchaseModalType,
		product = p3.product,
		isCompact = IsYBelow,
		model = p3.product.model,
		priceSuffix = PerMonth
	})
	local FFlagIAPExperienceEnableMultiDisplayUpsellModule = GetFFlagIAPExperienceEnableMultiDisplayUpsellModule()
	local ColAlignXCenterAlignYCenterGapMediumSizeFull0AutoY: string = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "col align-x-center align-y-center gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		onClose = p3.buttons.cancelPurchaseActivated,
		snapPoints = if FFlagUnifiedPurchaseModalUiImprovementsModule then { UseScaledValueResult, 0.8 } else { 0.52, 0.8 },
		centerSheetHeight = if FFlagFixUpsellModalUnevenLayoutModule then nil elseif FFlagUnifiedPurchaseModalUiImprovementsModule and FFlagIAPExperienceEnableMultiDisplayUpsellModule then UseScaledValueResult else nil,
		ref = if FFlagAddFocusNavigationToUnifiedPurchaseModule then if UseInitialButtonDisableDelayModuleResult then nil else v3 else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, {
			hasCloseAffordance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p3.hideUserRobuxBalance then true else nil
		}, {
			ModalHeader = ReactModule.createElement(UnifiedPurchaseModalHeaderModule, {
				titleText = UseStateResult,
				robuxBalanceAmount = p3.userBalance,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p3.hideUserRobuxBalance else nil
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "col align-x-center align-y-start gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-start"
			}, {
				ProductDetailsContainer = if Element then Element else ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = ColAlignXCenterAlignYCenterGapMediumSizeFull0AutoY
				}, {
					ProductDetails = if p3.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then ReactModule.createElement(PriceSummaryModule, { amount = p3.product.itemRobuxCost }) else ReactModule.createElement(UnifiedProductDetailsModule, {
						isPortrait = false,
						isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
						itemIcon = p3.product.itemIcon,
						itemName = p3.product.itemName,
						itemRobuxCost = p3.product.itemRobuxCost,
						model = p3.product.model,
						priceSuffix = PerMonth
					})
				}),
				UpsellSuggestions = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" else "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
				}, if FFlagIAPExperienceEnableMultiDisplayUpsellModule then (function()
					-- upvalues: p3 (copy), ReactModule (upval), UpsellProductDetails (upval), FFlagAddCompactUnifiedUpsellModalModeModule (upval), IsYBelow (ref)
					local Elements = {}
					
					for LayoutOrder, upsellSuggestion in ipairs(p3.upsellSuggestions) do
						Elements["UpsellPackage" .. tostring(LayoutOrder)] = ReactModule.createElement(UpsellProductDetails, {
							layoutOrder = LayoutOrder,
							product = upsellSuggestion,
							selected = p3.selectedUpsellIndex == LayoutOrder,
							isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
							onSelected = function()
								-- upvalues: LayoutOrder (copy), p3 (upval)
								p3.onUpsellSuggestionsSelected(LayoutOrder)
							end,
							badgeType = upsellSuggestion.badgeType
						})
					end
					return Elements
				end)() else {
					UpsellPackage1 = ReactModule.createElement(UpsellProductDetails, {
						layoutOrder = 1,
						product = p3.upsellSuggestions[1],
						selected = p3.selectedUpsellIndex == 1,
						isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
						onSelected = function()
							-- upvalues: p3 (copy)
							p3.onUpsellSuggestionsSelected(1)
						end
					}),
					UpsellPackage2 = if #p3.upsellSuggestions > 1 then ReactModule.createElement(UpsellProductDetails, {
						layoutOrder = 2,
						product = p3.upsellSuggestions[2],
						selected = p3.selectedUpsellIndex == 2,
						isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
						onSelected = function()
							-- upvalues: p3 (copy)
							p3.onUpsellSuggestionsSelected(2)
						end,
						badgeType = p3.upsellSuggestions[2].badgeType
					}) else nil
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" else "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
			}, {
				ReactModule.createElement(FoundationModule.Button, {
					LayoutOrder = 1,
					text = if IsPurchaseModalTypeMatch then UseLocalizationResult.Subscribe else UseLocalizationResult.Buy,
					onActivated = p3.buttons.buyItemActivated,
					inputDelay = if p3.buttons.buyItemEnableInputDelayed and not UseInitialButtonDisableDelayModuleResult then 2.5 else 0,
					isDisabled = UseInitialButtonDisableDelayModuleResult,
					ref = if FFlagAddFocusNavigationToUnifiedPurchaseModule then v4 else UseResult,
					fillBehavior = FillBehavior.Fill,
					variant = ButtonVariant.Emphasis,
					size = if FFlagAddCompactUnifiedUpsellModalModeModule and IsYBelow then "Small" elseif FFlagIAPExperienceEnableMultiDisplayUpsellModule then "Medium" else nil
				}),
				DisclosureTerms = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" else "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
				}, {
					DisclosurePayment = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = UseLocalizationResult.DisclosurePayment
					}),
					BeforeText = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = Parts[1]
					}),
					TextLink = ReactModule.createElement(Text, {
						LayoutOrder = 3,
						RichText = true,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = TermsOfUse,
						onActivated = p3.termsOfUseActivated
					}),
					AfterText = ReactModule.createElement(Text, {
						LayoutOrder = 4,
						tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
						Text = Parts[2]
					})
				})
			})
		})
	})
end

return function(p4)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedRobuxUpsellModal (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModal = ReactModule.createElement(UnifiedRobuxUpsellModal, p4)
	})
end