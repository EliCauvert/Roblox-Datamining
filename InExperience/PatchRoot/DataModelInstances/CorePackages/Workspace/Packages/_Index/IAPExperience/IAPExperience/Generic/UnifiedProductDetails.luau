local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FormatNumberModule = require(Parent.Utility.formatNumber)
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local VirtualItemBadgeTypeModule = require(Parent.Enums.VirtualItemBadgeType)
local ModelViewportModule = require(Parent.Generic.ModelViewport)
local YellowBadgeModule = require(Parent.Generic.YellowBadge)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseRobuxTextModule = require(Parent.Generic.Hooks.useRobuxText)
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagUnifiedPurchaseAddSkeleton = require(Parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction = require(Parent.Parent.SharedFlags).GetFFlagDiscountInfoForSubscriptionPurchaseModalLua
local FFlagLuaAppsEnablePromptVIPServerPurchase = require(Parent.Parent.SharedFlags).FFlagLuaAppsEnablePromptVIPServerPurchase
local Default = require(Parent1.LoggingProtocol).default
local VirtualItemBadgeShownCounter = require(Parent.Generic.Events.VirtualItemBadgeCounter).VirtualItemBadgeShownCounter

local function _(Text: string): string
	return if #Text > 50 then Text:sub(1, 50) .. "..." else Text
end

local _ = require(Parent.ProductPurchase.PricingTypes)

return function(p1)
	-- upvalues: GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), UseRobuxTextModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), ReactModule (copy), ModelViewportModule (copy), FFlagUnifiedPurchaseAddSkeleton (copy), Skeleton (copy), Radius (copy), Image (copy), VirtualItemBadgeTypeModule (copy), YellowBadgeModule (copy), Default (copy), VirtualItemBadgeShownCounter (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy)
	local FFlagDiscountInfoForSubscriptionPurchaseModalLua = GetFFlagDiscountInfoForSubscriptionPurchaseModalLuaFunction()
	local ItemPrice = p1.itemPrice
	local PriceInRobux = if ItemPrice then ItemPrice.priceInRobux else p1.itemRobuxCost
	local UseLocalizationResult = UseLocalizationFunction({ Popular = "IAPExperience.RobuxUpsell.Text.PopularItem" })
	local PriceSuffix = p1.priceSuffix
	local UseTokensResult = UseTokensFunction()
	local XOffset: number = if p1.isPortrait then 128 else 72
	local UseRobuxTextModuleResult = if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then UseRobuxTextModule(PriceInRobux) else nil
	local UseRobuxTextModuleResult1 = UseRobuxTextModule(if ItemPrice then ItemPrice.basePriceInRobux else p1.itemRobuxCost)
	local IsBasePriceInRobuxAbove: boolean = ItemPrice and ItemPrice.basePriceInRobux > ItemPrice.priceInRobux
	local IncludePriceSuffixOnOriginal = if FFlagLuaAppsEnablePromptVIPServerPurchase and p1.includePriceSuffixOnOriginal ~= nil then p1.includePriceSuffixOnOriginal else FFlagDiscountInfoForSubscriptionPurchaseModalLua
	
	if p1.isCompact then
		XOffset *= 0.7
	end
	local Element = if p1.model == nil then if FFlagUnifiedPurchaseAddSkeleton and p1.itemIcon == nil and p1.isLoading then ReactModule.createElement(Skeleton, {
		LayoutOrder = 1,
		Size = UDim2.fromOffset(XOffset, XOffset),
		radius = Radius.Circle
	}) else ReactModule.createElement(Image, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, XOffset, 0, XOffset),
		ScaleType = Enum.ScaleType.Stretch,
		Image = if p1.itemIcon then p1.itemIcon else "icons/status/imageunavailable",
		imageStyle = {
			Transparency = if p1.itemIcon then nil else UseTokensResult.Color.Content.Default.Transparency
		}
	}) else ReactModule.createElement(ModelViewportModule, {
		model = p1.model,
		Position = UDim2.fromOffset(5, 5),
		Size = UDim2.fromOffset(XOffset, XOffset)
	})
	local Element1 = if p1.badgeType and p1.badgeType == VirtualItemBadgeTypeModule.Popular then ReactModule.createElement(YellowBadgeModule, {
		LayoutOrder = 3,
		Icon = "icons/menu/fire_fill",
		Text = UseLocalizationResult.Popular
	}) else nil
	ReactModule.useEffect(function()
		-- upvalues: Element1 (copy), Default (upval), VirtualItemBadgeShownCounter (upval), p1 (copy)
		if Element1 then
			Default:logRobloxTelemetryCounter(VirtualItemBadgeShownCounter, 1, { badgeType = p1.badgeType })
			
			return
		end
	end, {})
	local AutoXyTextAlignXLeftTextWrapTextTitleSmallContentEmphasis: string = if p1.isCompact then "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
	local AutoXyTextAlignXLeftTextWrapTextTitleSmallContentEmphasis1: string = if p1.isCompact then "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
	local CreateElementFunction1 = ReactModule.createElement
	local config = {
		tag = "auto-y row gap-small align-y-center align-x-left",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local config1 = { ItemIcon = Element }
	local CreateElementFunction = ReactModule.createElement
	local config2 = {
		LayoutOrder = 2,
		tag = "col auto-y gap-small",
		Size = UDim2.new(1, -XOffset - 6, 0, 0)
	}
	local t = {}
	local Element2 = nil
	
	if FFlagUnifiedPurchaseAddSkeleton and p1.isLoading and p1.itemName == nil then
		Element2 = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			tag = "position-bottom-center",
			Size = UDim2.fromScale(1, 0.3),
			radius = Radius.Circle
		})
	else
		local ItemName: string = p1.itemName
		Element2 = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 0),
			Text = if #ItemName > 50 then ItemName:sub(1, 50) .. "..." else ItemName,
			tag = AutoXyTextAlignXLeftTextWrapTextTitleSmallContentEmphasis
		})
	end
	t.ItemName = Element2
	t.ItemSubtitle = p1.subtitleView
	t.ItemDetails = if FFlagUnifiedPurchaseAddSkeleton and p1.isLoading and PriceInRobux == nil then ReactModule.createElement(Skeleton, {
		LayoutOrder = if p1.subtitleView then 3 else 2,
		Size = UDim2.fromScale(0.4, 0.3),
		radius = Radius.Circle
	}) else ReactModule.createElement(View, {
		LayoutOrder = if p1.subtitleView then 3 else 2,
		tag = if p1.isPortrait then "auto-xy col gap-small align-y-center" elseif FFlagDiscountInfoForSubscriptionPurchaseModalLua and IsBasePriceInRobuxAbove then "row align-y-center gap-small auto-xy clip" else "auto-xy row gap-small align-y-center"
	}, {
		ItemCost = if FFlagLuaAppsEnablePromptVIPServerPurchase and p1.priceText then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			RichText = true,
			Text = p1.priceText,
			tag = AutoXyTextAlignXLeftTextWrapTextTitleSmallContentEmphasis1
		}) elseif PriceInRobux then if FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			RichText = true,
			Text = UseRobuxTextModuleResult .. (if PriceSuffix and PriceSuffix ~= "" then "" .. PriceSuffix else ""),
			tag = AutoXyTextAlignXLeftTextWrapTextTitleSmallContentEmphasis1
		}) else ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis",
			Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, PriceInRobux) .. (if PriceSuffix and PriceSuffix ~= "" then "" .. PriceSuffix else "")
		}) elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.itemDisplayPrice then ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = p1.itemDisplayPrice .. (if PriceSuffix and PriceSuffix ~= "" then "" .. PriceSuffix else ""),
			tag = AutoXyTextAlignXLeftTextWrapTextTitleSmallContentEmphasis1
		}) else nil,
		OriginalPrice = if IsBasePriceInRobuxAbove and UseRobuxTextModuleResult1 then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-align-x-left text-wrap text-body-small content-default",
			RichText = true,
			Text = "<s>" .. UseRobuxTextModuleResult1 .. (if IncludePriceSuffixOnOriginal and PriceSuffix and PriceSuffix ~= "" then PriceSuffix else "") .. "</s>"
		}) else nil,
		ItemBadge = Element1
	})
	config1.ItemDetailsFrame = CreateElementFunction(View, config2, t)
	
	return CreateElementFunction1(View, config, config1)
end