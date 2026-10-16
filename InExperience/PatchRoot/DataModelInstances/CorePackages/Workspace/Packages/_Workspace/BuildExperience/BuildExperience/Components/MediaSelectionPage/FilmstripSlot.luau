local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Image = FoundationModule.Image
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Badge = FoundationModule.Badge
local Menu = FoundationModule.Menu
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeSize = FoundationModule.Enums.BadgeSize
local IconPosition = FoundationModule.Enums.IconPosition
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(script.Parent.types)

return function(Frame: Frame) --[[ Line: 48 | Named "FilmstripSlot" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseTokensFunction (copy), ReactModule (copy), Menu (copy), PopoverSide (copy), PopoverAlign (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), InputSize (copy), Image (copy), IconButton (copy), Badge (copy), IconPosition (copy), BadgeVariant (copy), BadgeShape (copy), BadgeSize (copy)
	local Video = UseLocalizationFunction({ video = LocalizationStringsModule.MEDIA_SELECTION_VIDEO }).video
	local UseTokensResult = UseTokensFunction()
	local EmphasisColor3 = if Frame.isSelected then UseTokensResult.Color.Content.Emphasis.Color3 else UseTokensResult.Color.Stroke.Default.Color3
	local Transparency = if Frame.isSelected then 0 else UseTokensResult.Color.Stroke.Default.Transparency
	local Thick = if Frame.isSelected then UseTokensResult.Stroke.Thick else UseTokensResult.Stroke.Standard
	
	return if Frame.isFilled then ReactModule.createElement(Menu, {
		isOpen = Frame.isMenuOpen or false,
		items = Frame.menuItems or { { items = {} } },
		side = PopoverSide.Top,
		align = PopoverAlign.Center,
		onPressedOutside = Frame.onMenuClose,
		onActivated = Frame.onMenuActivated,
		size = InputSize.Medium,
		LayoutOrder = Frame.LayoutOrder
	}, ReactModule.createElement(View, {
		tag = {
			["radius-large"] = true,
			["size-full-2700"] = true,
			["aspect-1-1"] = Frame.aspectRatio == "square",
			["aspect-16-9"] = Frame.aspectRatio == "wide"
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		Stroke = ReactModule.createElement("UIStroke", {
			Color = EmphasisColor3,
			Transparency = Transparency,
			Thickness = Thick,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		}),
		TouchArea = ReactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 2,
			[ReactModule.Event.Activated] = Frame.onSelect
		}),
		ImageClip = if Frame.isLoading then ReactModule.createElement(View, { tag = "size-full radius-large bg-surface-200" }) elseif Frame.assetSource and Frame.mediaType == "video" then ReactModule.createElement("VideoFrame", {
			Looped = false,
			Playing = false,
			Volume = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Video = Frame.assetSource
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) })
		}) elseif Frame.assetSource then ReactModule.createElement(View, { tag = "size-full radius-large clip" }, {
			Thumbnail = ReactModule.createElement(Image, {
				tag = "size-full radius-large",
				Image = Frame.assetSource,
				ScaleType = Enum.ScaleType.Crop
			})
		}) else nil,
		EditButton = if Frame.isSelected and Frame.onEditPressed then ReactModule.createElement(View, {
			tag = "auto-xy radius-circle bg-over-media-0 padding-xxsmall",
			ZIndex = 3,
			Position = UDim2.new(1, -UseTokensResult.Gap.Small, 0, UseTokensResult.Gap.Small),
			AnchorPoint = Vector2.new(1, 0)
		}, {
			Button = ReactModule.createElement(IconButton, {
				icon = IconName.Pencil,
				size = InputSize.XSmall,
				onActivated = Frame.onEditPressed
			})
		}) else nil,
		VideoBadge = if Frame.mediaType == "video" then ReactModule.createElement(Badge, {
			ZIndex = 3,
			Position = UDim2.fromOffset(UseTokensResult.Gap.Small, UseTokensResult.Gap.Small),
			icon = { name = IconName.PlaySmall, position = IconPosition.Left },
			text = Video,
			variant = BadgeVariant.OverMedia,
			shape = BadgeShape.Pill,
			size = BadgeSize.Small
		}) else nil
	})) else ReactModule.createElement(Menu, {
		tag = "size-full",
		isOpen = Frame.isMenuOpen or false,
		items = Frame.menuItems or { { items = {} } },
		side = PopoverSide.Top,
		align = PopoverAlign.Center,
		onPressedOutside = Frame.onMenuClose,
		onActivated = Frame.onMenuActivated,
		LayoutOrder = Frame.LayoutOrder
	}, ReactModule.createElement(View, {
		tag = {
			["radius-large"] = true,
			["bg-surface-200"] = true,
			["size-full-2700"] = true,
			["aspect-1-1"] = Frame.aspectRatio == "square",
			["aspect-16-9"] = Frame.aspectRatio == "wide"
		}
	}, {
		Stroke = ReactModule.createElement("UIStroke", {
			Color = EmphasisColor3,
			Transparency = Transparency,
			Thickness = Thick,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		}),
		TouchArea = ReactModule.createElement("TextButton", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			ZIndex = 1,
			[ReactModule.Event.Activated] = Frame.onEmptySlotPressed or function() --[[ Line: 93 ]] end
		}),
		PlusIcon = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center",
			Size = UDim2.fromScale(1, 1)
		}, {
			IconElement = ReactModule.createElement(Icon, {
				tag = "auto-xy content-default",
				name = IconName.PlusSmall,
				size = IconSize.Medium
			})
		})
	}))
end