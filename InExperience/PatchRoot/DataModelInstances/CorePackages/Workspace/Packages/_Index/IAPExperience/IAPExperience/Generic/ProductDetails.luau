local parent = script.Parent.Parent
local parent_1 = parent.Parent
local formatNumberModule = require(parent.Utility.formatNumber)
local loggerModule = require(parent.Utility.logger)
local reactModule = require(parent_1.React)
local UIBloxModule = require(parent_1.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local foundationModule = require(parent_1.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View
local virtualItemBadgeTypeModule = require(parent.Enums.VirtualItemBadgeType)
local modelViewportModule = require(parent.Generic.ModelViewport)
local yellowBadgeModule = require(parent.Generic.YellowBadge)
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local default = require(parent_1.LoggingProtocol).default
local virtualItemBadgeShownCounter = require(parent.Generic.Events.VirtualItemBadgeCounter).VirtualItemBadgeShownCounter
local imageunavailable = images["icons/status/imageunavailable"]

local function _(a)
	return if #a > 50 then a:sub(1, 50) .. "..." else a
end

return function(p1)
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), modelViewportModule (ref), imageSetLabel (ref), imageunavailable (ref), virtualItemBadgeTypeModule (ref), yellowBadgeModule (ref), loggerModule (ref), default (ref), virtualItemBadgeShownCounter (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref)
	local var1 = useLocalization({ Popular = "IAPExperience.RobuxUpsell.Text.PopularItem" })
	local var2 = useTokens()
	local var3 = if p1.isPortrait then 128 else 80
	local var4, var5 = reactModule.useState(0)
	
	local function updateComponentWidth(p2)
		-- upvalues: var3 (ref), var4 (ref), var5 (ref)
		if not p2 then return end
		local var6 = p2.AbsoluteSize.X - var3 - 6
		
		if var6 ~= var4 then
			var5(var6)
		end
	end
	
	local var6 = if p1.model ~= nil then reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, var3, 0, var3),
		ScaleType = Enum.ScaleType.Stretch,
		Image = if p1.itemIcon then p1.itemIcon else imageunavailable,
		ImageColor3 = if p1.itemIcon then nil else var2.Color.Content.Default.Color3,
		ImageTransparency = if p1.itemIcon then nil else var2.Color.Content.Default.Transparency
	}) else reactModule.createElement(modelViewportModule, {
		model = p1.model,
		Position = UDim2.fromOffset(5, 5),
		Size = UDim2.fromOffset(var3, var3)
	})
	local var7 = if p1.badgeType and p1.badgeType == virtualItemBadgeTypeModule.Popular then reactModule.createElement(yellowBadgeModule, {
		LayoutOrder = 2,
		Icon = "icons/menu/fire_fill",
		Text = var1.Popular
	}) else nil
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), loggerModule (copy), p1 (ref), default (copy), virtualItemBadgeShownCounter (copy)
		if var7 then
			loggerModule.debug({
				message = "Virtual Item Badge Shown",
				badgeType = p1.badgeType
			})
			default:logRobloxTelemetryCounter(virtualItemBadgeShownCounter, 1, { badgeType = p1.badgeType })
			
			return
		end
	end, {})
	local createElement = reactModule.createElement
	local t = {
		tag = "auto-y row gap-small align-y-center align-x-left",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = { ItemIcon = var6 }
	local createElement_1 = reactModule.createElement
	local t_2 = {
		LayoutOrder = 2,
		tag = "col auto-y gap-small",
		onAbsoluteSizeChanged = updateComponentWidth,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		LayoutOrder = 1,
		tag = "auto-y text-align-x-left text-wrap text-title-medium content-emphasis",
		Size = UDim2.new(0, var4, 0, 0)
	}
	local itemName = p1.itemName
	t_4.Text = if #itemName > 50 then itemName:sub(1, 50) .. "..." else itemName
	t_3.ItemName = createElement_2(text, t_4)
	t_3.ItemDetails = reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = if p1.isPortrait then "auto-xy col gap-small align-y-center" else "auto-xy row gap-small align-y-center"
	}, {
		ItemCost = if p1.itemRobuxCost then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis",
			Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p1.itemRobuxCost)
		}) else nil,
		ItemBadge = var7
	})
	t_1.ItemDetailsFrame = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end