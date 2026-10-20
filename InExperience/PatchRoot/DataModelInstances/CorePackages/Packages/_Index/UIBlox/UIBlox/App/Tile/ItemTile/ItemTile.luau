local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent.Parent
local Parent3 = Parent2.Parent
local ReactModule = require(Parent3.React)
local CryoModule = require(Parent3.Cryo)
local TModule = require(Parent3.t)
local ImagesModule = require(Parent2.App.ImageSet.Images)
local ItemRestrictionStatusModule = require(Parent.ItemRestrictionStatus)
local ItemTileStatusIconModule = require(Parent.ItemTileStatusIcon)
local ItemTileStatusModule = require(Parent.ItemTileStatus)
local ItemTileEnumsModule = require(Parent1.Enum.ItemTileEnums)
local ItemIconModule = require(Parent.ItemIcon)
local TileModule = require(Parent1.BaseTile.Tile)
local ItemTile = ReactModule.PureComponent:extend("ItemTile")

local function tileBannerUseValidator(Props)
	if Props.bannerText and Props.footer then
		return false, "A custom footer and bannerText can't be used together"
	else
		return true
	end
end

ItemTile.validateProps = TModule.strictInterface({
	footer = TModule.optional(TModule.table),
	name = TModule.optional(TModule.string),
	nameTextColor = TModule.optional(TModule.Color3),
	nameTextTransparency = TModule.optional(TModule.number),
	subtitle = TModule.optional(TModule.string),
	titleTextLineCount = TModule.optional(TModule.integer),
	innerPadding = TModule.optional(TModule.integer),
	titleTopPadding = TModule.optional(TModule.integer),
	subtitleTopPadding = TModule.optional(TModule.integer),
	footerTopPadding = TModule.optional(TModule.integer),
	onActivated = TModule.optional(TModule.callback),
	thumbnail = TModule.optional(TModule.string),
	backgroundImage = TModule.optional(TModule.union(TModule.string, TModule.table)),
	bannerText = TModule.optional(TModule.string),
	itemIconType = TModule.optional(ItemTileEnumsModule.ItemIconType.isEnumValue),
	isSelected = TModule.optional(TModule.boolean),
	Selectable = TModule.optional(TModule.boolean),
	multiSelect = TModule.optional(TModule.boolean),
	isPremium = TModule.optional(TModule.boolean),
	restrictionTypes = TModule.optional(TModule.map(ItemTileEnumsModule.Restriction.isEnumValue, TModule.boolean)),
	restrictionInfo = TModule.optional(TModule.table),
	hasRoundedCorners = TModule.optional(TModule.boolean),
	statusText = TModule.optional(TModule.string),
	statusStyle = TModule.optional(ItemTileEnumsModule.StatusStyle.isEnumValue),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	thumbnailRef = TModule.optional(TModule.table),
	textButtonRef = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table),
	useMaxTitleHeight = TModule.optional(TModule.boolean),
	addSubtitleSpace = TModule.optional(TModule.boolean),
	titleFontStyle = TModule.optional(TModule.table),
	renderTileInset = TModule.optional(TModule.callback),
	hasVerifiedBadge = TModule.optional(TModule.boolean),
	[ReactModule.Tag] = TModule.optional(TModule.string),
	aspectRatio = TModule.optional(TModule.number),
	scaleType = TModule.optional(TModule.enum(Enum.ScaleType)),
	onThumbnailLoaded = TModule.optional(TModule.callback),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
ItemTile.defaultProps = {
	titleTextLineCount = 2,
	innerPadding = 8,
	isSelected = false,
	multiSelect = false,
	isPremium = false,
	hasRoundedCorners = true,
	Selectable = false,
	isRoactGamepadEnabled = true
}

local function _(AlertIcon): boolean
	-- upvalues: ItemTileEnumsModule (copy)
	return AlertIcon == ItemTileEnumsModule.StatusStyle.PendingIcon or AlertIcon == ItemTileEnumsModule.StatusStyle.AlertIcon
end

function ItemTile.render(p1)
	-- upvalues: tileBannerUseValidator (copy), ReactModule (copy), ItemIconModule (copy), ItemRestrictionStatusModule (copy), ItemTileStatusModule (copy), ItemTileEnumsModule (copy), ItemTileStatusIconModule (copy), TileModule (copy), ImagesModule (copy)
	assert(tileBannerUseValidator(p1.props))
	local Footer = p1.props.footer
	local BannerText = p1.props.bannerText
	local HasRoundedCorners = p1.props.hasRoundedCorners
	local InnerPadding = p1.props.innerPadding
	local IsPremium = p1.props.isPremium
	local IsSelected = p1.props.isSelected
	local MultiSelect = p1.props.multiSelect
	local ItemIconType = p1.props.itemIconType
	local Name = p1.props.name
	local NameTextColor = p1.props.nameTextColor
	local NameTextTransparency = p1.props.nameTextTransparency
	local Subtitle = p1.props.subtitle
	local TitleTopPadding = p1.props.titleTopPadding
	local SubtitleTopPadding = p1.props.subtitleTopPadding
	local FooterTopPadding = p1.props.footerTopPadding
	local OnActivated = p1.props.onActivated
	local RestrictionInfo = p1.props.restrictionInfo
	local RestrictionTypes = p1.props.restrictionTypes
	local StatusStyle = p1.props.statusStyle
	local StatusText = p1.props.statusText
	local TitleTextLineCount = p1.props.titleTextLineCount
	local Thumbnail = p1.props.thumbnail
	local BackgroundImage = p1.props.backgroundImage
	local UseMaxTitleHeight = p1.props.useMaxTitleHeight
	local AddSubtitleSpace = p1.props.addSubtitleSpace
	local Selectable = p1.props.Selectable
	local TitleFontStyle = p1.props.titleFontStyle
	local RenderTileInset = p1.props.renderTileInset
	local AspectRatio = p1.props.aspectRatio
	local ScaleType = p1.props.scaleType
	local Flag = false
	local t = {}
	
	if ItemIconType then
		Flag = true
		t.ItemIconType = ReactModule.createElement(ItemIconModule, { itemIconType = ItemIconType })
	end
	if RestrictionTypes then
		Flag = true
		t.RestrictionStatus = ReactModule.createElement(ItemRestrictionStatusModule, {
			restrictionInfo = RestrictionInfo,
			restrictionTypes = RestrictionTypes
		})
	end
	if StatusText then
		Flag = true
		t.Status = ReactModule.createElement(ItemTileStatusModule, { statusStyle = StatusStyle, statusText = StatusText })
	end
	if StatusStyle == ItemTileEnumsModule.StatusStyle.PendingIcon or StatusStyle == ItemTileEnumsModule.StatusStyle.AlertIcon then
		Flag = true
		t.Status = ReactModule.createElement(ItemTileStatusIconModule, { statusStyle = StatusStyle })
	end
	return ReactModule.createElement(TileModule, {
		bannerText = BannerText,
		footer = Footer,
		hasRoundedCorners = HasRoundedCorners,
		innerPadding = InnerPadding,
		isSelected = IsSelected,
		Selectable = Selectable,
		multiSelect = MultiSelect,
		name = Name,
		nameTextColor = NameTextColor,
		nameTextTransparency = NameTextTransparency,
		subtitle = Subtitle,
		titleTopPadding = TitleTopPadding,
		subtitleTopPadding = SubtitleTopPadding,
		footerTopPadding = FooterTopPadding,
		onActivated = OnActivated,
		thumbnail = Thumbnail,
		backgroundImage = BackgroundImage,
		thumbnailOverlayComponents = Flag and t or nil,
		titleIcon = IsPremium and ImagesModule["icons/status/premium_small"] or nil,
		titleTextLineCount = TitleTextLineCount,
		useMaxTitleHeight = UseMaxTitleHeight,
		addSubtitleSpace = AddSubtitleSpace,
		titleFontStyle = TitleFontStyle,
		renderTileInset = RenderTileInset,
		thumbnailAspectRatio = AspectRatio,
		thumbnailScaleType = ScaleType,
		hasVerifiedBadge = p1.props.hasVerifiedBadge,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		textButtonRef = p1.props.textButtonRef,
		inputBindings = p1.props.inputBindings,
		ref = p1.props.thumbnailRef,
		[ReactModule.Tag] = p1.props[ReactModule.Tag],
		onThumbnailLoaded = p1.props.onThumbnailLoaded,
		isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
	})
end

return ReactModule.forwardRef(function(p1, ThumbnailRef)
	-- upvalues: ReactModule (copy), ItemTile (copy), CryoModule (copy)
	return ReactModule.createElement(ItemTile, CryoModule.Dictionary.join(p1, { thumbnailRef = ThumbnailRef }))
end)