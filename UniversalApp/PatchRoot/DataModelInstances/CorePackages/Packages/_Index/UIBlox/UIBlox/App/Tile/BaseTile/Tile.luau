local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactGamepadModule = require(parent_3.RoactGamepad)
local reactModule = require(parent_3.React)
local cryoModule = require(parent_3.Cryo)
local tModule = require(parent_3.t)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local validateFontInfoModule = require(parent_2.Core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent_2.Core.Style.Validator.validateTypographyInfo)
local getTextSizeModule = require(parent_2.Core.Text.GetTextSize)
local getWrappedTextWithIconModule = require(parent_2.Core.Text.GetWrappedTextWithIcon)
local withTextSizeOffsetModule = require(parent_2.Core.Style.withTextSizeOffset)
local cursorKindModule = require(parent_1.SelectionImage.CursorKind)
local withSelectionCursorProviderModule = require(parent_1.SelectionImage.withSelectionCursorProvider)
local useCursorModule = require(parent_2.App.SelectionCursor.useCursor)
local tileNameModule = require(parent.TileName)
local tileThumbnailModule = require(parent.TileThumbnail)
local tileBannerModule = require(parent.TileBanner)
local styledTextLabelModule = require(parent_1.Text.StyledTextLabel)
local imagesModule = require(parent_2.App.ImageSet.Images)
local interactableModule = require(parent_2.Core.Control.Interactable)
local uDim = UDim.new(0, 10)
local tile = reactModule.PureComponent:extend("Tile")
tile.validateProps = tModule.intersection(tModule.strictInterface({
	footer = tModule.optional(tModule.table),
	name = tModule.optional(tModule.string),
	nameTextColor = tModule.optional(tModule.Color3),
	nameTextTransparency = tModule.optional(tModule.number),
	nameOverThumbnail = tModule.optional(tModule.boolean),
	titleRichText = tModule.optional(tModule.boolean),
	subtitle = tModule.optional(tModule.string),
	hasVerifiedBadge = tModule.optional(tModule.boolean),
	titleTextLineCount = tModule.optional(tModule.integer),
	innerPadding = tModule.optional(tModule.number),
	titleTopPadding = tModule.optional(tModule.number),
	subtitleTopPadding = tModule.optional(tModule.number),
	footerTopPadding = tModule.optional(tModule.number),
	onActivated = tModule.optional(tModule.callback),
	thumbnail = tModule.optional(tModule.union(tModule.string, tModule.table)),
	thumbnailSize = tModule.optional(tModule.UDim2),
	thumbnailFrameSize = tModule.optional(tModule.UDim2),
	thumbnailColor = tModule.optional(tModule.Color3),
	thumbnailTransparency = tModule.optional(tModule.number),
	thumbnailAspectRatio = tModule.optional(tModule.number),
	thumbnailScaleType = tModule.optional(tModule.enum(Enum.ScaleType)),
	bannerText = tModule.optional(tModule.string),
	backgroundImage = tModule.optional(tModule.union(tModule.string, tModule.table)),
	isSelected = tModule.optional(tModule.boolean),
	Selectable = tModule.optional(tModule.boolean),
	multiSelect = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	hasRoundedCorners = tModule.optional(tModule.boolean),
	titleIcon = tModule.optional(tModule.table),
	thumbnailOverlayComponents = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	thumbnailRef = tModule.optional(tModule.table),
	textButtonRef = tModule.optional(tModule.table),
	inputBindings = tModule.optional(tModule.table),
	useMaxTitleHeight = tModule.optional(tModule.boolean),
	addSubtitleSpace = tModule.optional(tModule.boolean),
	titleFontStyle = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	subtitleFontStyle = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	renderTileInset = tModule.optional(tModule.callback),
	[reactModule.Tag] = tModule.optional(tModule.string),
	cursor = tModule.optional(tModule.any),
	isCircular = tModule.optional(tModule.boolean),
	horizontalAlignment = tModule.optional(tModule.EnumItem),
	openTypeFeatures = tModule.optional(tModule.string),
	onThumbnailLoaded = tModule.optional(tModule.callback),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
}), function(p1)
	if p1.bannerText and p1.footer then
		return false, "A custom footer and bannerText can't be used together"
	end
	return true
end)
tile.defaultProps = {
	titleTextLineCount = 2,
	innerPadding = 8,
	titleTopPadding = 0,
	subtitleTopPadding = 0,
	footerTopPadding = 0,
	isSelected = false,
	multiSelect = false,
	isDisabled = false,
	hasRoundedCorners = true,
	Selectable = false,
	isCircular = false,
	horizontalAlignment = nil,
	titleRichText = false,
	isRoactGamepadEnabled = true,
	thumbnailFrameSize = UDim2.new(1, 0, 1, 0)
}

function tile.init(p1)
	p1.state = { tileWidth = 0, tileHeight = 0 }
	
	function p1.onAbsoluteSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState({
			tileWidth = p2.AbsoluteSize.X,
			tileHeight = p2.AbsoluteSize.Y
		})
	end
end

function tile.render(p1)
	-- upvalues: withTextSizeOffsetModule (ref), withStyleModule (ref), withSelectionCursorProviderModule (ref), imagesModule (ref), getWrappedTextWithIconModule (ref), getTextSizeModule (ref), reactModule (ref), roactGamepadModule (ref), interactableModule (ref), cursorKindModule (ref), tileThumbnailModule (ref), uDim (ref), tileNameModule (ref), styledTextLabelModule (ref), tileBannerModule (ref)
	local footer = p1.props.footer
	local name = p1.props.name
	local subtitle = p1.props.subtitle
	local hasVerifiedBadge = p1.props.hasVerifiedBadge
	local titleTextLineCount = p1.props.titleTextLineCount
	local innerPadding = p1.props.innerPadding
	local titleTopPadding = p1.props.titleTopPadding
	local subtitleTopPadding = p1.props.subtitleTopPadding
	local footerTopPadding = p1.props.footerTopPadding
	local onActivated = p1.props.onActivated
	local thumbnail = p1.props.thumbnail
	local thumbnailSize = p1.props.thumbnailSize
	local thumbnailFrameSize = p1.props.thumbnailFrameSize
	local thumbnailColor = p1.props.thumbnailColor
	local thumbnailTransparency = p1.props.thumbnailTransparency
	local bannerText = p1.props.bannerText
	local hasRoundedCorners = p1.props.hasRoundedCorners
	local isSelected = p1.props.isSelected
	local multiSelect = p1.props.multiSelect
	local isDisabled = p1.props.isDisabled
	local titleIcon = p1.props.titleIcon
	local thumbnailOverlayComponents = p1.props.thumbnailOverlayComponents
	local backgroundImage = p1.props.backgroundImage
	local useMaxTitleHeight = p1.props.useMaxTitleHeight
	local addSubtitleSpace = p1.props.addSubtitleSpace
	local horizontalAlignment = p1.props.horizontalAlignment
	
	return withTextSizeOffsetModule(function(p2)
		-- upvalues: withStyleModule (copy), withSelectionCursorProviderModule (copy), p1 (ref), titleTextLineCount (ref), innerPadding (ref), titleTopPadding (ref), addSubtitleSpace (ref), useMaxTitleHeight (ref), name (ref), titleIcon (ref), imagesModule (copy), getWrappedTextWithIconModule (copy), getTextSizeModule (copy), subtitle (ref), footer (ref), bannerText (ref), reactModule (copy), isDisabled (ref), onActivated (ref), roactGamepadModule (copy), interactableModule (copy), cursorKindModule (copy), horizontalAlignment (ref), thumbnailFrameSize (ref), tileThumbnailModule (copy), thumbnail (ref), hasRoundedCorners (ref), uDim (copy), isSelected (ref), multiSelect (ref), thumbnailOverlayComponents (ref), thumbnailSize (ref), thumbnailColor (ref), thumbnailTransparency (ref), backgroundImage (ref), subtitleTopPadding (ref), tileNameModule (copy), hasVerifiedBadge (ref), styledTextLabelModule (copy), footerTopPadding (ref), tileBannerModule (copy)
		return withStyleModule(function(p3)
			-- upvalues: withSelectionCursorProviderModule (copy), p1 (copy), titleTextLineCount (copy), p2 (ref), innerPadding (copy), titleTopPadding (copy), addSubtitleSpace (copy), useMaxTitleHeight (copy), name (copy), titleIcon (copy), imagesModule (copy), getWrappedTextWithIconModule (copy), getTextSizeModule (copy), subtitle (copy), footer (copy), bannerText (copy), reactModule (copy), isDisabled (copy), onActivated (copy), roactGamepadModule (copy), interactableModule (copy), cursorKindModule (copy), horizontalAlignment (copy), thumbnailFrameSize (copy), tileThumbnailModule (copy), thumbnail (copy), hasRoundedCorners (copy), uDim (copy), isSelected (copy), multiSelect (copy), thumbnailOverlayComponents (copy), thumbnailSize (copy), thumbnailColor (copy), thumbnailTransparency (copy), backgroundImage (copy), subtitleTopPadding (copy), tileNameModule (copy), hasVerifiedBadge (copy), styledTextLabelModule (copy), footerTopPadding (copy), tileBannerModule (copy)
			return withSelectionCursorProviderModule(function(p4)
				-- upvalues: p3 (ref), p1 (copy), titleTextLineCount (copy), p2 (copy), innerPadding (copy), titleTopPadding (copy), addSubtitleSpace (copy), useMaxTitleHeight (copy), name (copy), titleIcon (copy), imagesModule (copy), getWrappedTextWithIconModule (copy), getTextSizeModule (copy), subtitle (copy), footer (copy), bannerText (copy), reactModule (copy), isDisabled (copy), onActivated (copy), roactGamepadModule (copy), interactableModule (copy), cursorKindModule (copy), horizontalAlignment (copy), thumbnailFrameSize (copy), tileThumbnailModule (copy), thumbnail (copy), hasRoundedCorners (copy), uDim (copy), isSelected (copy), multiSelect (copy), thumbnailOverlayComponents (copy), thumbnailSize (copy), thumbnailColor (copy), thumbnailTransparency (copy), backgroundImage (copy), subtitleTopPadding (copy), tileNameModule (copy), hasVerifiedBadge (copy), styledTextLabelModule (copy), footerTopPadding (copy), tileBannerModule (copy)
				local vector2
				local font = p3.Font
				local theme = p3.Theme
				local tileHeight = p1.state.tileHeight
				local tileWidth = p1.state.tileWidth
				local titleFontStyle = p1.props.titleFontStyle or font.Header2
				local titleRichText = p1.props.titleRichText
				local subtitleFontStyle = p1.props.subtitleFontStyle or font.CaptionHeader
				local var1 = if titleFontStyle.RelativeSize then font.BaseSize * titleFontStyle.RelativeSize else titleFontStyle.FontSize
				local var2 = if subtitleFontStyle.RelativeSize then font.BaseSize * subtitleFontStyle.RelativeSize else subtitleFontStyle.FontSize
				local _ = math.ceil(var1 * titleTextLineCount)
				local ceiled = math.ceil((var1 + p2) * titleTextLineCount)
				ceiled = tileHeight - tileWidth / (p1.props.thumbnailAspectRatio or 1) - innerPadding - ceiled - innerPadding - titleTopPadding
				local _ = Vector2.new(0, 0)
				local var3 = 0
				
				if addSubtitleSpace then
					vector2 = Vector2.new(0, ceiled)
					var3 = math.ceil(var2) + p2
					ceiled -= var3
				elseif useMaxTitleHeight then
					vector2 = Vector2.new(0, ceiled)
				else
					local name_1 = name or ""
					local font_1 = titleFontStyle.Font
					
					if titleIcon then
						name_1 = getWrappedTextWithIconModule(name_1, var1, font_1, titleIcon.ImageRectSize.X / imagesModule.ImagesResolutionScale, 4)
					end
					local var4 = getTextSizeModule(name_1, var1, font_1, Vector2.new(tileWidth, ceiled))
					vector2 = Vector2.new(var4.X, math.min(var4.Y, ceiled))
				end
				if subtitle ~= nil and subtitle ~= "" then
					var3 = math.ceil(var2) + p2
					ceiled -= var3
				end
				local maxValue = math.max(0, ceiled)
				local var5 = if footer == nil then bannerText ~= nil else true
				local renderTileInset = p1.props.renderTileInset
				local uDim2 = UDim2.new(1, 0, 0, vector2.Y + var3 + titleTopPadding)
				local UIPadding = nil
				
				if p1.props.nameOverThumbnail then
					uDim2 = UDim2.new(0, tileWidth - 10, 0, -(vector2.Y + 20))
					UIPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 10) })
				end
				local inputBindings = p1.props.inputBindings
				
				if not inputBindings then
					local t
					if not isDisabled and onActivated then
						t = {
							Activate = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, onActivated)
						}
						
						if not t then
							t = nil
						end
						inputBindings = t
					end
				end
				return reactModule.createElement(interactableModule, {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Selectable = p1.props.Selectable,
					[reactModule.Event.Activated] = if isDisabled then nil else onActivated,
					[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange,
					ref = p1.props.textButtonRef,
					SelectionImageObject = if p1.props.cursor then p1.props.cursor else p4(cursorKindModule.RoundedRect)
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, innerPadding),
						HorizontalAlignment = if not p1.props.nameOverThumbnail then horizontalAlignment else nil
					}),
					Thumbnail = reactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
						Size = thumbnailFrameSize,
						SizeConstraint = Enum.SizeConstraint.RelativeXX,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						NextSelectionLeft = p1.props.NextSelectionLeft,
						NextSelectionRight = p1.props.NextSelectionRight,
						NextSelectionUp = p1.props.NextSelectionUp,
						NextSelectionDown = p1.props.NextSelectionDown,
						ref = p1.props.thumbnailRef,
						[reactModule.Tag] = p1.props[reactModule.Tag],
						SelectionImageObject = if p1.props.cursor then p1.props.cursor else p4(cursorKindModule.RoundedRectNoInset),
						inputBindings = if p1.props.isRoactGamepadEnabled then inputBindings else nil
					}, {
						Image = reactModule.createElement(tileThumbnailModule, {
							Image = thumbnail,
							hasRoundedCorners = hasRoundedCorners,
							cornerRadius = if p1.props.isCircular then UDim.new(0.5, 0) else uDim,
							isSelected = isSelected,
							multiSelect = multiSelect,
							overlayComponents = thumbnailOverlayComponents,
							imageSize = thumbnailSize,
							imageColor = thumbnailColor,
							imageTransparency = thumbnailTransparency,
							backgroundImage = backgroundImage,
							scaleType = p1.props.thumbnailScaleType,
							onThumbnailLoaded = p1.props.onThumbnailLoaded
						}),
						TileInset = renderTileInset and renderTileInset() or nil,
						UIAspectRatioConstraint = if p1.props.thumbnailAspectRatio ~= nil then nil else reactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = p1.props.thumbnailAspectRatio,
							AspectType = Enum.AspectType.ScaleWithParentSize
						})
					}),
					TitleArea = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = uDim2
					}, {
						TitleTopPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, titleTopPadding) }),
						UIListLayout = reactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, subtitleTopPadding),
							HorizontalAlignment = horizontalAlignment
						}),
						NameOverThumbnailPadding = UIPadding,
						Name = titleTextLineCount > 0 and (tileWidth > 0 and reactModule.createElement(tileNameModule, {
							LayoutOrder = 1,
							titleIcon = titleIcon,
							name = name,
							nameTextColor = p1.props.nameTextColor,
							nameTextTransparency = p1.props.nameTextTransparency,
							hasVerifiedBadge = hasVerifiedBadge,
							maxHeight = ceiled,
							maxWidth = tileWidth,
							useMaxHeight = useMaxTitleHeight,
							titleFontStyle = titleFontStyle,
							richText = titleRichText,
							horizontalAlignment = horizontalAlignment
						})),
						Subtitle = subtitle ~= "" and (subtitle ~= nil and reactModule.createElement(styledTextLabelModule, {
							layoutOrder = 2,
							fluidSizing = false,
							richText = false,
							lineHeight = 1,
							size = UDim2.new(0, 0, 0, var3),
							automaticSize = Enum.AutomaticSize.X,
							text = subtitle,
							colorStyle = theme.TextDefault,
							fontStyle = subtitleFontStyle,
							openTypeFeatures = p1.props.openTypeFeatures,
							textTruncate = Enum.TextTruncate.AtEnd
						}))
					}),
					FooterContainer = var5 and reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, maxValue)
					}, {
						FooterTopPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, footerTopPadding) }),
						Banner = bannerText and reactModule.createElement(tileBannerModule, { bannerText = bannerText }),
						Footer = not bannerText and footer
					})
				})
			end)
		end)
	end)
end

local var1 = function(p1)
	-- upvalues: useCursorModule (ref), uDim (ref), cryoModule (ref), reactModule (ref), tile (ref)
	return reactModule.createElement(tile, cryoModule.Dictionary.join({ cursor = useCursorModule(uDim) }, p1))
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), var1 (ref), cryoModule (ref)
	return reactModule.createElement(var1, cryoModule.Dictionary.join(p1, { thumbnailRef = p2 }))
end)