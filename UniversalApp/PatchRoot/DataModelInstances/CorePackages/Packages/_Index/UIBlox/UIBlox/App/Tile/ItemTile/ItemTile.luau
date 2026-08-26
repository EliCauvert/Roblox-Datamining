local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent.Parent
local parent_3 = parent_2.Parent
local reactModule = require(parent_3.React)
local cryoModule = require(parent_3.Cryo)
local tModule = require(parent_3.t)
local imagesModule = require(parent_2.App.ImageSet.Images)
local itemRestrictionStatusModule = require(parent.ItemRestrictionStatus)
local itemTileStatusIconModule = require(parent.ItemTileStatusIcon)
local itemTileStatusModule = require(parent.ItemTileStatus)
local itemTileEnumsModule = require(parent_1.Enum.ItemTileEnums)
local itemIconModule = require(parent.ItemIcon)
local tileModule = require(parent_1.BaseTile.Tile)
local itemTile = reactModule.PureComponent:extend("ItemTile")

local function tileBannerUseValidator(p1)
	if p1.bannerText and p1.footer then
		return false, "A custom footer and bannerText can't be used together"
	end
	return true
end

itemTile.validateProps = tModule.strictInterface({
	footer = tModule.optional(tModule.table),
	name = tModule.optional(tModule.string),
	nameTextColor = tModule.optional(tModule.Color3),
	nameTextTransparency = tModule.optional(tModule.number),
	subtitle = tModule.optional(tModule.string),
	titleTextLineCount = tModule.optional(tModule.integer),
	innerPadding = tModule.optional(tModule.integer),
	titleTopPadding = tModule.optional(tModule.integer),
	subtitleTopPadding = tModule.optional(tModule.integer),
	footerTopPadding = tModule.optional(tModule.integer),
	onActivated = tModule.optional(tModule.callback),
	thumbnail = tModule.optional(tModule.string),
	backgroundImage = tModule.optional(tModule.union(tModule.string, tModule.table)),
	bannerText = tModule.optional(tModule.string),
	itemIconType = tModule.optional(itemTileEnumsModule.ItemIconType.isEnumValue),
	isSelected = tModule.optional(tModule.boolean),
	Selectable = tModule.optional(tModule.boolean),
	multiSelect = tModule.optional(tModule.boolean),
	isPremium = tModule.optional(tModule.boolean),
	restrictionTypes = tModule.optional(tModule.map(itemTileEnumsModule.Restriction.isEnumValue, tModule.boolean)),
	restrictionInfo = tModule.optional(tModule.table),
	hasRoundedCorners = tModule.optional(tModule.boolean),
	statusText = tModule.optional(tModule.string),
	statusStyle = tModule.optional(itemTileEnumsModule.StatusStyle.isEnumValue),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	thumbnailRef = tModule.optional(tModule.table),
	textButtonRef = tModule.optional(tModule.table),
	inputBindings = tModule.optional(tModule.table),
	useMaxTitleHeight = tModule.optional(tModule.boolean),
	addSubtitleSpace = tModule.optional(tModule.boolean),
	titleFontStyle = tModule.optional(tModule.table),
	renderTileInset = tModule.optional(tModule.callback),
	hasVerifiedBadge = tModule.optional(tModule.boolean),
	[reactModule.Tag] = tModule.optional(tModule.string),
	aspectRatio = tModule.optional(tModule.number),
	scaleType = tModule.optional(tModule.enum(Enum.ScaleType)),
	onThumbnailLoaded = tModule.optional(tModule.callback),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
itemTile.defaultProps = {
	titleTextLineCount = 2,
	innerPadding = 8,
	isSelected = false,
	multiSelect = false,
	isPremium = false,
	hasRoundedCorners = true,
	Selectable = false,
	isRoactGamepadEnabled = true
}

local function _(p1)
	-- upvalues: itemTileEnumsModule (ref)
	return if p1 ~= itemTileEnumsModule.StatusStyle.PendingIcon then p1 == itemTileEnumsModule.StatusStyle.AlertIcon else true
end

function itemTile.render(p1)
	-- upvalues: tileBannerUseValidator (ref), reactModule (ref), itemIconModule (ref), itemRestrictionStatusModule (ref), itemTileStatusModule (ref), itemTileEnumsModule (ref), itemTileStatusIconModule (ref), tileModule (ref), imagesModule (ref)
	assert(tileBannerUseValidator(p1.props))
	local footer = p1.props.footer
	local bannerText = p1.props.bannerText
	local hasRoundedCorners = p1.props.hasRoundedCorners
	local innerPadding = p1.props.innerPadding
	local isPremium = p1.props.isPremium
	local isSelected = p1.props.isSelected
	local multiSelect = p1.props.multiSelect
	local itemIconType = p1.props.itemIconType
	local name = p1.props.name
	local nameTextColor = p1.props.nameTextColor
	local nameTextTransparency = p1.props.nameTextTransparency
	local subtitle = p1.props.subtitle
	local titleTopPadding = p1.props.titleTopPadding
	local subtitleTopPadding = p1.props.subtitleTopPadding
	local footerTopPadding = p1.props.footerTopPadding
	local onActivated = p1.props.onActivated
	local restrictionInfo = p1.props.restrictionInfo
	local restrictionTypes = p1.props.restrictionTypes
	local statusStyle = p1.props.statusStyle
	local statusText = p1.props.statusText
	local titleTextLineCount = p1.props.titleTextLineCount
	local thumbnail = p1.props.thumbnail
	local backgroundImage = p1.props.backgroundImage
	local useMaxTitleHeight = p1.props.useMaxTitleHeight
	local addSubtitleSpace = p1.props.addSubtitleSpace
	local selectable = p1.props.Selectable
	local titleFontStyle = p1.props.titleFontStyle
	local renderTileInset = p1.props.renderTileInset
	local aspectRatio = p1.props.aspectRatio
	local scaleType = p1.props.scaleType
	local var1 = false
	local t = {}
	
	if itemIconType then
		var1 = true
		t.ItemIconType = reactModule.createElement(itemIconModule, { itemIconType = itemIconType })
	end
	if restrictionTypes then
		var1 = true
		t.RestrictionStatus = reactModule.createElement(itemRestrictionStatusModule, {
			restrictionInfo = restrictionInfo,
			restrictionTypes = restrictionTypes
		})
	end
	if statusText then
		var1 = true
		t.Status = reactModule.createElement(itemTileStatusModule, { statusStyle = statusStyle, statusText = statusText })
	end
	if if statusStyle ~= itemTileEnumsModule.StatusStyle.PendingIcon then statusStyle == itemTileEnumsModule.StatusStyle.AlertIcon else true then
		var1 = true
		t.Status = reactModule.createElement(itemTileStatusIconModule, { statusStyle = statusStyle })
	end
	return reactModule.createElement(tileModule, {
		bannerText = bannerText,
		footer = footer,
		hasRoundedCorners = hasRoundedCorners,
		innerPadding = innerPadding,
		isSelected = isSelected,
		Selectable = selectable,
		multiSelect = multiSelect,
		name = name,
		nameTextColor = nameTextColor,
		nameTextTransparency = nameTextTransparency,
		subtitle = subtitle,
		titleTopPadding = titleTopPadding,
		subtitleTopPadding = subtitleTopPadding,
		footerTopPadding = footerTopPadding,
		onActivated = onActivated,
		thumbnail = thumbnail,
		backgroundImage = backgroundImage,
		thumbnailOverlayComponents = if var1 then t else nil,
		titleIcon = if isPremium then imagesModule["icons/status/premium_small"] else nil,
		titleTextLineCount = titleTextLineCount,
		useMaxTitleHeight = useMaxTitleHeight,
		addSubtitleSpace = addSubtitleSpace,
		titleFontStyle = titleFontStyle,
		renderTileInset = renderTileInset,
		thumbnailAspectRatio = aspectRatio,
		thumbnailScaleType = scaleType,
		hasVerifiedBadge = p1.props.hasVerifiedBadge,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		textButtonRef = p1.props.textButtonRef,
		inputBindings = p1.props.inputBindings,
		ref = p1.props.thumbnailRef,
		[reactModule.Tag] = p1.props[reactModule.Tag],
		onThumbnailLoaded = p1.props.onThumbnailLoaded,
		isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
	})
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), itemTile (ref), cryoModule (ref)
	return reactModule.createElement(itemTile, cryoModule.Dictionary.join(p1, { thumbnailRef = p2 }))
end)