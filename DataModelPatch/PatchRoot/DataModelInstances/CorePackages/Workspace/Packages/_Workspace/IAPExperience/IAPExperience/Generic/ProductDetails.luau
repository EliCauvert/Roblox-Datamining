local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FormatNumberModule = require(Parent.Utility.formatNumber)
local LoggerModule = require(Parent.Utility.logger)
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FoundationModule = require(Parent1.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View
local VirtualItemBadgeTypeModule = require(Parent.Enums.VirtualItemBadgeType)
local ModelViewportModule = require(Parent.Generic.ModelViewport)
local YellowBadgeModule = require(Parent.Generic.YellowBadge)
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local Default = require(Parent1.LoggingProtocol).default
local VirtualItemBadgeShownCounter = require(Parent.Generic.Events.VirtualItemBadgeCounter).VirtualItemBadgeShownCounter
local IconsStatusImageunavailable = UIBloxModule.App.ImageSet.Images["icons/status/imageunavailable"]

local function _(Text: string): string
	return if #Text > 50 then Text:sub(1, 50) .. "..." else Text
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), ReactModule (copy), ModelViewportModule (copy), ImageSetLabel (copy), IconsStatusImageunavailable (copy), VirtualItemBadgeTypeModule (copy), YellowBadgeModule (copy), LoggerModule (copy), Default (copy), VirtualItemBadgeShownCounter (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy)
	local UseLocalizationResult = UseLocalizationFunction({ Popular = "IAPExperience.RobuxUpsell.Text.PopularItem" })
	local UseTokensResult = UseTokensFunction()
	local XOffset: number = if p1.isPortrait then 128 else 80
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	
	local function updateComponentWidth(Frame)
		-- upvalues: XOffset (copy), UseStateResult (copy), UseStateResult2 (copy)
		if not Frame then return end
		local XDelta = Frame.AbsoluteSize.X - XOffset - 6
		
		if XDelta ~= UseStateResult then
			UseStateResult2(XDelta)
		end
	end
	
	local Element = if p1.model == nil then ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 5, 0, 5),
		Size = UDim2.new(0, XOffset, 0, XOffset),
		ScaleType = Enum.ScaleType.Stretch,
		Image = if p1.itemIcon then p1.itemIcon else IconsStatusImageunavailable,
		ImageColor3 = if p1.itemIcon then nil else UseTokensResult.Color.Content.Default.Color3,
		ImageTransparency = if p1.itemIcon then nil else UseTokensResult.Color.Content.Default.Transparency
	}) else ReactModule.createElement(ModelViewportModule, {
		model = p1.model,
		Position = UDim2.fromOffset(5, 5),
		Size = UDim2.fromOffset(XOffset, XOffset)
	})
	local Element1 = if p1.badgeType and p1.badgeType == VirtualItemBadgeTypeModule.Popular then ReactModule.createElement(YellowBadgeModule, {
		LayoutOrder = 2,
		Icon = "icons/menu/fire_fill",
		Text = UseLocalizationResult.Popular
	}) else nil
	ReactModule.useEffect(function()
		-- upvalues: Element1 (copy), LoggerModule (upval), p1 (copy), Default (upval), VirtualItemBadgeShownCounter (upval)
		if Element1 then
			LoggerModule.debug({
				message = "Virtual Item Badge Shown",
				badgeType = p1.badgeType
			})
			Default:logRobloxTelemetryCounter(VirtualItemBadgeShownCounter, 1, { badgeType = p1.badgeType })
			
			return
		end
	end, {})
	local ItemName: string = p1.itemName
	
	return ReactModule.createElement(View, {
		tag = "auto-y row gap-small align-y-center align-x-left",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		ItemIcon = Element,
		ItemDetailsFrame = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col auto-y gap-small",
			onAbsoluteSizeChanged = updateComponentWidth,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ItemName = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-y text-align-x-left text-wrap text-title-medium content-emphasis",
				Size = UDim2.new(0, UseStateResult, 0, 0),
				Text = if #ItemName > 50 then ItemName:sub(1, 50) .. "..." else ItemName
			}),
			ItemDetails = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = if p1.isPortrait then "auto-xy col gap-small align-y-center" else "auto-xy row gap-small align-y-center"
			}, {
				ItemCost = if p1.itemRobuxCost then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-align-x-left text-wrap text-title-medium content-emphasis",
					Text = utf8.char(57346) .. " " .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.itemRobuxCost)
				}) else nil,
				ItemBadge = Element1
			})
		})
	})
end