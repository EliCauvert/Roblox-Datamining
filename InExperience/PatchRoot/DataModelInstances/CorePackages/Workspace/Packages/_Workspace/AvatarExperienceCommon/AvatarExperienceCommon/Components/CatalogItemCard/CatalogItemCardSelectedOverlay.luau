local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local UIBloxModule = require(parent.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local itemCardComponents = require(parent.AvatarExperienceUIKit).ItemCardComponents
local itemCardIcon = itemCardComponents.ItemCardIcon
local itemCardBadge = itemCardComponents.ItemCardBadge
local responsiveModule = require(parent.Responsive)
local useLastInput = responsiveModule.useLastInput
local useIsSpatial = responsiveModule.useIsSpatial
local fFlagAXInventoryDurablesSupport = avatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local fFlagAXFixBadgeStatusConfigOptions = avatarExperienceFlagsModule.FFlagAXFixBadgeStatusConfigOptions
local fFlagAXShowFaeUpsell = avatarExperienceFlagsModule.FFlagAXShowFaeUpsell
local fFlagAXSelectedBorderWrapsBackground = avatarExperienceFlagsModule.FFlagAXSelectedBorderWrapsBackground

local var1 = function(p1)
	local list = { { type = "icon", icon = p1.icon } }
	
	if p1.text then
		table.insert(list, { type = "text", text = p1.text })
	end
	return list
end

return function(p1)
	-- upvalues: useTokens (ref), useLastInput (ref), useIsSpatial (ref), responsiveModule (ref), reactModule (ref), fFlagAXSelectedBorderWrapsBackground (ref), view (ref), itemCardBadge (ref), fFlagAXFixBadgeStatusConfigOptions (ref), fFlagAXShowFaeUpsell (ref), var1 (ref), fFlagAXInventoryDurablesSupport (ref), itemCardIcon (ref), button (ref), buttonType (ref)
	local var2
	local var3 = useTokens()
	local var4 = useLastInput() == responsiveModule.Input.Directional and not useIsSpatial()
	local createElement = reactModule.createElement
	local var5 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1)
	}
	local t_1 = {
		CatalogItemCardSelectedOverlayCornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) }),
		CatalogItemCardSelectedOverlayStroke = if fFlagAXSelectedBorderWrapsBackground and p1.suppressBorder then nil else reactModule.createElement("UIStroke", {
			Color = var3.Color.Content.Emphasis.Color3,
			Transparency = var3.Color.Content.Emphasis.Transparency,
			Thickness = var3.Stroke.Standard,
			LineJoinMode = Enum.LineJoinMode.Round,
			[reactModule.Tag] = "data-testid=selection-stroke"
		})
	}
	
	if p1.badge then
		var2 = reactModule.createElement
		var2 = var2(view, {
			tag = "padding-top-small padding-left-small",
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Badge = reactModule.createElement(itemCardBadge, {
				displayBorder = true,
				content = if fFlagAXFixBadgeStatusConfigOptions or fFlagAXShowFaeUpsell then var1(p1.badge) else {
					{ type = "icon", icon = p1.badge.icon },
					{ type = "text", text = p1.badge.text }
				}
			})
		})
	else
		var2 = nil
	end
	t_1.CatalogItemCardSelectedOverlayBadge = var2
	t_1.CatalogItemCardSelectedOverlayItemStatusIcon = if fFlagAXInventoryDurablesSupport and p1.itemStatusIcon and not p1.badge then reactModule.createElement(view, {
		tag = "padding-top-small padding-left-small",
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Icon = reactModule.createElement(itemCardIcon, { icon = p1.itemStatusIcon })
	}) else nil
	t_1.CatalogItemCardSelectedOverlayButton = if var4 or not p1.buttonText then nil else reactModule.createElement(button, {
		isDisabled = false,
		fontStyle = "CaptionHeader",
		text = p1.buttonText,
		buttonType = buttonType.PrimarySystem,
		onActivated = p1.onActivated,
		anchorPoint = Vector2.new(0.5, 1),
		position = UDim2.new(0.5, 0, 1, -var3.Gap.XXSmall),
		size = UDim2.new(1, -(var3.Gap.XXSmall * 2), 0, var3.Size.Size_700)
	})
	
	return createElement(var5, t, t_1)
end