local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useSemanticTokensModule = require(avatarExperienceControlBar.Hooks.useSemanticTokens)
local _ = require(avatarExperienceControlBar.ControlBarTypes)
local iconItemModule = require(avatarExperienceControlBar.Components.Items.IconItem)
local imageItemModule = require(avatarExperienceControlBar.Components.Items.ImageItem)
local colorItemModule = require(avatarExperienceControlBar.Components.Items.ColorItem)
local fFlagAXAddToolTipToIconItemMenu = require(parent.AvatarExperienceFlags).FFlagAXAddToolTipToIconItemMenu
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons
local fFlagAXResetAvatarButton = require(parent.AvatarExperienceFlags).FFlagAXResetAvatarButton

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useSemanticTokensModule (ref), reactModule (ref), fFlagAXResetAvatarButton (ref), imageItemModule (ref), iconItemModule (ref), fFlagAXMigrateBuilderIcons (ref), fFlagAXAddToolTipToIconItemMenu (ref), colorItemModule (ref), foundationModule (ref)
	local var1 = useSemanticTokensModule()
	local var2 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagAXResetAvatarButton (copy), reactModule (copy), imageItemModule (copy), iconItemModule (copy), fFlagAXMigrateBuilderIcons (copy), fFlagAXAddToolTipToIconItemMenu (copy), p1 (ref), colorItemModule (copy), foundationModule (copy)
		local item = p3.item
		local isActive = p3.isActive
		local onItemActivated = p3.onItemActivated
		local var3 = if fFlagAXResetAvatarButton and item.type == "divider" then nil else function()
			-- upvalues: onItemActivated (ref), item (ref)
			if onItemActivated then
				onItemActivated(item.id)
			end
			if item.onActivated then
				item.onActivated()
			end
		end
		
		return if item.type == "image" then reactModule.createElement(imageItemModule, {
			thumbnailUrl = item.thumbnailUrl,
			isActive = isActive,
			onActivated = var3,
			disabled = item.disabled,
			ref = item.ref,
			enableFocusAnimation = item.enableFocusAnimation,
			Visible = item.visible,
			LayoutOrder = p3.index,
			hideIndicator = item.hideIndicator
		}) elseif item.type == "icon" then reactModule.createElement(iconItemModule, {
			icon = item.icon,
			activeIcon = item.activeIcon,
			iconSize = item.iconSize,
			iconVariant = if fFlagAXMigrateBuilderIcons then item.iconVariant else nil,
			activeIconVariant = if fFlagAXMigrateBuilderIcons then item.activeIconVariant else nil,
			isActive = isActive,
			animate = not item.disableAnimation,
			onActivated = var3,
			disabled = item.disabled,
			toolTipConfig = if fFlagAXAddToolTipToIconItemMenu and p1.activeItemId ~= "" and item.toolTipConfig then nil else item.toolTipConfig,
			ref = item.ref,
			Visible = item.visible,
			LayoutOrder = p3.index
		}) elseif item.type == "color" then reactModule.createElement(colorItemModule, {
			colors = item.colors,
			colorSize = item.colorSize,
			isActive = item.isActive,
			size = item.size,
			onActivated = var3,
			disabled = item.disabled,
			ref = item.ref,
			Visible = item.visible,
			LayoutOrder = p3.index,
			Selectable = item.Selectable
		}) elseif fFlagAXResetAvatarButton and item.type == "divider" then reactModule.createElement(foundationModule.Divider, {
			variant = item.variant,
			ref = item.ref,
			Visible = item.visible,
			LayoutOrder = p3.index
		}) else nil
	end, {
		if fFlagAXAddToolTipToIconItemMenu then p1.activeItemId else nil
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle padding-xsmall",
		backgroundStyle = var1.menuBackgroundStyle,
		ref = p2,
		Visible = #p1.items > 0,
		LayoutOrder = p1.LayoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		Position = p1.Position
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), p1 (ref), var1 (ref), var2 (ref)
		local t = {
			IconOnlyMenuListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = if p1.direction == "horizontal" then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var1.iconOnlyMenuItemGap)
			})
		}
		
		for i, v in p1.items do
			t[`MenuItem-{v.id}`] = var2({
				item = v,
				isActive = if v.type == "divider" then nil elseif v.isActive ~= nil then v.id == p1.activeItemId else v.isActive,
				onItemActivated = p1.onItemActivated,
				index = i
			})
		end
		return t
	end, {
		p1.items,
		p1.activeItemId,
		p1.onItemActivated,
		p1.direction,
		var2
	}))
end))