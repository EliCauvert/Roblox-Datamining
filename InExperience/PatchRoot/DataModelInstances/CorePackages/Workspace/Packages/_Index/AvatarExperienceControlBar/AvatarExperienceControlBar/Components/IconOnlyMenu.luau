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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useSemanticTokensModule (ref), reactModule (ref), fFlagAXResetAvatarButton (ref), imageItemModule (ref), iconItemModule (ref), fFlagAXMigrateBuilderIcons (ref), fFlagAXAddToolTipToIconItemMenu (ref), colorItemModule (ref), foundationModule (ref)
	local var7 = useSemanticTokensModule()
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagAXResetAvatarButton (copy), reactModule (copy), imageItemModule (copy), iconItemModule (copy), fFlagAXMigrateBuilderIcons (copy), fFlagAXAddToolTipToIconItemMenu (copy), p0 (ref), colorItemModule (copy), foundationModule (copy)
		local item = p2.item
		local isActive = p2.isActive
		local onItemActivated = p2.onItemActivated
		local var9 = if fFlagAXResetAvatarButton and item.type == "divider" then nil else function()
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
			onActivated = var9,
			disabled = item.disabled,
			ref = item.ref,
			enableFocusAnimation = item.enableFocusAnimation,
			Visible = item.visible,
			LayoutOrder = p2.index,
			hideIndicator = item.hideIndicator
		}) elseif item.type == "icon" then reactModule.createElement(iconItemModule, {
			icon = item.icon,
			activeIcon = item.activeIcon,
			iconSize = item.iconSize,
			iconVariant = if fFlagAXMigrateBuilderIcons then item.iconVariant else nil,
			activeIconVariant = if fFlagAXMigrateBuilderIcons then item.activeIconVariant else nil,
			isActive = isActive,
			animate = not item.disableAnimation,
			onActivated = var9,
			disabled = item.disabled,
			toolTipConfig = if fFlagAXAddToolTipToIconItemMenu and p0.activeItemId ~= "" and item.toolTipConfig then nil else item.toolTipConfig,
			ref = item.ref,
			Visible = item.visible,
			LayoutOrder = p2.index
		}) elseif item.type == "color" then reactModule.createElement(colorItemModule, {
			colors = item.colors,
			colorSize = item.colorSize,
			isActive = item.isActive,
			size = item.size,
			onActivated = var9,
			disabled = item.disabled,
			ref = item.ref,
			Visible = item.visible,
			LayoutOrder = p2.index,
			Selectable = item.Selectable
		}) elseif fFlagAXResetAvatarButton and item.type == "divider" then reactModule.createElement(foundationModule.Divider, {
			variant = item.variant,
			ref = item.ref,
			Visible = item.visible,
			LayoutOrder = p2.index
		}) else nil
	end, {
		if fFlagAXAddToolTipToIconItemMenu then p0.activeItemId else nil
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle padding-xsmall",
		backgroundStyle = var7.menuBackgroundStyle,
		ref = p1,
		Visible = #p0.items > 0,
		LayoutOrder = p0.LayoutOrder,
		onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
		Position = p0.Position
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), p0 (ref), var7 (ref), var8 (ref)
		local t = {
			IconOnlyMenuListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = if p0.direction == "horizontal" then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, var7.iconOnlyMenuItemGap)
			})
		}
		
		for i, v in p0.items do
			t[`MenuItem-{v.id}`] = var8({
				item = v,
				isActive = if v.type == "divider" then nil elseif v.isActive ~= nil then v.id == p0.activeItemId else v.isActive,
				onItemActivated = p0.onItemActivated,
				index = i
			})
		end
		return t
	end, {
		p0.items,
		p0.activeItemId,
		p0.onItemActivated,
		p0.direction,
		var8
	}))
end))