local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local FFlagAXMigrateBuilderIcons = require(Parent.AvatarExperienceFlags).FFlagAXMigrateBuilderIcons

return function(p1) --[[ Line: 37 | Named "SlotItemCardThumbnail" ]]
	-- upvalues: UseTokensFunction (copy), FFlagAXMigrateBuilderIcons (copy), FoundationModule (copy), ReactModule (copy), ItemCardThumbnail (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local Name = if p1.icon then if FFlagAXMigrateBuilderIcons then p1.icon.name else p1.icon else FoundationModule.Enums.IconName.PlusLarge
	local Variant = if FFlagAXMigrateBuilderIcons then if p1.icon then p1.icon.variant else FoundationModule.Enums.IconVariant.Regular else nil
	
	return if p1.url then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromScale(1, 1)
	}, {
		Thumbnail = ReactModule.createElement(ItemCardThumbnail, { url = p1.url }),
		Overlay = p1.enableThumbnailOverlay and ReactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = UseTokensResult.Color.Common.Shadow.Transparency
		}, {
			UICorner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			})
		})
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		AddIconFrame = if p1.icon and not p1.ignoredUrl then ReactModule.createElement("Frame", {
			ZIndex = 2,
			Size = p1.iconFrameStyles and p1.iconFrameStyles.Size or UDim2.fromOffset(30, 30),
			Position = if FFlagAXMigrateBuilderIcons then UDim2.new(0.5, 4, 0.5, 4) else UDim2.new(0.5, 3, 0.5, 3),
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = UseTokensResult.Color.Surface.Surface_200.Transparency
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
			AddIcon = ReactModule.createElement(Icon, {
				name = if FFlagAXMigrateBuilderIcons then FoundationModule.Enums.IconName.PlusLarge else "icons/common/plus_heavy_small",
				size = p1.iconFrameStyles and p1.iconFrameStyles.iconSize or IconSize.Small,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		}) else nil,
		SlotIcon = ReactModule.createElement(Icon, {
			name = Name,
			variant = Variant,
			size = if FFlagAXMigrateBuilderIcons then UseTokensResult.Size.Size_800 else IconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			style = UseTokensResult.Color.Shift.Shift_400
		})
	})
end