local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseSemanticTokensModule = require(AvatarExperienceControlBar.Hooks.useSemanticTokens)
local _ = require(AvatarExperienceControlBar.ControlBarTypes)
local IconItemModule = require(AvatarExperienceControlBar.Components.Items.IconItem)
local ImageItemModule = require(AvatarExperienceControlBar.Components.Items.ImageItem)
local ColorItemModule = require(AvatarExperienceControlBar.Components.Items.ColorItem)
local FFlagAXAddToolTipToIconItemMenu = require(Parent.AvatarExperienceFlags).FFlagAXAddToolTipToIconItemMenu
local FFlagAXMigrateBuilderIcons = require(Parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons
local FFlagAXResetAvatarButton = require(Parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseSemanticTokensModule (copy), ReactModule (copy), FFlagAXResetAvatarButton (copy), ImageItemModule (copy), IconItemModule (copy), FFlagAXMigrateBuilderIcons (copy), FFlagAXAddToolTipToIconItemMenu (copy), ColorItemModule (copy), FoundationModule (copy)
	local UseSemanticTokensModuleResult = UseSemanticTokensModule()
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: FFlagAXResetAvatarButton (upval), ReactModule (upval), ImageItemModule (upval), IconItemModule (upval), FFlagAXMigrateBuilderIcons (upval), FFlagAXAddToolTipToIconItemMenu (upval), Frame (copy), ColorItemModule (upval), FoundationModule (upval)
		local Item = p1.item
		local IsActive = p1.isActive
		local OnItemActivatedFunction = p1.onItemActivated
		local OnActivated = if FFlagAXResetAvatarButton and Item.type == "divider" then nil else function()
			-- upvalues: OnItemActivatedFunction (copy), Item (copy)
			if OnItemActivatedFunction then
				OnItemActivatedFunction(Item.id)
			end
			if Item.onActivated then
				Item.onActivated()
			end
		end
		
		return if Item.type == "image" then ReactModule.createElement(ImageItemModule, {
			thumbnailUrl = Item.thumbnailUrl,
			isActive = IsActive,
			onActivated = OnActivated,
			disabled = Item.disabled,
			ref = Item.ref,
			enableFocusAnimation = Item.enableFocusAnimation,
			Visible = Item.visible,
			LayoutOrder = p1.index,
			hideIndicator = Item.hideIndicator
		}) elseif Item.type == "icon" then ReactModule.createElement(IconItemModule, {
			icon = Item.icon,
			activeIcon = Item.activeIcon,
			iconSize = Item.iconSize,
			iconVariant = if FFlagAXMigrateBuilderIcons then Item.iconVariant else nil,
			activeIconVariant = if FFlagAXMigrateBuilderIcons then Item.activeIconVariant else nil,
			isActive = IsActive,
			animate = not Item.disableAnimation,
			onActivated = OnActivated,
			disabled = Item.disabled,
			toolTipConfig = if FFlagAXAddToolTipToIconItemMenu and Frame.activeItemId ~= "" and Item.toolTipConfig then nil else Item.toolTipConfig,
			ref = Item.ref,
			Visible = Item.visible,
			LayoutOrder = p1.index
		}) elseif Item.type == "color" then ReactModule.createElement(ColorItemModule, {
			colors = Item.colors,
			colorSize = Item.colorSize,
			isActive = Item.isActive,
			size = Item.size,
			onActivated = OnActivated,
			disabled = Item.disabled,
			ref = Item.ref,
			Visible = Item.visible,
			LayoutOrder = p1.index,
			Selectable = Item.Selectable
		}) elseif FFlagAXResetAvatarButton and Item.type == "divider" then ReactModule.createElement(FoundationModule.Divider, {
			variant = Item.variant,
			ref = Item.ref,
			Visible = Item.visible,
			LayoutOrder = p1.index
		}) else nil
	end, {
		if FFlagAXAddToolTipToIconItemMenu then Frame.activeItemId else nil
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle padding-xsmall",
		backgroundStyle = UseSemanticTokensModuleResult.menuBackgroundStyle,
		ref = Ref,
		Visible = #Frame.items > 0,
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = Frame.onAbsoluteSizeChanged,
		Position = Frame.Position
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Frame (copy), UseSemanticTokensModuleResult (copy), UseResult (copy)
		local config = {
			IconOnlyMenuListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = if Frame.direction == "horizontal" then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, UseSemanticTokensModuleResult.iconOnlyMenuItemGap)
			})
		}
		
		for Index, item in Frame.items do
			config[`MenuItem-{item.id}`] = UseResult({
				item = item,
				isActive = if item.type == "divider" then nil elseif item.isActive == nil then item.id == Frame.activeItemId else item.isActive,
				onItemActivated = Frame.onItemActivated,
				index = Index
			})
		end
		return config
	end, {
		Frame.items,
		Frame.activeItemId,
		Frame.onItemActivated,
		Frame.direction,
		UseResult
	})))
end))