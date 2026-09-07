local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local image = foundationModule.Image
local view = foundationModule.View
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local badge = foundationModule.Badge
local menu = foundationModule.Menu
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local iconPosition = foundationModule.Enums.IconPosition
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local useTokens = foundationModule.Hooks.useTokens
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), reactModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref), view (ref), fFlagBuildDesktopReadinessModule (ref), icon (ref), iconName (ref), iconSize (ref), inputSize (ref), image (ref), iconButton (ref), badge (ref), iconPosition (ref), badgeVariant (ref), badgeShape (ref), badgeSize (ref)
	local var1 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ video = localizationStringsModule.MEDIA_SELECTION_VIDEO }) else nil).video else localizationStringsModule.MEDIA_SELECTION_VIDEO
	local var2 = useTokens()
	local var3 = if p1.isSelected then var2.Color.Content.Emphasis.Color3 else var2.Color.Stroke.Default.Color3
	local var4 = if p1.isSelected then 0 else var2.Color.Stroke.Default.Transparency
	local var5 = if p1.isSelected then var2.Stroke.Thick else var2.Stroke.Standard
	
	return if p1.isFilled then reactModule.createElement(menu, {
		isOpen = p1.isMenuOpen or false,
		items = p1.menuItems or { { items = {} } },
		side = popoverSide.Top,
		align = popoverAlign.Center,
		onPressedOutside = p1.onMenuClose,
		onActivated = p1.onMenuActivated,
		size = inputSize.Medium,
		LayoutOrder = p1.LayoutOrder
	}, reactModule.createElement(view, {
		tag = {
			["radius-large"] = true,
			["size-full-2400"] = not fFlagBuildDesktopReadinessModule,
			["size-full-2700"] = fFlagBuildDesktopReadinessModule,
			["aspect-1-1"] = p1.aspectRatio == "square",
			["aspect-16-9"] = p1.aspectRatio == "wide"
		},
		LayoutOrder = p1.LayoutOrder
	}, {
		Stroke = reactModule.createElement("UIStroke", {
			Color = var3,
			Transparency = var4,
			Thickness = var5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		}),
		TouchArea = reactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 2,
			[reactModule.Event.Activated] = p1.onSelect
		}),
		ImageClip = if p1.isLoading then reactModule.createElement(view, { tag = "size-full radius-large bg-surface-200" }) elseif p1.assetSource and p1.mediaType == "video" then reactModule.createElement("VideoFrame", {
			Looped = false,
			Playing = false,
			Volume = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Video = p1.assetSource
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) })
		}) elseif p1.assetSource then reactModule.createElement(view, { tag = "size-full radius-large clip" }, {
			Thumbnail = reactModule.createElement(image, {
				tag = "size-full radius-large",
				Image = p1.assetSource,
				ScaleType = Enum.ScaleType.Crop
			})
		}) else nil,
		EditButton = if p1.isSelected and p1.onEditPressed then reactModule.createElement(view, {
			tag = "auto-xy radius-circle bg-over-media-0 padding-xxsmall",
			ZIndex = 3,
			Position = UDim2.new(1, -var2.Gap.Small, 0, var2.Gap.Small),
			AnchorPoint = Vector2.new(1, 0)
		}, {
			Button = reactModule.createElement(iconButton, {
				icon = iconName.Pencil,
				size = inputSize.XSmall,
				onActivated = p1.onEditPressed
			})
		}) else nil,
		VideoBadge = if p1.mediaType == "video" then reactModule.createElement(badge, {
			ZIndex = 3,
			Position = UDim2.fromOffset(var2.Gap.Small, var2.Gap.Small),
			icon = { name = iconName.PlaySmall, position = iconPosition.Left },
			text = var1,
			variant = badgeVariant.OverMedia,
			shape = badgeShape.Pill,
			size = badgeSize.Small
		}) else nil
	})) else reactModule.createElement(menu, {
		tag = "size-full",
		isOpen = p1.isMenuOpen or false,
		items = p1.menuItems or { { items = {} } },
		side = popoverSide.Top,
		align = popoverAlign.Center,
		onPressedOutside = p1.onMenuClose,
		onActivated = p1.onMenuActivated,
		LayoutOrder = p1.LayoutOrder
	}, reactModule.createElement(view, {
		tag = {
			["radius-large"] = true,
			["bg-surface-200"] = true,
			["size-full-2400"] = not fFlagBuildDesktopReadinessModule,
			["size-full-2700"] = fFlagBuildDesktopReadinessModule,
			["aspect-1-1"] = p1.aspectRatio == "square",
			["aspect-16-9"] = p1.aspectRatio == "wide"
		}
	}, {
		Stroke = reactModule.createElement("UIStroke", {
			Color = var3,
			Transparency = var4,
			Thickness = var5,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		}),
		TouchArea = reactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 1,
			[reactModule.Event.Activated] = p1.onEmptySlotPressed or function() end
		}),
		PlusIcon = reactModule.createElement(view, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromScale(1, 1)
		}, {
			IconElement = reactModule.createElement(icon, {
				tag = "auto-xy content-default",
				name = iconName.PlusSmall,
				size = iconSize.Medium
			})
		})
	}))
end