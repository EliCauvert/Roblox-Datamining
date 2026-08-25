local parent = script.Parent.Parent
local parent_1 = parent.Parent
local formatNumberModule = require(parent.Utility.formatNumber)
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local image = foundationModule.Image
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local virtualItemBadgeTypeModule = require(parent.Enums.VirtualItemBadgeType)
local modelViewportModule = require(parent.Generic.ModelViewport)
local yellowBadgeModule = require(parent.Generic.YellowBadge)
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local useRobuxTextModule = require(parent.Generic.Hooks.useRobuxText)
local fFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local fFlagUnifiedPurchaseAddSkeleton = require(parent.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent.Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local getFFlagDiscountInfoForSubscriptionPurchaseModalLua = require(parent.Parent.SharedFlags).GetFFlagDiscountInfoForSubscriptionPurchaseModalLua
local default = require(parent_1.LoggingProtocol).default
local virtualItemBadgeShownCounter = require(parent.Generic.Events.VirtualItemBadgeCounter).VirtualItemBadgeShownCounter

local function _(a)
	return if #a > 50 then a:sub(1, 50) .. "..." else a
end

local _ = require(parent.ProductPurchase.PricingTypes)

return function(p0)
	-- upvalues: getFFlagDiscountInfoForSubscriptionPurchaseModalLua (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), useLocalization (ref), useTokens (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), useRobuxTextModule (ref), reactModule (ref), modelViewportModule (ref), fFlagUnifiedPurchaseAddSkeleton (ref), skeleton (ref), radius (ref), image (ref), virtualItemBadgeTypeModule (ref), yellowBadgeModule (ref), default (ref), virtualItemBadgeShownCounter (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref)
	local var8 = getFFlagDiscountInfoForSubscriptionPurchaseModalLua()
	local var9 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then p0.itemPrice else nil
	local var10 = if var9 then var9.priceInRobux else p0.itemRobuxCost
	local var11 = useLocalization({ Popular = "IAPExperience.RobuxUpsell.Text.PopularItem" })
	local priceSuffix = p0.priceSuffix
	local var12 = useTokens()
	local var13 = if p0.isPortrait then 128 else 72
	local var14 = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then useRobuxTextModule(var10) else nil
	local var15 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then useRobuxTextModule(if var9 then var9.basePriceInRobux else p0.itemRobuxCost) else nil
	local var16 = var9 and var9.priceInRobux < var9.basePriceInRobux
	
	if p0.isCompact then
		var13 *= 0.7
	end
	local createElement_2
	local var17 = if p0.model ~= nil then if fFlagUnifiedPurchaseAddSkeleton and p0.itemIcon == nil and p0.isLoading then reactModule.createElement(skeleton, {
		LayoutOrder = 1,
		Size = UDim2.fromOffset(var13, var13),
		radius = radius.Circle
	}) else reactModule.createElement(image, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, var13, 0, var13),
		ScaleType = Enum.ScaleType.Stretch,
		Image = if p0.itemIcon then p0.itemIcon else "icons/status/imageunavailable",
		imageStyle = {
			Transparency = if p0.itemIcon then nil else var12.Color.Content.Default.Transparency
		}
	}) else reactModule.createElement(modelViewportModule, {
		model = p0.model,
		Position = UDim2.fromOffset(5, 5),
		Size = UDim2.fromOffset(var13, var13)
	})
	local var18 = if p0.badgeType and p0.badgeType == virtualItemBadgeTypeModule.Popular then reactModule.createElement(yellowBadgeModule, {
		LayoutOrder = 3,
		Icon = "icons/menu/fire_fill",
		Text = var11.Popular
	}) else nil
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), default (copy), virtualItemBadgeShownCounter (copy), p0 (ref)
		if var18 then
			default:logRobloxTelemetryCounter(virtualItemBadgeShownCounter, 1, { badgeType = p0.badgeType })
			
			return
		end
	end, {})
	local var19 = if p0.isCompact then "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
	local var20 = if p0.isCompact then "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
	local createElement = reactModule.createElement
	local t = {
		tag = "auto-y row gap-small align-y-center align-x-left",
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = { ItemIcon = var17 }
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 2,
		tag = "col auto-y gap-small",
		Size = UDim2.new(1, (-var13) - 6, 0, 0)
	}
	local t_3 = {}
	
	if fFlagUnifiedPurchaseAddSkeleton and p0.isLoading and p0.itemName == nil then
		createElement_2 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			tag = "position-bottom-center",
			Size = UDim2.fromScale(1, 0.3),
			radius = radius.Circle
		})
	else
		createElement_2 = reactModule.createElement
		local var25 = text
		local t_4 = { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 0) }
		local itemName = p0.itemName
		t_4.Text = if #itemName > 50 then itemName:sub(1, 50) .. "..." else itemName
		t_4.tag = var19
		createElement_2 = createElement_2(var25, t_4)
	end
	local createElement_3
	t_3.ItemName = createElement_2
	t_3.ItemSubtitle = p0.subtitleView
	
	if fFlagUnifiedPurchaseAddSkeleton and p0.isLoading and var10 == nil then
		createElement_3 = reactModule.createElement(skeleton, {
			LayoutOrder = if p0.subtitleView then 3 else 2,
			Size = UDim2.fromScale(0.4, 0.3),
			radius = radius.Circle
		})
	else
		local var30
		createElement_3 = reactModule.createElement
		local var27 = view
		local t_4 = {
			LayoutOrder = if p0.subtitleView then 3 else 2,
			tag = if p0.isPortrait then "auto-xy col gap-small align-y-center" elseif var8 and var16 then "row align-y-center gap-small auto-xy clip" else "auto-xy row gap-small align-y-center"
		}
		local t_5 = {}
		
		if var10 then
			if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var30 = reactModule.createElement
				var30 = var30(text, {
					LayoutOrder = 1,
					RichText = true,
					Text = var14 .. (if priceSuffix and priceSuffix ~= "" then "" .. priceSuffix else ""),
					tag = var20
				})
			else
				var30 = reactModule.createElement
				var30 = var30(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis",
					Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, var10) .. (if priceSuffix and priceSuffix ~= "" then "" .. priceSuffix else "")
				})
			end
		elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.itemDisplayPrice then
			var30 = reactModule.createElement
			var30 = var30(text, {
				LayoutOrder = 1,
				Text = p0.itemDisplayPrice .. (if priceSuffix and priceSuffix ~= "" then "" .. priceSuffix else ""),
				tag = var20
			})
		else
			var30 = nil
		end
		local var31
		t_5.ItemCost = var30
		
		if var16 and var15 then
			var31 = reactModule.createElement
			var31 = var31(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-align-x-left text-wrap text-body-small content-default",
				RichText = true,
				Text = "<s>" .. var15 .. (if var8 and priceSuffix and priceSuffix ~= "" then priceSuffix else "") .. "</s>"
			})
		else
			var31 = nil
		end
		t_5.OriginalPrice = var31
		t_5.ItemBadge = var18
		createElement_3 = createElement_3(var27, t_4, t_5)
	end
	t_3.ItemDetails = createElement_3
	t_1.ItemDetailsFrame = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end