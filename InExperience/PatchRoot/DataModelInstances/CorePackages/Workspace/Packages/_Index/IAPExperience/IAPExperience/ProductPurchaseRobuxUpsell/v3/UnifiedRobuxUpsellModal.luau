local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local ButtonGroup = FoundationModule.ButtonGroup
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Orientation = FoundationModule.Enums.Orientation
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
local CartPricingLoadingModule = require(Parent.ProductPurchase.v4.CartPricingLoading)
local BuildCartPricingOfferCheckboxesModule = require(Parent.ProductPurchase.v4.buildCartPricingOfferCheckboxes)
local UseCartPricingModule = require(Parent.ProductPurchase.v4.useCartPricing)
local UseInitialButtonDisableDelayModule = require(Parent.Generic.Hooks.useInitialButtonDisableDelay)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(Parent.ProductPurchase.v4.cartPricingResponseLineItem)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local GetUpsellBadgeInfoModule = require(Parent.Utility.getUpsellBadgeInfo)
local ConstantsModule = require(Parent.Generic.Constants)
local UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE = ConstantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE
local UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT = ConstantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT
local UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES = ConstantsModule.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES
local FFlagAXMISWithBlackbird = require(Parent1.SharedFlags).FFlagAXMISWithBlackbird
local FFlagEnableRobuxUpsellPlusButtonExperimentModule = require(Parent.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local CompactUpsellModalBreakpoint = game:DefineFastInt("CompactUpsellModalBreakpoint", 400)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagShouldApplyDevSubsUpsellFixModule = require(Parent.Flags.FFlagShouldApplyDevSubsUpsellFix)
local FFlagShouldFixDevSubsFlashingTitleModule = require(Parent.Flags.FFlagShouldFixDevSubsFlashingTitle)
local GetFFlagIAPExperienceEnableMultiDisplayUpsellModule = require(Parent.Flags.GetFFlagIAPExperienceEnableMultiDisplayUpsell)
local GetFFlagIAPExperienceUseUpsellBadgeHelperModule = require(Parent.Flags.GetFFlagIAPExperienceUseUpsellBadgeHelper)
local FFlagFixUpsellModalUnevenLayoutModule = require(Parent.Flags.FFlagFixUpsellModalUnevenLayout)
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local _ = require(Parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local BadgeTypeModule = require(Parent.Enums.BadgeType)
local _ = require(Parent.Enums.VirtualItemBadgeType)
local _ = require(Parent.ProductPurchase.PricingTypes)

local function UpsellProductDetailsLegacyImpl(p1, p2)
	-- upvalues: BadgeTypeModule (copy), ReactModule (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy), YellowBadgeModule (copy)
	local Popular = if p1.badgeType == BadgeTypeModule.Popular then p2.Popular elseif p1.badgeType == BadgeTypeModule.LastPurchased then p2.LastPurchased else nil
	local FireFill = if p1.badgeType == BadgeTypeModule.Popular then "icons/menu/fire_fill" else nil
	local v1 = "size-full-1400 radius-medium padding-x-large row"
	local AutoXyTextTitleSmallContentMutedTextAlignXLeft: string = if p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-large content-muted text-align-x-left"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then v1 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v1 .. " bg-surface-300 stroke-emphasis stroke-standard",
		Size = if p1.isCompact then UDim2.new(1, 0, 0, 40) else nil
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
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. utf8.char(57346) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
				tag = AutoXyTextTitleSmallContentMutedTextAlignXLeft
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
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayFixedImpl(p1, p2)
	-- upvalues: GetFFlagIAPExperienceUseUpsellBadgeHelperModule (copy), GetUpsellBadgeInfoModule (copy), BadgeTypeModule (copy), Enums (copy), ReactModule (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), FormatNumberModule (copy), LocalizationService (copy), GrayBadgeModule (copy)
	local Text1 = nil
	local Icon = nil
	if GetFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local UpsellBadgeInfoModule = GetUpsellBadgeInfoModule(p1.badgeType, p2)
		Text1 = UpsellBadgeInfoModule.text
		Icon = UpsellBadgeInfoModule.icon
	else
		Text1 = if p1.badgeType == BadgeTypeModule.Popular then p2.Popular elseif p1.badgeType == BadgeTypeModule.LastPurchased then p2.LastPurchased elseif p1.badgeType == BadgeTypeModule.ForYou then p2.ForYouItem elseif p1.badgeType == BadgeTypeModule.BetterValue then p2.BetterValue else nil
		Icon = if p1.badgeType == BadgeTypeModule.Popular then Enums.IconName.Flame elseif p1.badgeType == BadgeTypeModule.ForYou then Enums.IconName.CircleStar elseif p1.badgeType == BadgeTypeModule.BetterValue then Enums.IconName.Tag else nil
	end
	local SizeFull1000RadiusMediumPaddingSmallRow: string = if p1.isCompact then "size-full-1000 radius-medium padding-small row" else "size-full-1400 radius-medium padding-x-large row"
	local AutoXyTextTitleSmallContentMutedTextAlignXLeft: string = if p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-medium content-muted text-align-x-left"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then SizeFull1000RadiusMediumPaddingSmallRow .. " bg-surface-200 stroke-system-contrast stroke-thick" else SizeFull1000RadiusMediumPaddingSmallRow .. " bg-surface-300 stroke-default stroke-standard"
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center gap-small",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				RichText = true,
				Text = GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. GetIconRichTextFunction(Enums.IconName.Robux) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
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
				Text = p1.product.price or "",
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayImpl(p1, p2)
	-- upvalues: GetFFlagIAPExperienceUseUpsellBadgeHelperModule (copy), GetUpsellBadgeInfoModule (copy), BadgeTypeModule (copy), Enums (copy), ReactModule (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), FormatNumberModule (copy), LocalizationService (copy), GrayBadgeModule (copy)
	local Text1 = nil
	local Icon = nil
	if GetFFlagIAPExperienceUseUpsellBadgeHelperModule() then
		local UpsellBadgeInfoModule = GetUpsellBadgeInfoModule(p1.badgeType, p2)
		Text1 = UpsellBadgeInfoModule.text
		Icon = UpsellBadgeInfoModule.icon
	else
		Text1 = if p1.badgeType == BadgeTypeModule.Popular then p2.Popular elseif p1.badgeType == BadgeTypeModule.LastPurchased then p2.LastPurchased elseif p1.badgeType == BadgeTypeModule.ForYou then p2.ForYouItem elseif p1.badgeType == BadgeTypeModule.BetterValue then p2.BetterValue else nil
		Icon = if p1.badgeType == BadgeTypeModule.Popular then Enums.IconName.Flame elseif p1.badgeType == BadgeTypeModule.ForYou then Enums.IconName.CircleStar elseif p1.badgeType == BadgeTypeModule.BetterValue then Enums.IconName.Tag else nil
	end
	local SizeFull0AutoYRadiusMediumPaddingSmallRow: string = if p1.isCompact then "size-full-0 auto-y radius-medium padding-small row" else "col align-x-left gap-medium size-full-0 auto-y padding-medium radius-medium"
	local AutoXyTextTitleSmallContentMutedTextAlignXLeft: string = if p1.isCompact then "auto-xy text-title-small content-muted text-align-x-left" else "auto-xy text-title-medium content-muted text-align-x-left"
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		onActivated = p1.onSelected,
		tag = if p1.selected then SizeFull0AutoYRadiusMediumPaddingSmallRow .. " bg-surface-200 stroke-system-contrast stroke-thick" else SizeFull0AutoYRadiusMediumPaddingSmallRow .. " bg-surface-300 stroke-default stroke-standard",
		Size = if p1.isCompact then UDim2.new(1, 0, 0, 40) else nil
	}, {
		LeftSide = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["row align-x-left align-y-center gap-small"] = true,
				["size-full-0 auto-y"] = not p1.isCompact
			},
			Size = if p1.isCompact then UDim2.new(0.65, 0, 1, 0) else nil
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				RichText = true,
				Text = GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-heading-small content-emphasis text-align-x-left"
			}),
			RobuxAmountBonus = p1.product.robuxAmountBeforeBonus and ReactModule.createElement(Text, {
				LayoutOrder = 2,
				RichText = true,
				Text = "<s>" .. GetIconRichTextFunction(Enums.IconName.Robux) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmountBeforeBonus) .. "</s>",
				tag = AutoXyTextTitleSmallContentMutedTextAlignXLeft
			}),
			Badge = if Text1 then ReactModule.createElement(GrayBadgeModule, { LayoutOrder = 3, Text = Text1, iconName = Icon }) else nil
		}),
		RightSide = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["row align-x-right align-y-center gap-large"] = true,
				["size-full-0 auto-y"] = not p1.isCompact
			},
			Size = if p1.isCompact then UDim2.new(0.35, 0, 1, 0) else nil
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = p1.product.price or "",
				tag = if p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetails(p1)
	-- upvalues: UseLocalizationFunction (copy), GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), FFlagFixUpsellModalUnevenLayoutModule (copy), UpsellProductDetailsMultiDisplayFixedImpl (copy), UpsellProductDetailsMultiDisplayImpl (copy), UpsellProductDetailsLegacyImpl (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if GetFFlagIAPExperienceEnableMultiDisplayUpsellModule() then if FFlagFixUpsellModalUnevenLayoutModule then UpsellProductDetailsMultiDisplayFixedImpl(p1, UseLocalizationResult) else UpsellProductDetailsMultiDisplayImpl(p1, UseLocalizationResult) else UpsellProductDetailsLegacyImpl(p1, UseLocalizationResult)
end

local function _(p1)
	local RobloxPlusDiscountPercentage = p1.robloxPlusDiscountPercentage
	
	if type(RobloxPlusDiscountPercentage) == "number" then
		return RobloxPlusDiscountPercentage, p1.onRobloxPlusButtonActivated
	else
		return nil, nil
	end
end

local function UnifiedRobuxUpsellModal(p1)
	-- upvalues: FFlagEnableRobuxUpsellPlusButtonExperimentModule (copy), UseCartPricingModule (copy), ReactModule (copy), UseLocalizationFunction (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), FFlagAXMISWithBlackbird (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), UnifiedPurchaseModalTypeEnumModule (copy), CompactUpsellModalBreakpoint (copy), UseInitialButtonDisableDelayModule (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT (copy), GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), FFlagFixUpsellModalUnevenLayoutModule (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE (copy), UseScaledValueFunction (copy), FFlagShouldFixDevSubsFlashingTitleModule (copy), UseFocusNavigationRefsModule (copy), BuildCartPricingOfferCheckboxesModule (copy), View (copy), FFlagShouldApplyDevSubsUpsellFixModule (copy), Image (copy), Text (copy), ProductDetailsContainerModule (copy), FillBehavior (copy), ButtonVariant (copy), Sheet (copy), UnifiedPurchaseModalHeaderModule (copy), PriceSummaryModule (copy), UnifiedProductDetailsModule (copy), CartPricingLoadingModule (copy), UpsellProductDetails (copy), ButtonGroup (copy), Orientation (copy), Enums (copy), FoundationModule (copy)
	local DiscountPercentage = nil
	local OnActivated = nil
	
	if FFlagEnableRobuxUpsellPlusButtonExperimentModule then
		local RobloxPlusDiscountPercentage = p1.robloxPlusDiscountPercentage
		local OnRobloxPlusButtonActivated = nil
		local v1 = nil
		
		if type(RobloxPlusDiscountPercentage) == "number" then
			v1 = RobloxPlusDiscountPercentage
			OnRobloxPlusButtonActivated = p1.onRobloxPlusButtonActivated
		else
			v1 = nil
			OnRobloxPlusButtonActivated = nil
		end
		DiscountPercentage = v1
		OnActivated = OnRobloxPlusButtonActivated
	end
	local UseCartPricingModuleResult = UseCartPricingModule({
		product = p1.product,
		purchaseModalType = p1.purchaseModalType,
		cartPricingResponse = p1.cartPricingResponse,
		onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseCartPricingModuleResult (copy), p1 (copy)
		return if UseCartPricingModuleResult.showCartOfferUi then UseCartPricingModuleResult.mergedProductForDetails else p1.product
	end, {
		p1.product,
		UseCartPricingModuleResult.showCartOfferUi,
		UseCartPricingModuleResult.mergedProductForDetails
	})
	local UseLocalizationResult = UseLocalizationFunction({
		Buy = "IAPExperience.PurchasePrompt.Action.Buy",
		DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment",
		DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL",
		TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse",
		BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience",
		BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem",
		BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems",
		GetTenPercentOff = if DiscountPercentage == nil then nil else {
			"IAPExperience.RobuxUpsell.Action.GetPercentOff",
			discountPercentage = DiscountPercentage
		},
		Subscribe = if FFlagEnableUnifiedPurchaseFlowForDevSubs then "Feature.Subscription.Action.Subscribe" else nil,
		BuyRobuxOnly = if FFlagAXMISWithBlackbird then "IAPExperience.PurchasePrompt.Title.BuyRobuxOnly" else nil,
		BuyRobuxAndAvatar = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" else nil,
		BuyRobuxAndSubscription = if FFlagEnableUnifiedPurchaseFlowForDevSubs then "IAPExperience.PurchasePrompt.BuyRobuxAndSubscription" else nil,
		PerMonth = if FFlagEnableUnifiedPurchaseFlowForDevSubs or FFlagLuaAppsEnablePromptVIPServerPurchase then "Feature.Subscription.Text.PerMonth" else nil
	})
	local IsYBelow: boolean = if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p1.screenSize.Y > 0 and p1.screenSize.Y < CompactUpsellModalBreakpoint else p1.screenSize.Y < CompactUpsellModalBreakpoint
	local UseInitialButtonDisableDelayModuleResult = UseInitialButtonDisableDelayModule(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT)
	ReactModule.useEffect(function()
		-- upvalues: GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (upval), FFlagFixUpsellModalUnevenLayoutModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), p1 (copy), UnifiedPurchaseModalTypeEnumModule (upval), UseStateResult2 (copy), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES (upval), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE (upval), UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT (upval)
		if not GetFFlagIAPExperienceEnableMultiDisplayUpsellModule() or FFlagFixUpsellModalUnevenLayoutModule then
			if #p1.upsellSuggestions > 1 then
				UseStateResult2(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
			end
			if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
				UseStateResult2(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
			end
			return
		elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			UseStateResult2(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
			
			return
		else
			local CountUpsellSuggestions = #p1.upsellSuggestions
			
			if CountUpsellSuggestions == 1 then
				UseStateResult2(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSSINGLEPACKAGE)
				
				return
			end
			if CountUpsellSuggestions == 2 then
				UseStateResult2(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSDEFAULT)
				
				return
			else
				UseStateResult2(UNIFIEDROBUXUPSELLMODALMINHEIGHTPIXELSWITHMULTIPLEPACKAGES)
			end
		end
	end, { p1.upsellSuggestions, p1.purchaseModalType })
	local UseScaledValueResult = UseScaledValueFunction(UseStateResult or 0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseLocalizationResult.BuyRobuxAndItem)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), UnifiedPurchaseModalTypeEnumModule (upval), UseLocalizationResult (copy), FFlagShouldFixDevSubsFlashingTitleModule (upval), UseStateResult2_1 (copy), FFlagAXMISWithBlackbird (upval), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval)
		local PurchaseModalType = p1.purchaseModalType
		
		if FFlagEnableUnifiedPurchaseFlowForDevSubs and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			UseStateResult2_1(if FFlagShouldFixDevSubsFlashingTitleModule and UseLocalizationResult.BuyRobuxAndSubscription and UseLocalizationResult.BuyRobuxAndSubscription ~= "" then UseLocalizationResult.BuyRobuxAndSubscription else UseLocalizationResult.BuyRobuxAndItem)
			
			return
		end
		if PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then
			if FFlagAXMISWithBlackbird then
				if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.product.itemName ~= "RobuxUpsell" then
					UseStateResult2_1(UseLocalizationResult.BuyRobuxAndAvatar)
					
					return
				else
					UseStateResult2_1(UseLocalizationResult.BuyRobuxOnly)
					
					return
				end
			elseif FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				UseStateResult2_1(UseLocalizationResult.BuyRobuxAndAvatar)
				
				return
			else
				UseStateResult2_1(UseLocalizationResult.BuyRobuxAndItems)
				
				return
			end
		elseif PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.Experience then
			UseStateResult2_1(UseLocalizationResult.BuyRobuxAndExperience)
			
			return
		else
			UseStateResult2_1(UseLocalizationResult.BuyRobuxAndItem)
		end
	end, {
		p1.purchaseModalType, UseLocalizationResult.BuyRobuxAndAvatar,
		UseLocalizationResult.BuyRobuxAndExperience,
		UseLocalizationResult.BuyRobuxAndItem, UseLocalizationResult.BuyRobuxAndItems,
		UseLocalizationResult.BuyRobuxAndSubscription,
		if FFlagAXMISWithBlackbird then p1.product.itemName else nil,
		if FFlagAXMISWithBlackbird then UseLocalizationResult.BuyRobuxOnly else nil
	})
	local UseFocusNavigationRefsModuleResult, UseFocusNavigationRefsModuleResult2 = UseFocusNavigationRefsModule(p1.buttons.cancelPurchaseActivated, p1.onBuyItemButtonMounted)
	ReactModule.useEffect(function() end, { p1.upsellSuggestions })
	
	local function _(p2)
		-- upvalues: p1 (copy)
		p1.onUpsellSuggestionsSelected(p2)
	end
	
	local Parts = string.split(UseLocalizationResult.DisclosureTermsURL, " {termsofuse} ")
	local TermsOfUse = UseLocalizationResult.TermsOfUse
	
	if p1.termsOfUseActivated then
		TermsOfUse = "<u>" .. TermsOfUse .. "</u>"
	end
	local IsPurchaseModalTypeMatch: boolean = FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription
	local PerMonth = if IsPurchaseModalTypeMatch then UseLocalizationResult.PerMonth elseif FFlagLuaAppsEnablePromptVIPServerPurchase and p1.isMonthlyPrice then UseLocalizationResult.PerMonth else nil
	local CartPricingOfferCheckboxesModule = BuildCartPricingOfferCheckboxesModule({
		cartPricing = UseCartPricingModuleResult,
		isDisabled = p1.isCartPricingLoading == true or UseInitialButtonDisableDelayModuleResult
	})
	local Element = if IsPurchaseModalTypeMatch and FFlagShouldApplyDevSubsUpsellFixModule then ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-medium size-full-0 auto-y"
	}, {
		ItemIcon = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(72, 72),
			ScaleType = Enum.ScaleType.Fit,
			Image = p1.product.itemIcon
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
				Text = p1.product.itemName or ""
			}),
			ItemPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-y text-title-medium text-align-x-left content-emphasis",
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = utf8.char(57346) .. " " .. tostring(p1.product.itemRobuxCost or 0) .. (PerMonth or "")
			})
		})
	}) else ReactModule.createElement(ProductDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = UseMemoResult,
		isCompact = IsYBelow,
		model = UseMemoResult.model,
		priceSuffix = PerMonth,
		includePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.isMonthlyPrice else nil,
		hideDiscountSummary = p1.isCartPricingLoading,
		savingsSummary = UseCartPricingModuleResult.cartPricingSavingsSummary
	})
	local FFlagIAPExperienceEnableMultiDisplayUpsellModule = GetFFlagIAPExperienceEnableMultiDisplayUpsellModule()
	local RowWrapAlignXCenterAlignYCenterGapMediumSizeFull0AutoY: string = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" else "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium"
	local ColGapSmallSizeFull0AutoY: string = if OnActivated then "col gap-small size-full-0 auto-y" else RowWrapAlignXCenterAlignYCenterGapMediumSizeFull0AutoY
	local RowWrapAlignXLeftAlignYCenterGapXxsmallSizeFull0AutoY: string = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" else "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
	local Small = if IsYBelow then "Small" elseif FFlagIAPExperienceEnableMultiDisplayUpsellModule then "Medium" else nil
	local config = {
		LayoutOrder = 1,
		text = if IsPurchaseModalTypeMatch then UseLocalizationResult.Subscribe else UseLocalizationResult.Buy,
		onActivated = p1.buttons.buyItemActivated,
		inputDelay = if p1.buttons.buyItemEnableInputDelayed and not UseInitialButtonDisableDelayModuleResult then 2.5 else 0,
		isDisabled = UseInitialButtonDisableDelayModuleResult,
		ref = UseFocusNavigationRefsModuleResult2,
		fillBehavior = FillBehavior.Fill,
		variant = ButtonVariant.Emphasis,
		size = Small
	}
	local ColAlignXCenterAlignYCenterGapMediumSizeFull0AutoY: string = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "col align-x-center align-y-center gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-center"
	local CreateElementFunction3 = ReactModule.createElement
	local Root = Sheet.Root
	local config1 = {
		preferCenterSheet = true,
		onClose = p1.buttons.cancelPurchaseActivated,
		snapPoints = { UseScaledValueResult, 0.8 },
		centerSheetHeight = if FFlagFixUpsellModalUnevenLayoutModule then nil elseif FFlagIAPExperienceEnableMultiDisplayUpsellModule then UseScaledValueResult else nil,
		ref = if UseInitialButtonDisableDelayModuleResult then nil else UseFocusNavigationRefsModuleResult
	}
	local config2 = {
		Header = ReactModule.createElement(Sheet.Header, {
			hasCloseAffordance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.hideUserRobuxBalance then true else nil
		}, {
			ModalHeader = ReactModule.createElement(UnifiedPurchaseModalHeaderModule, {
				titleText = UseStateResult1,
				robuxBalanceAmount = p1.userBalance,
				hideUserRobuxBalance = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then p1.hideUserRobuxBalance else nil
			})
		})
	}
	local CreateElementFunction2 = ReactModule.createElement
	local Content = Sheet.Content
	local config3 = { LayoutOrder = 2 }
	local t = {}
	local CreateElementFunction1 = ReactModule.createElement
	local config4 = {
		tag = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "col align-x-center align-y-start gap-medium size-full-0 auto-y" else "col gap-medium auto-y size-full-0 align-x-center align-y-start"
	}
	local config5 = {
		ProductDetailsContainer = if Element then Element else ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = ColAlignXCenterAlignYCenterGapMediumSizeFull0AutoY
		}, {
			ProductDetails = if p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then ReactModule.createElement(PriceSummaryModule, { amount = p1.product.itemRobuxCost }) else ReactModule.createElement(UnifiedProductDetailsModule, {
				isPortrait = false,
				isCompact = IsYBelow,
				itemIcon = UseMemoResult.itemIcon,
				itemName = UseMemoResult.itemName,
				itemRobuxCost = UseMemoResult.itemRobuxCost,
				model = UseMemoResult.model,
				priceSuffix = PerMonth,
				includePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase then p1.isMonthlyPrice else nil
			})
		}),
		CartPricingLoading = ReactModule.createElement(CartPricingLoadingModule, { LayoutOrder = 1, isLoading = p1.isCartPricingLoading }),
		PostPurchaseActions = if next(CartPricingOfferCheckboxesModule) then ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, CartPricingOfferCheckboxesModule) else nil
	}
	local CreateElementFunction = ReactModule.createElement
	local config6 = {
		LayoutOrder = 2,
		tag = if FFlagIAPExperienceEnableMultiDisplayUpsellModule then "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" else "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
	}
	local config7 = nil
	
	if FFlagIAPExperienceEnableMultiDisplayUpsellModule then
		local Elements = {}
		
		for LayoutOrder, upsellSuggestion in ipairs(p1.upsellSuggestions) do
			Elements["UpsellPackage" .. tostring(LayoutOrder)] = ReactModule.createElement(UpsellProductDetails, {
				layoutOrder = LayoutOrder,
				product = upsellSuggestion,
				selected = p1.selectedUpsellIndex == LayoutOrder,
				isCompact = IsYBelow,
				onSelected = function()
					-- upvalues: LayoutOrder (copy), p1 (copy)
					p1.onUpsellSuggestionsSelected(LayoutOrder)
				end,
				badgeType = upsellSuggestion.badgeType
			})
		end
		config7 = Elements
	else
		config7 = {
			UpsellPackage1 = ReactModule.createElement(UpsellProductDetails, {
				layoutOrder = 1,
				product = p1.upsellSuggestions[1],
				selected = p1.selectedUpsellIndex == 1,
				isCompact = IsYBelow,
				onSelected = function()
					-- upvalues: p1 (copy)
					p1.onUpsellSuggestionsSelected(1)
				end
			}),
			UpsellPackage2 = if #p1.upsellSuggestions > 1 then ReactModule.createElement(UpsellProductDetails, {
				layoutOrder = 2,
				product = p1.upsellSuggestions[2],
				selected = p1.selectedUpsellIndex == 2,
				isCompact = IsYBelow,
				onSelected = function()
					-- upvalues: p1 (copy)
					p1.onUpsellSuggestionsSelected(2)
				end,
				badgeType = p1.upsellSuggestions[2].badgeType
			}) else nil
		}
	end
	config5.UpsellSuggestions = CreateElementFunction(View, config6, config7)
	t.SheetContentContainer = CreateElementFunction1(View, config4, config5)
	config2.Content = CreateElementFunction2(Content, config3, t)
	config2.Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
		ReactModule.createElement(View, { LayoutOrder = 1, tag = ColGapSmallSizeFull0AutoY }, {
			BuyAndPlusRow = if OnActivated then ReactModule.createElement(ButtonGroup, {
				LayoutOrder = 1,
				orientation = Orientation.Vertical,
				size = Small,
				buttons = {
					{
						text = config.text,
						onActivated = config.onActivated,
						inputDelay = config.inputDelay,
						isDisabled = config.isDisabled,
						ref = config.ref,
						variant = config.variant
					},
					{
						text = UseLocalizationResult.GetTenPercentOff,
						onActivated = OnActivated,
						isDisabled = UseInitialButtonDisableDelayModuleResult,
						variant = ButtonVariant.Standard,
						icon = Enums.IconName.RobloxPlus
					}
				}
			}) else ReactModule.createElement(FoundationModule.Button, config),
			DisclosureTerms = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = RowWrapAlignXLeftAlignYCenterGapXxsmallSizeFull0AutoY
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
					onActivated = p1.termsOfUseActivated
				}),
				AfterText = ReactModule.createElement(Text, {
					LayoutOrder = 4,
					tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small",
					Text = Parts[2]
				})
			})
		})
	})
	
	return CreateElementFunction3(Root, config1, config2)
end

return function(p2)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedRobuxUpsellModal (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModal = ReactModule.createElement(UnifiedRobuxUpsellModal, p2)
	})
end