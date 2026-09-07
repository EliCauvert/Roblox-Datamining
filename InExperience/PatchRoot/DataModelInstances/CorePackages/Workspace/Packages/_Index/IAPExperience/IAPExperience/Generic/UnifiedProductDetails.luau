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

return function(p1)
	-- upvalues: getFFlagDiscountInfoForSubscriptionPurchaseModalLua (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), useLocalization (ref), useTokens (ref), fFlagUnifiedPurchaseFlowMarketplaceUIImprovements (ref), useRobuxTextModule (ref), reactModule (ref), modelViewportModule (ref), fFlagUnifiedPurchaseAddSkeleton (ref), skeleton (ref), radius (ref), image (ref), virtualItemBadgeTypeModule (ref), yellowBadgeModule (ref), default (ref), virtualItemBadgeShownCounter (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref)
	local var1 = getFFlagDiscountInfoForSubscriptionPurchaseModalLua()
	local var2 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then p1.itemPrice else nil
	local var3 = if var2 then var2.priceInRobux else p1.itemRobuxCost
	local var4 = useLocalization({ Popular = "IAPExperience.RobuxUpsell.Text.PopularItem" })
	local priceSuffix = p1.priceSuffix
	local var5 = useTokens()
	local var6 = if p1.isPortrait then 128 else 72
	local var7 = if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then useRobuxTextModule(var3) else nil
	local var8 = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then useRobuxTextModule(if var2 then var2.basePriceInRobux else p1.itemRobuxCost) else nil
	local var9 = var2 and var2.priceInRobux < var2.basePriceInRobux
	
	if p1.isCompact then
		var6 *= 0.7
	end
	local createElement_2
	local var10 = if p1.model ~= nil then if fFlagUnifiedPurchaseAddSkeleton and p1.itemIcon == nil and p1.isLoading then reactModule.createElement(skeleton, {
		LayoutOrder = 1,
		Size = UDim2.fromOffset(var6, var6),
		radius = radius.Circle
	}) else reactModule.createElement(image, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, var6, 0, var6),
		ScaleType = Enum.ScaleType.Stretch,
		Image = if p1.itemIcon then p1.itemIcon else "icons/status/imageunavailable",
		imageStyle = {
			Transparency = if p1.itemIcon then nil else var5.Color.Content.Default.Transparency
		}
	}) else reactModule.createElement(modelViewportModule, {
		model = p1.model,
		Position = UDim2.fromOffset(5, 5),
		Size = UDim2.fromOffset(var6, var6)
	})
	local var11 = if p1.badgeType and p1.badgeType == virtualItemBadgeTypeModule.Popular then reactModule.createElement(yellowBadgeModule, {
		LayoutOrder = 3,
		Icon = "icons/menu/fire_fill",
		Text = var4.Popular
	}) else nil
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), default (copy), virtualItemBadgeShownCounter (copy), p1 (ref)
		if var11 then
			default:logRobloxTelemetryCounter(virtualItemBadgeShownCounter, 1, { badgeType = p1.badgeType })
			
			return
		end
	end, {})
	local var12 = if p1.isCompact then "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
	local var13 = if p1.isCompact then "auto-xy text-align-x-left text-wrap text-title-small content-emphasis" else "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis"
	local createElement = reactModule.createElement
	local t = {
		tag = "auto-y row gap-small align-y-center align-x-left",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = { ItemIcon = var10 }
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 2,
		tag = "col auto-y gap-small",
		Size = UDim2.new(1, (-var6) - 6, 0, 0)
	}
	local t_3 = {}
	
	if fFlagUnifiedPurchaseAddSkeleton and p1.isLoading and p1.itemName == nil then
		createElement_2 = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			tag = "position-bottom-center",
			Size = UDim2.fromScale(1, 0.3),
			radius = radius.Circle
		})
	else
		createElement_2 = reactModule.createElement
		local var14 = text
		local t_4 = { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 0) }
		local itemName = p1.itemName
		t_4.Text = if #itemName > 50 then itemName:sub(1, 50) .. "..." else itemName
		t_4.tag = var12
		createElement_2 = createElement_2(var14, t_4)
	end
	local createElement_3
	t_3.ItemName = createElement_2
	t_3.ItemSubtitle = p1.subtitleView
	
	if fFlagUnifiedPurchaseAddSkeleton and p1.isLoading and var3 == nil then
		createElement_3 = reactModule.createElement(skeleton, {
			LayoutOrder = if p1.subtitleView then 3 else 2,
			Size = UDim2.fromScale(0.4, 0.3),
			radius = radius.Circle
		})
	else
		local var15
		createElement_3 = reactModule.createElement
		local var16 = view
		local t_4 = {
			LayoutOrder = if p1.subtitleView then 3 else 2,
			tag = if p1.isPortrait then "auto-xy col gap-small align-y-center" elseif var1 and var9 then "row align-y-center gap-small auto-xy clip" else "auto-xy row gap-small align-y-center"
		}
		local t_5 = {}
		
		if var3 then
			if fFlagUnifiedPurchaseFlowMarketplaceUIImprovements then
				var15 = reactModule.createElement
				var15 = var15(text, {
					LayoutOrder = 1,
					RichText = true,
					Text = var7 .. (if priceSuffix and priceSuffix ~= "" then "" .. priceSuffix else ""),
					tag = var13
				})
			else
				var15 = reactModule.createElement
				var15 = var15(text, {
					LayoutOrder = 1,
					tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis",
					Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, var3) .. (if priceSuffix and priceSuffix ~= "" then "" .. priceSuffix else "")
				})
			end
		elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.itemDisplayPrice then
			var15 = reactModule.createElement
			var15 = var15(text, {
				LayoutOrder = 1,
				Text = p1.itemDisplayPrice .. (if priceSuffix and priceSuffix ~= "" then "" .. priceSuffix else ""),
				tag = var13
			})
		else
			var15 = nil
		end
		local var17
		t_5.ItemCost = var15
		
		if var9 and var8 then
			var17 = reactModule.createElement
			var17 = var17(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-align-x-left text-wrap text-body-small content-default",
				RichText = true,
				Text = "<s>" .. var15 .. (if var1 and priceSuffix and priceSuffix ~= "" then priceSuffix else "") .. "</s>"
			})
		else
			var17 = nil
		end
		t_5.OriginalPrice = var17
		t_5.ItemBadge = var11
		createElement_3 = createElement_3(var16, t_4, t_5)
	end
	t_3.ItemDetails = createElement_3
	t_1.ItemDetailsFrame = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end