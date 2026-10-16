local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UIBloxModule = require(Parent.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local ItemCardComponents = require(Parent.AvatarExperienceUIKit).ItemCardComponents
local ItemCardIcon = ItemCardComponents.ItemCardIcon
local ItemCardBadge = ItemCardComponents.ItemCardBadge
local ResponsiveModule = require(Parent.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UseSelectedOverlayButtonModule = require(script.Parent.useSelectedOverlayButton)
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXFixBadgeStatusConfigOptions = AvatarExperienceFlagsModule.FFlagAXFixBadgeStatusConfigOptions
local FFlagAXShowFaeUpsell = AvatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local FFlagAXMarketplaceItemCardIndicatorStack = AvatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack

local function v17(Badge) --[[ Line: 44 ]]
	local List = { { type = "icon", icon = Badge.icon } }
	
	if Badge.text then
		table.insert(List, { type = "text", text = Badge.text })
	end
	return List
end

return function(p1) --[[ Line: 56 | Named "CatalogItemCardSelectedOverlay" ]]
	-- upvalues: UseTokensFunction (copy), FFlagAXMarketplaceItemCardIndicatorStack (copy), UseSelectedOverlayButtonModule (copy), UseLastInputFunction (copy), UseIsSpatialFunction (copy), ResponsiveModule (copy), ReactModule (copy), View (copy), ItemCardBadge (copy), FFlagAXFixBadgeStatusConfigOptions (copy), FFlagAXShowFaeUpsell (copy), v17 (copy), FFlagAXInventoryDurablesSupport (copy), ItemCardIcon (copy), Button (copy), ButtonType (copy)
	local UseTokensResult = UseTokensFunction()
	local IsVisible = nil
	local BottomOffset = nil
	local Height = nil
	
	if FFlagAXMarketplaceItemCardIndicatorStack then
		local UseSelectedOverlayButtonModuleResult = UseSelectedOverlayButtonModule(p1.buttonText ~= nil)
		IsVisible = UseSelectedOverlayButtonModuleResult.isVisible
		BottomOffset = UseSelectedOverlayButtonModuleResult.bottomOffset
		Height = UseSelectedOverlayButtonModuleResult.height
	else
		local UseLastInputResult = UseLastInputFunction()
		local UseIsSpatialResult = UseIsSpatialFunction()
		IsVisible = not (UseLastInputResult == ResponsiveModule.Input.Directional and not UseIsSpatialResult)
		BottomOffset = UseTokensResult.Gap.XXSmall
		Height = UseTokensResult.Size.Size_700
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1)
	}, {
		CatalogItemCardSelectedOverlayCornerRadius = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		CatalogItemCardSelectedOverlayStroke = if p1.suppressBorder then nil else ReactModule.createElement("UIStroke", {
			Color = UseTokensResult.Color.Content.Emphasis.Color3,
			Transparency = UseTokensResult.Color.Content.Emphasis.Transparency,
			Thickness = UseTokensResult.Stroke.Standard,
			LineJoinMode = Enum.LineJoinMode.Round,
			[ReactModule.Tag] = "data-testid=selection-stroke"
		}),
		CatalogItemCardSelectedOverlayBadge = if p1.badge then ReactModule.createElement(View, {
			tag = "padding-top-small padding-left-small",
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Badge = ReactModule.createElement(ItemCardBadge, {
				displayBorder = true,
				content = if FFlagAXFixBadgeStatusConfigOptions or FFlagAXShowFaeUpsell then v17(p1.badge) else {
					{ type = "icon", icon = p1.badge.icon },
					{ type = "text", text = p1.badge.text }
				}
			})
		}) else nil,
		CatalogItemCardSelectedOverlayItemStatusIcon = if FFlagAXInventoryDurablesSupport and p1.itemStatusIcon and not p1.badge then ReactModule.createElement(View, {
			tag = "padding-top-small padding-left-small",
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Icon = ReactModule.createElement(ItemCardIcon, { icon = p1.itemStatusIcon })
		}) else nil,
		CatalogItemCardSelectedOverlayButton = if IsVisible and p1.buttonText then ReactModule.createElement(Button, {
			isDisabled = false,
			fontStyle = "CaptionHeader",
			text = p1.buttonText,
			buttonType = ButtonType.PrimarySystem,
			onActivated = p1.onActivated,
			anchorPoint = Vector2.new(0.5, 1),
			position = UDim2.new(0.5, 0, 1, -BottomOffset),
			size = UDim2.new(1, -(UseTokensResult.Gap.XXSmall * 2), 0, Height)
		}) else nil
	})
end