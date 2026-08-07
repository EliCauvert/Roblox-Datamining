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

local function _(a) --[[ line: 41 | named "withMaxLength" ]]
	return if #a > 50 then a:sub(1, 50) .. "..." else a
end

return function(p0) --[[ line: 57 ]]
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), modelViewportModule (ref), imageSetLabel (ref), imageunavailable (ref), virtualItemBadgeTypeModule (ref), yellowBadgeModule (ref), loggerModule (ref), default (ref), virtualItemBadgeShownCounter (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref)
	local var9 = useLocalization({ Popular = "IAPExperience.RobuxUpsell.Text.PopularItem" })
	local var10 = useTokens()
	local var11 = if p0.isPortrait then 128 else 80
	local var12, var13 = reactModule.useState(0)
	
	local function updateComponentWidth(p1) --[[ line: 66 ]]
		-- upvalues: var11 (ref), var12 (ref), var13 (ref)
		if not p1 then return end
		local var22 = p1.AbsoluteSize.X - var11 - 6
		
		if var22 ~= var12 then
			var13(var22)
		end
	end
	
	local var15 = if p0.model ~= nil then reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, var11, 0, var11),
		ScaleType = Enum.ScaleType.Stretch,
		Image = if p0.itemIcon then p0.itemIcon else imageunavailable,
		ImageColor3 = if p0.itemIcon then nil else var10.Color.Content.Default.Color3,
		ImageTransparency = if p0.itemIcon then nil else var10.Color.Content.Default.Transparency
	}) else reactModule.createElement(modelViewportModule, {
		model = p0.model,
		Position = UDim2.fromOffset(5, 5),
		Size = UDim2.fromOffset(var11, var11)
	})
	local var16 = if p0.badgeType and p0.badgeType == virtualItemBadgeTypeModule.Popular then reactModule.createElement(yellowBadgeModule, {
		LayoutOrder = 2,
		Icon = "icons/menu/fire_fill",
		Text = var9.Popular
	}) else nil
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: var16 (ref), loggerModule (copy), p0 (ref), default (copy), virtualItemBadgeShownCounter (copy)
		if var16 then
			loggerModule.debug({
				message = "Virtual Item Badge Shown",
				badgeType = p0.badgeType
			})
			default:logRobloxTelemetryCounter(virtualItemBadgeShownCounter, 1, { badgeType = p0.badgeType })
			
			return
		end
	end, {})
	local createElement = reactModule.createElement
	local t = {
		tag = "auto-y row gap-small align-y-center align-x-left",
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = { ItemIcon = var15 }
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
		Size = UDim2.new(0, var12, 0, 0)
	}
	local itemName = p0.itemName
	t_4.Text = if #itemName > 50 then itemName:sub(1, 50) .. "..." else itemName
	t_3.ItemName = createElement_2(text, t_4)
	t_3.ItemDetails = reactModule.createElement(view, {
		LayoutOrder = 2,
		tag = if p0.isPortrait then "auto-xy col gap-small align-y-center" else "auto-xy row gap-small align-y-center"
	}, {
		ItemCost = if p0.itemRobuxCost then reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis",
			Text = utf8.char(57346) .. " " .. formatNumberModule(localizationService.RobloxLocaleId, p0.itemRobuxCost)
		}) else nil,
		ItemBadge = var16
	})
	t_1.ItemDetailsFrame = createElement_1(view, t_2, t_3)
	
	return createElement(view, t, t_1)
end