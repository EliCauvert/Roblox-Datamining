local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SharedFlagsModule = require(Parent1.SharedFlags)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Checkbox = FoundationModule.Checkbox
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
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
local ProductDetailsContainerModule = require(Parent.Generic.ProductDetailsContainer)
local CartPricingLoadingModule = require(Parent.ProductPurchase.v4.CartPricingLoading)
local BuildCartPricingOfferCheckboxesModule = require(Parent.ProductPurchase.v4.buildCartPricingOfferCheckboxes)
local UseCartPricingModule = require(Parent.ProductPurchase.v4.useCartPricing)
local UseFocusNavigationRefsModule = require(Parent.Generic.Hooks.useFocusNavigationRefs)
local UnifiedPurchaseModalTypeEnumModule = require(Parent.Enums.UnifiedPurchaseModalTypeEnum)
local _ = require(Parent.ProductPurchase.v4.cartPricingResponseLineItem)
local FormatNumberModule = require(Parent.Utility.formatNumber)
local GetUpsellBadgeInfoModule = require(Parent.Utility.getUpsellBadgeInfo)
local FFlagAXMISWithBlackbird = SharedFlagsModule.FFlagAXMISWithBlackbird
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddCompactUnifiedUpsellModalModeModule = require(Parent.Flags.FFlagAddCompactUnifiedUpsellModalMode)
local CompactUpsellModalBreakpoint = game:DefineFastInt("CompactUpsellModalBreakpoint", 400)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagPurchasePromptFetchCartPricing = SharedFlagsModule.FFlagPurchasePromptFetchCartPricing
local FFlagShouldApplyDevSubsUpsellFixModule = require(Parent.Flags.FFlagShouldApplyDevSubsUpsellFix)
local FFlagShouldFixDevSubsFlashingTitleModule = require(Parent.Flags.FFlagShouldFixDevSubsFlashingTitle)
local GetFFlagIAPExperienceEnableMultiDisplayUpsellModule = require(Parent.Flags.GetFFlagIAPExperienceEnableMultiDisplayUpsell)
local GetFFlagIAPExperienceUseUpsellBadgeHelperModule = require(Parent.Flags.GetFFlagIAPExperienceUseUpsellBadgeHelper)
local _ = require(Parent.Api.PaymentsGateway.GetUpsellSuggestionsTypes)
local BadgeTypeModule = require(Parent.Enums.BadgeType)
local _ = require(Parent.Enums.VirtualItemBadgeType)
local _ = require(Parent.ProductPurchase.v3.UnifiedProductPurchaseModalTypes)

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
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"
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
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			Badge = if Popular then ReactModule.createElement(YellowBadgeModule, { LayoutOrder = 1, Text = Popular, Icon = FireFill }) else nil,
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = p1.product.price or "",
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetailsMultiDisplayImpl(p1, p2)
	-- upvalues: GetFFlagIAPExperienceUseUpsellBadgeHelperModule (copy), GetUpsellBadgeInfoModule (copy), BadgeTypeModule (copy), Enums (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), ReactModule (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), FormatNumberModule (copy), LocalizationService (copy), GrayBadgeModule (copy)
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
			tag = "row gap-small align-y-center align-x-start",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxAmount = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				RichText = true,
				Text = GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.product.robuxAmount),
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-left" else "auto-xy text-title-large content-emphasis text-align-x-left"
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
			tag = "row align-y-center align-x-right gap-large",
			Size = UDim2.new(0.5, 0, 1, 0)
		}, {
			RobuxPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = p1.product.price or "",
				tag = if FFlagAddCompactUnifiedUpsellModalModeModule and p1.isCompact then "auto-xy text-title-small content-emphasis text-align-x-right" else "auto-xy text-title-large content-emphasis text-align-x-right"
			})
		})
	})
end

local function UpsellProductDetails(p1)
	-- upvalues: UseLocalizationFunction (copy), GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), UpsellProductDetailsMultiDisplayImpl (copy), UpsellProductDetailsLegacyImpl (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		Popular = "IAPExperience.RobuxUpsell.Text.PopularItem",
		LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased",
		ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou",
		BetterValue = "IAPExperience.RobuxUpsell.Text.BetterValue",
		BestValue = "IAPExperience.RobuxUpsell.Text.BestValue"
	})
	
	return if GetFFlagIAPExperienceEnableMultiDisplayUpsellModule() then UpsellProductDetailsMultiDisplayImpl(p1, UseLocalizationResult) else UpsellProductDetailsLegacyImpl(p1, UseLocalizationResult)
end

local function UnifiedRobuxUpsellModalV2(p1)
	-- upvalues: FFlagPurchasePromptFetchCartPricing (copy), UseCartPricingModule (copy), ReactModule (copy), UseLocalizationFunction (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), FFlagAXMISWithBlackbird (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), FFlagAddCompactUnifiedUpsellModalModeModule (copy), UnifiedPurchaseModalTypeEnumModule (copy), CompactUpsellModalBreakpoint (copy), FFlagShouldFixDevSubsFlashingTitleModule (copy), UseFocusNavigationRefsModule (copy), BuildCartPricingOfferCheckboxesModule (copy), Checkbox (copy), View (copy), FFlagShouldApplyDevSubsUpsellFixModule (copy), Image (copy), Text (copy), ProductDetailsContainerModule (copy), Dialog (copy), DialogSize (copy), PriceSummaryModule (copy), UnifiedProductDetailsModule (copy), CartPricingLoadingModule (copy), GetFFlagIAPExperienceEnableMultiDisplayUpsellModule (copy), UpsellProductDetails (copy), Orientation (copy), ButtonVariant (copy)
	local CartPricing = nil
	local v1 = nil
	local v2 = nil
	local UseResult = nil
	local UseMemoResult = nil
	
	if FFlagPurchasePromptFetchCartPricing then
		CartPricing = UseCartPricingModule({
			product = p1.product,
			purchaseModalType = p1.purchaseModalType,
			cartPricingResponse = p1.cartPricingResponse,
			onCartOfferAppliedChanged = p1.onCartOfferAppliedChanged
		})
		v1, v61 = ReactModule.useState(p1.postPurchaseActions or {})
		UseResult = ReactModule.useCallback(function()
			-- upvalues: v1 (ref), p1 (copy)
			if v1 and p1.setPostPurchaseActions then
				p1.setPostPurchaseActions(v1)
			end
			p1.buttons.buyItemActivated()
		end, {
			p1.buttons.buyItemActivated,
			p1.setPostPurchaseActions,
			v1
		})
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: CartPricing (ref), p1 (copy)
			return if CartPricing.showCartOfferUi then CartPricing.mergedProductForDetails else p1.product
		end, {
			p1.product,
			CartPricing.showCartOfferUi,
			CartPricing.mergedProductForDetails
		})
	end
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
	local IsYBelow = if FFlagAddCompactUnifiedUpsellModalModeModule then if FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then p1.screenSize.Y > 0 and p1.screenSize.Y < CompactUpsellModalBreakpoint else p1.screenSize.Y < CompactUpsellModalBreakpoint else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseLocalizationResult.BuyRobuxAndItem)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), UnifiedPurchaseModalTypeEnumModule (upval), UseLocalizationResult (copy), FFlagShouldFixDevSubsFlashingTitleModule (upval), UseStateResult2 (copy), FFlagAXMISWithBlackbird (upval), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (upval)
		local PurchaseModalType = p1.purchaseModalType
		
		if FFlagEnableUnifiedPurchaseFlowForDevSubs and PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.DeveloperSubscription then
			UseStateResult2(if FFlagShouldFixDevSubsFlashingTitleModule and UseLocalizationResult.BuyRobuxAndSubscription and UseLocalizationResult.BuyRobuxAndSubscription ~= "" then UseLocalizationResult.BuyRobuxAndSubscription else UseLocalizationResult.BuyRobuxAndItem)
			
			return
		end
		if PurchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then
			if FFlagAXMISWithBlackbird then
				if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements and p1.product.itemName ~= "RobuxUpsell" then
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
	local PerMonth = if IsPurchaseModalTypeMatch then UseLocalizationResult.PerMonth else nil
	local Subscribe = if IsPurchaseModalTypeMatch then UseLocalizationResult.Subscribe else UseLocalizationResult.Buy
	local IsBuyItemDisabled: boolean? = nil
	local Tbl = {}
	
	if FFlagPurchasePromptFetchCartPricing then
		IsBuyItemDisabled = p1.buttons.buyItemDisabled == true or p1.isCartPricingLoading == true
		Tbl = BuildCartPricingOfferCheckboxesModule({
			cartPricing = CartPricing,
			isDisabled = IsBuyItemDisabled
		})
	end
	local CountCartPricingOffers: number = if FFlagPurchasePromptFetchCartPricing and CartPricing.showCartOfferUi then #CartPricing.cartPricingOffers else 0
	local Element = nil
	
	if FFlagPurchasePromptFetchCartPricing then
		local Copy = table.clone(Tbl)
		
		for i, value in pairs((ReactModule.useMemo(function()
			-- upvalues: v1 (ref), ReactModule (upval), Checkbox (upval), CountCartPricingOffers (ref), IsBuyItemDisabled (ref), v2 (ref)
			local Elements = {}
			
			for i, value in v1 do
				Elements[value.actionKey] = ReactModule.createElement(Checkbox, {
					size = "XSmall",
					LayoutOrder = CountCartPricingOffers + i,
					label = value.label,
					isChecked = value.isActionSelected,
					isDisabled = IsBuyItemDisabled,
					onActivated = function()
						-- upvalues: v2 (upval), i (copy), value (copy)
						v2(function(Tbl)
							-- upvalues: i (upval), value (upval)
							local Copy = table.clone(Tbl)
							Copy[i] = {
								label = value.label,
								isActionSelected = not value.isActionSelected,
								actionKey = value.actionKey
							}
							
							return Copy
						end)
					end
				})
			end
			return Elements
		end, { v1, IsBuyItemDisabled, CountCartPricingOffers }))) do
			Copy[i] = value
		end
		Element = if next(Copy) then ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y",
			LayoutOrder = 3
		}, Copy) else nil
	end
	local Element1 = if IsPurchaseModalTypeMatch and FFlagShouldApplyDevSubsUpsellFixModule then ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = "row align-y-center gap-medium size-full-0 auto-y"
	}, {
		ItemIcon = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(72, 72),
			ScaleType = Enum.ScaleType.Fit,
			Image = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemIcon else p1.product.itemIcon
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
				Text = (if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemName else p1.product.itemName) or ""
			}),
			ItemPrice = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-y text-title-medium text-align-x-left content-emphasis",
				RichText = true,
				Size = UDim2.new(1, 0, 0, 0),
				Text = utf8.char(57346) .. " " .. tostring((if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemRobuxCost else p1.product.itemRobuxCost) or 0) .. (PerMonth or "")
			})
		})
	}) else ReactModule.createElement(ProductDetailsContainerModule, {
		purchaseModalType = p1.purchaseModalType,
		product = if FFlagPurchasePromptFetchCartPricing then UseMemoResult else p1.product,
		isCompact = IsYBelow,
		model = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.model else p1.product.model,
		priceSuffix = PerMonth,
		hideProductDetails = if FFlagPurchasePromptFetchCartPricing then p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem else nil,
		hideDiscountSummary = if FFlagPurchasePromptFetchCartPricing then p1.isCartPricingLoading else nil,
		savingsSummary = if FFlagPurchasePromptFetchCartPricing then CartPricing.cartPricingSavingsSummary else nil
	})
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		size = DialogSize.Medium,
		onClose = p1.buttons.cancelPurchaseActivated,
		ref = UseFocusNavigationRefsModuleResult
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseStateResult }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			ContentView = ReactModule.createElement(View, {
				tag = {
					["col align-x-center align-y-top gap-medium size-full-0 auto-y"] = FFlagPurchasePromptFetchCartPricing,
					["col gap-medium auto-y size-full-0 align-x-center align-y-start"] = not FFlagPurchasePromptFetchCartPricing
				}
			}, {
				ProductDetailsContainer = if Element1 then Element1 else ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = {
						["col align-x-center align-y-center gap-medium size-full-0"] = FFlagPurchasePromptFetchCartPricing,
						["col gap-medium size-full-0 align-x-center align-y-center"] = not FFlagPurchasePromptFetchCartPricing
					}
				}, {
					ProductDetails = if p1.purchaseModalType == UnifiedPurchaseModalTypeEnumModule.MultiItem then ReactModule.createElement(PriceSummaryModule, {
						amount = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemRobuxCost else p1.product.itemRobuxCost,
						itemPrice = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemPrice else nil
					}) else ReactModule.createElement(UnifiedProductDetailsModule, {
						isPortrait = false,
						isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
						itemIcon = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemIcon else p1.product.itemIcon,
						itemName = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemName else p1.product.itemName,
						itemRobuxCost = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemRobuxCost else p1.product.itemRobuxCost,
						itemPrice = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.itemPrice else nil,
						model = if FFlagPurchasePromptFetchCartPricing then UseMemoResult.model else p1.product.model,
						priceSuffix = PerMonth
					})
				}),
				CartPricingLoading = if FFlagPurchasePromptFetchCartPricing then ReactModule.createElement(CartPricingLoadingModule, { isLoading = p1.isCartPricingLoading }) else nil,
				PostPurchaseActions = if FFlagPurchasePromptFetchCartPricing then Element else nil,
				UpsellSuggestions = ReactModule.createElement(View, {
					LayoutOrder = if FFlagPurchasePromptFetchCartPricing then 3 else 2,
					tag = {
						["col align-x-center align-y-center gap-medium size-full-0 auto-y padding-x-xsmall padding-bottom-xxlarge padding-top-small"] = FFlagPurchasePromptFetchCartPricing,
						["col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"] = not FFlagPurchasePromptFetchCartPricing
					}
				}, if GetFFlagIAPExperienceEnableMultiDisplayUpsellModule() then (function()
					-- upvalues: p1 (copy), ReactModule (upval), UpsellProductDetails (upval), FFlagAddCompactUnifiedUpsellModalModeModule (upval), IsYBelow (ref)
					local Elements = {}
					
					for LayoutOrder, upsellSuggestion in ipairs(p1.upsellSuggestions) do
						Elements["UpsellPackage" .. tostring(LayoutOrder)] = ReactModule.createElement(UpsellProductDetails, {
							layoutOrder = LayoutOrder,
							product = upsellSuggestion,
							selected = p1.selectedUpsellIndex == LayoutOrder,
							isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
							onSelected = function()
								-- upvalues: LayoutOrder (copy), p1 (upval)
								p1.onUpsellSuggestionsSelected(LayoutOrder)
							end,
							badgeType = upsellSuggestion.badgeType
						})
					end
					return Elements
				end)() else {
					UpsellPackage1 = ReactModule.createElement(UpsellProductDetails, {
						layoutOrder = 1,
						product = p1.upsellSuggestions[1],
						selected = p1.selectedUpsellIndex == 1,
						isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
						onSelected = function()
							-- upvalues: p1 (copy)
							p1.onUpsellSuggestionsSelected(1)
						end
					}),
					UpsellPackage2 = if #p1.upsellSuggestions > 1 then ReactModule.createElement(UpsellProductDetails, {
						layoutOrder = 2,
						product = p1.upsellSuggestions[2],
						selected = p1.selectedUpsellIndex == 2,
						isCompact = if FFlagAddCompactUnifiedUpsellModalModeModule then IsYBelow else nil,
						onSelected = function()
							-- upvalues: p1 (copy)
							p1.onUpsellSuggestionsSelected(2)
						end,
						badgeType = p1.upsellSuggestions[2].badgeType
					}) else nil
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 4,
			orientation = Orientation.Horizontal,
			actions = {
				{
					text = Subscribe,
					variant = ButtonVariant.Emphasis,
					onActivated = if FFlagPurchasePromptFetchCartPricing then UseResult else p1.buttons.buyItemActivated,
					isDisabled = if FFlagPurchasePromptFetchCartPricing then IsBuyItemDisabled else p1.buttons.buyItemDisabled,
					ref = UseFocusNavigationRefsModuleResult2,
					inputDelay = if FFlagPurchasePromptFetchCartPricing then if p1.buttons.buyItemEnableInputDelayed and not IsBuyItemDisabled then 2.5 else 0 elseif p1.buttons.buyItemEnableInputDelayed and not p1.buttons.buyItemDisabled then 2.5 else 0
				}
			}
		}),
		DisclosureTerms = ReactModule.createElement(View, {
			LayoutOrder = 5,
			tag = {
				["row wrap align-x-center align-y-center gap-xxsmall size-full-0 auto-y"] = FFlagPurchasePromptFetchCartPricing,
				["row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"] = not FFlagPurchasePromptFetchCartPricing
			}
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
end

return function(p2)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), UnifiedRobuxUpsellModalV2 (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		UnifiedRobuxUpsellModalV2 = ReactModule.createElement(UnifiedRobuxUpsellModalV2, p2)
	})
end