local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local fFlagAXMigrateBuilderIcons = require(parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

return function(p1)
	-- upvalues: useTokens (ref), fFlagAXMigrateBuilderIcons (ref), foundationModule (ref), reactModule (ref), itemCardThumbnail (ref), icon (ref), iconSize (ref)
	local var1 = useTokens()
	
	return if p1.url then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromScale(1, 1)
	}, {
		Thumbnail = reactModule.createElement(itemCardThumbnail, { url = p1.url }),
		Overlay = p1.enableThumbnailOverlay and reactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = var1.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = var1.Color.Common.Shadow.Transparency
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) })
		})
	}) else reactModule.createElement(reactModule.Fragment, nil, {
		AddIconFrame = if p1.icon and not p1.ignoredUrl then reactModule.createElement("Frame", {
			ZIndex = 2,
			Size = if p1.iconFrameStyles then p1.iconFrameStyles.Size else UDim2.fromOffset(30, 30),
			Position = if fFlagAXMigrateBuilderIcons then UDim2.new(0.5, 4, 0.5, 4) else UDim2.new(0.5, 3, 0.5, 3),
			BackgroundColor3 = var1.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = var1.Color.Surface.Surface_200.Transparency
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			AddIcon = reactModule.createElement(icon, {
				name = if fFlagAXMigrateBuilderIcons then foundationModule.Enums.IconName.PlusLarge else "icons/common/plus_heavy_small",
				size = if p1.iconFrameStyles then p1.iconFrameStyles.iconSize else iconSize.Small,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		}) else nil,
		SlotIcon = reactModule.createElement(icon, {
			name = if p1.icon then if fFlagAXMigrateBuilderIcons then p1.icon.name else p1.icon else foundationModule.Enums.IconName.PlusLarge,
			variant = if fFlagAXMigrateBuilderIcons then if p1.icon then p1.icon.variant else foundationModule.Enums.IconVariant.Regular else nil,
			size = if fFlagAXMigrateBuilderIcons then var1.Size.Size_800 else iconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			style = var1.Color.Shift.Shift_400
		})
	})
end