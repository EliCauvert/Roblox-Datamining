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

local function tileBannerUseValidator(p0)
	if p0.bannerText and p0.footer then
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

function itemTile.render(p2)
	-- upvalues: tileBannerUseValidator (ref), reactModule (ref), itemIconModule (ref), itemRestrictionStatusModule (ref), itemTileStatusModule (ref), itemTileEnumsModule (ref), itemTileStatusIconModule (ref), tileModule (ref), imagesModule (ref)
	assert(tileBannerUseValidator(p2.props))
	local footer = p2.props.footer
	local bannerText = p2.props.bannerText
	local hasRoundedCorners = p2.props.hasRoundedCorners
	local innerPadding = p2.props.innerPadding
	local isPremium = p2.props.isPremium
	local isSelected = p2.props.isSelected
	local multiSelect = p2.props.multiSelect
	local itemIconType = p2.props.itemIconType
	local name = p2.props.name
	local nameTextColor = p2.props.nameTextColor
	local nameTextTransparency = p2.props.nameTextTransparency
	local subtitle = p2.props.subtitle
	local titleTopPadding = p2.props.titleTopPadding
	local subtitleTopPadding = p2.props.subtitleTopPadding
	local footerTopPadding = p2.props.footerTopPadding
	local onActivated = p2.props.onActivated
	local restrictionInfo = p2.props.restrictionInfo
	local restrictionTypes = p2.props.restrictionTypes
	local statusStyle = p2.props.statusStyle
	local statusText = p2.props.statusText
	local titleTextLineCount = p2.props.titleTextLineCount
	local thumbnail = p2.props.thumbnail
	local backgroundImage = p2.props.backgroundImage
	local useMaxTitleHeight = p2.props.useMaxTitleHeight
	local addSubtitleSpace = p2.props.addSubtitleSpace
	local selectable = p2.props.Selectable
	local titleFontStyle = p2.props.titleFontStyle
	local renderTileInset = p2.props.renderTileInset
	local aspectRatio = p2.props.aspectRatio
	local scaleType = p2.props.scaleType
	local var12 = false
	local t = {}
	
	if itemIconType then
		var12 = true
		t.ItemIconType = reactModule.createElement(itemIconModule, { itemIconType = itemIconType })
	end
	if restrictionTypes then
		var12 = true
		t.RestrictionStatus = reactModule.createElement(itemRestrictionStatusModule, {
			restrictionInfo = restrictionInfo,
			restrictionTypes = restrictionTypes
		})
	end
	if statusText then
		var12 = true
		t.Status = reactModule.createElement(itemTileStatusModule, { statusStyle = statusStyle, statusText = statusText })
	end
	if if statusStyle ~= itemTileEnumsModule.StatusStyle.PendingIcon then statusStyle == itemTileEnumsModule.StatusStyle.AlertIcon else true then
		var12 = true
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
		thumbnailOverlayComponents = if var12 then t else nil,
		titleIcon = if isPremium then imagesModule["icons/status/premium_small"] else nil,
		titleTextLineCount = titleTextLineCount,
		useMaxTitleHeight = useMaxTitleHeight,
		addSubtitleSpace = addSubtitleSpace,
		titleFontStyle = titleFontStyle,
		renderTileInset = renderTileInset,
		thumbnailAspectRatio = aspectRatio,
		thumbnailScaleType = scaleType,
		hasVerifiedBadge = p2.props.hasVerifiedBadge,
		NextSelectionLeft = p2.props.NextSelectionLeft,
		NextSelectionRight = p2.props.NextSelectionRight,
		NextSelectionUp = p2.props.NextSelectionUp,
		NextSelectionDown = p2.props.NextSelectionDown,
		textButtonRef = p2.props.textButtonRef,
		inputBindings = p2.props.inputBindings,
		ref = p2.props.thumbnailRef,
		[reactModule.Tag] = p2.props[reactModule.Tag],
		onThumbnailLoaded = p2.props.onThumbnailLoaded,
		isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled
	})
end

return reactModule.forwardRef(function(p3, p4)
	-- upvalues: reactModule (ref), itemTile (ref), cryoModule (ref)
	return reactModule.createElement(itemTile, cryoModule.Dictionary.join(p3, { thumbnailRef = p4 }))
end)