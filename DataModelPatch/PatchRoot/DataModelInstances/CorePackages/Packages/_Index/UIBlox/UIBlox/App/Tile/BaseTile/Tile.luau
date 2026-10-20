local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactGamepadModule = require(Parent3.RoactGamepad)
local ReactModule = require(Parent3.React)
local CryoModule = require(Parent3.Cryo)
local TModule = require(Parent3.t)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ValidateFontInfoModule = require(Parent2.Core.Style.Validator.validateFontInfo)
local ValidateTypographyInfoModule = require(Parent2.Core.Style.Validator.validateTypographyInfo)
local GetTextSizeModule = require(Parent2.Core.Text.GetTextSize)
local GetWrappedTextWithIconModule = require(Parent2.Core.Text.GetWrappedTextWithIcon)
local WithTextSizeOffsetModule = require(Parent2.Core.Style.withTextSizeOffset)
local CursorKindModule = require(Parent1.SelectionImage.CursorKind)
local WithSelectionCursorProviderModule = require(Parent1.SelectionImage.withSelectionCursorProvider)
local UseCursorModule = require(Parent2.App.SelectionCursor.useCursor)
local TileNameModule = require(Parent.TileName)
local TileThumbnailModule = require(Parent.TileThumbnail)
local TileBannerModule = require(Parent.TileBanner)
local StyledTextLabelModule = require(Parent1.Text.StyledTextLabel)
local ImagesModule = require(Parent2.App.ImageSet.Images)
local InteractableModule = require(Parent2.Core.Control.Interactable)
local _UDim = UDim.new(0, 10)
local Tile = ReactModule.PureComponent:extend("Tile")
Tile.validateProps = TModule.intersection(TModule.strictInterface({
	footer = TModule.optional(TModule.table),
	name = TModule.optional(TModule.string),
	nameTextColor = TModule.optional(TModule.Color3),
	nameTextTransparency = TModule.optional(TModule.number),
	nameOverThumbnail = TModule.optional(TModule.boolean),
	titleRichText = TModule.optional(TModule.boolean),
	subtitle = TModule.optional(TModule.string),
	hasVerifiedBadge = TModule.optional(TModule.boolean),
	titleTextLineCount = TModule.optional(TModule.integer),
	innerPadding = TModule.optional(TModule.number),
	titleTopPadding = TModule.optional(TModule.number),
	subtitleTopPadding = TModule.optional(TModule.number),
	footerTopPadding = TModule.optional(TModule.number),
	onActivated = TModule.optional(TModule.callback),
	thumbnail = TModule.optional(TModule.union(TModule.string, TModule.table)),
	thumbnailSize = TModule.optional(TModule.UDim2),
	thumbnailFrameSize = TModule.optional(TModule.UDim2),
	thumbnailColor = TModule.optional(TModule.Color3),
	thumbnailTransparency = TModule.optional(TModule.number),
	thumbnailAspectRatio = TModule.optional(TModule.number),
	thumbnailScaleType = TModule.optional(TModule.enum(Enum.ScaleType)),
	bannerText = TModule.optional(TModule.string),
	backgroundImage = TModule.optional(TModule.union(TModule.string, TModule.table)),
	isSelected = TModule.optional(TModule.boolean),
	Selectable = TModule.optional(TModule.boolean),
	multiSelect = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	hasRoundedCorners = TModule.optional(TModule.boolean),
	titleIcon = TModule.optional(TModule.table),
	thumbnailOverlayComponents = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	thumbnailRef = TModule.optional(TModule.table),
	textButtonRef = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table),
	useMaxTitleHeight = TModule.optional(TModule.boolean),
	addSubtitleSpace = TModule.optional(TModule.boolean),
	titleFontStyle = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule)),
	subtitleFontStyle = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule)),
	renderTileInset = TModule.optional(TModule.callback),
	[ReactModule.Tag] = TModule.optional(TModule.string),
	cursor = TModule.optional(TModule.any),
	isCircular = TModule.optional(TModule.boolean),
	horizontalAlignment = TModule.optional(TModule.EnumItem),
	openTypeFeatures = TModule.optional(TModule.string),
	onThumbnailLoaded = TModule.optional(TModule.callback),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
}), function(p1)
	if p1.bannerText and p1.footer then
		return false, "A custom footer and bannerText can't be used together"
	else
		return true
	end
end)
Tile.defaultProps = {
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

function Tile.init(p1)
	p1.state = { tileWidth = 0, tileHeight = 0 }
	
	function p1.onAbsoluteSizeChange(Frame: Frame)
		-- upvalues: p1 (copy)
		p1:setState({
			tileWidth = Frame.AbsoluteSize.X,
			tileHeight = Frame.AbsoluteSize.Y
		})
	end
end

function Tile.render(p1)
	-- upvalues: WithTextSizeOffsetModule (copy), WithStyleModule (copy), WithSelectionCursorProviderModule (copy), ImagesModule (copy), GetWrappedTextWithIconModule (copy), GetTextSizeModule (copy), ReactModule (copy), RoactGamepadModule (copy), InteractableModule (copy), CursorKindModule (copy), TileThumbnailModule (copy), _UDim (copy), TileNameModule (copy), StyledTextLabelModule (copy), TileBannerModule (copy)
	local Footer = p1.props.footer
	local Name = p1.props.name
	local Subtitle = p1.props.subtitle
	local HasVerifiedBadge = p1.props.hasVerifiedBadge
	local TitleTextLineCount = p1.props.titleTextLineCount
	local InnerPadding = p1.props.innerPadding
	local TitleTopPadding = p1.props.titleTopPadding
	local SubtitleTopPadding = p1.props.subtitleTopPadding
	local FooterTopPadding = p1.props.footerTopPadding
	local OnActivated = p1.props.onActivated
	local Thumbnail = p1.props.thumbnail
	local ThumbnailSize = p1.props.thumbnailSize
	local ThumbnailFrameSize = p1.props.thumbnailFrameSize
	local ThumbnailColor = p1.props.thumbnailColor
	local ThumbnailTransparency = p1.props.thumbnailTransparency
	local BannerText = p1.props.bannerText
	local HasRoundedCorners = p1.props.hasRoundedCorners
	local IsSelected = p1.props.isSelected
	local MultiSelect = p1.props.multiSelect
	local IsDisabled = p1.props.isDisabled
	local TitleIcon = p1.props.titleIcon
	local ThumbnailOverlayComponents = p1.props.thumbnailOverlayComponents
	local BackgroundImage = p1.props.backgroundImage
	local UseMaxTitleHeight = p1.props.useMaxTitleHeight
	local AddSubtitleSpace = p1.props.addSubtitleSpace
	local HorizontalAlignment = p1.props.horizontalAlignment
	
	return WithTextSizeOffsetModule(function(p2)
		-- upvalues: WithStyleModule (upval), WithSelectionCursorProviderModule (upval), p1 (copy), TitleTextLineCount (copy), InnerPadding (copy), TitleTopPadding (copy), AddSubtitleSpace (copy), UseMaxTitleHeight (copy), Name (copy), TitleIcon (copy), ImagesModule (upval), GetWrappedTextWithIconModule (upval), GetTextSizeModule (upval), Subtitle (copy), Footer (copy), BannerText (copy), ReactModule (upval), IsDisabled (copy), OnActivated (copy), RoactGamepadModule (upval), InteractableModule (upval), CursorKindModule (upval), HorizontalAlignment (copy), ThumbnailFrameSize (copy), TileThumbnailModule (upval), Thumbnail (copy), HasRoundedCorners (copy), _UDim (upval), IsSelected (copy), MultiSelect (copy), ThumbnailOverlayComponents (copy), ThumbnailSize (copy), ThumbnailColor (copy), ThumbnailTransparency (copy), BackgroundImage (copy), SubtitleTopPadding (copy), TileNameModule (upval), HasVerifiedBadge (copy), StyledTextLabelModule (upval), FooterTopPadding (copy), TileBannerModule (upval)
		return WithStyleModule(function(p3)
			-- upvalues: WithSelectionCursorProviderModule (upval), p1 (upval), TitleTextLineCount (upval), p2 (copy), InnerPadding (upval), TitleTopPadding (upval), AddSubtitleSpace (upval), UseMaxTitleHeight (upval), Name (upval), TitleIcon (upval), ImagesModule (upval), GetWrappedTextWithIconModule (upval), GetTextSizeModule (upval), Subtitle (upval), Footer (upval), BannerText (upval), ReactModule (upval), IsDisabled (upval), OnActivated (upval), RoactGamepadModule (upval), InteractableModule (upval), CursorKindModule (upval), HorizontalAlignment (upval), ThumbnailFrameSize (upval), TileThumbnailModule (upval), Thumbnail (upval), HasRoundedCorners (upval), _UDim (upval), IsSelected (upval), MultiSelect (upval), ThumbnailOverlayComponents (upval), ThumbnailSize (upval), ThumbnailColor (upval), ThumbnailTransparency (upval), BackgroundImage (upval), SubtitleTopPadding (upval), TileNameModule (upval), HasVerifiedBadge (upval), StyledTextLabelModule (upval), FooterTopPadding (upval), TileBannerModule (upval)
			return WithSelectionCursorProviderModule(function(Callback)
				-- upvalues: p3 (copy), p1 (upval), TitleTextLineCount (upval), p2 (upval), InnerPadding (upval), TitleTopPadding (upval), AddSubtitleSpace (upval), UseMaxTitleHeight (upval), Name (upval), TitleIcon (upval), ImagesModule (upval), GetWrappedTextWithIconModule (upval), GetTextSizeModule (upval), Subtitle (upval), Footer (upval), BannerText (upval), ReactModule (upval), IsDisabled (upval), OnActivated (upval), RoactGamepadModule (upval), InteractableModule (upval), CursorKindModule (upval), HorizontalAlignment (upval), ThumbnailFrameSize (upval), TileThumbnailModule (upval), Thumbnail (upval), HasRoundedCorners (upval), _UDim (upval), IsSelected (upval), MultiSelect (upval), ThumbnailOverlayComponents (upval), ThumbnailSize (upval), ThumbnailColor (upval), ThumbnailTransparency (upval), BackgroundImage (upval), SubtitleTopPadding (upval), TileNameModule (upval), HasVerifiedBadge (upval), StyledTextLabelModule (upval), FooterTopPadding (upval), TileBannerModule (upval)
				local _Font = p3.Font
				local Theme = p3.Theme
				local TileWidth: number = p1.state.tileWidth
				local TitleFontStyle = p1.props.titleFontStyle or _Font.Header2
				local TitleRichText = p1.props.titleRichText
				local SubtitleFontStyle = p1.props.subtitleFontStyle or _Font.CaptionHeader
				local ScaledBaseSize = if TitleFontStyle.RelativeSize then _Font.BaseSize * TitleFontStyle.RelativeSize else TitleFontStyle.FontSize
				local ScaledBaseSize1 = if SubtitleFontStyle.RelativeSize then _Font.BaseSize * SubtitleFontStyle.RelativeSize else SubtitleFontStyle.FontSize
				local _ = math.ceil(ScaledBaseSize * TitleTextLineCount)
				local Ceiled = math.ceil((ScaledBaseSize + p2) * TitleTextLineCount)
				local TileHeightDelta = p1.state.tileHeight - TileWidth / (p1.props.thumbnailAspectRatio or 1) - InnerPadding - Ceiled - InnerPadding - TitleTopPadding
				local _ = Vector2.new(0, 0)
				local YOffset = 0
				local _Vector2 = nil
				
				if AddSubtitleSpace then
					_Vector2 = Vector2.new(0, Ceiled)
					YOffset = math.ceil(ScaledBaseSize1) + p2
					TileHeightDelta -= YOffset
				else
					if UseMaxTitleHeight then
						_Vector2 = Vector2.new(0, Ceiled)
					else
						local Name1 = Name or ""
						local TitleFontStyleFont = TitleFontStyle.Font
						
						if TitleIcon then
							Name1 = GetWrappedTextWithIconModule(Name1, ScaledBaseSize, TitleFontStyleFont, TitleIcon.ImageRectSize.X / ImagesModule.ImagesResolutionScale, 4)
						end
						local TextSizeModule = GetTextSizeModule(Name1, ScaledBaseSize, TitleFontStyleFont, Vector2.new(TileWidth, Ceiled))
						_Vector2 = Vector2.new(TextSizeModule.X, (math.min(TextSizeModule.Y, Ceiled)))
					end
					if Subtitle ~= nil and Subtitle ~= "" then
						YOffset = math.ceil(ScaledBaseSize1) + p2
						TileHeightDelta -= YOffset
					end
				end
				local Largest = math.max(0, TileHeightDelta)
				local HasFooter: boolean = Footer ~= nil or BannerText ~= nil
				local RenderTileInsetFunction = p1.props.renderTileInset
				local _UDim2 = UDim2.new(1, 0, 0, _Vector2.Y + YOffset + TitleTopPadding)
				local UIPadding = nil
				
				if p1.props.nameOverThumbnail then
					_UDim2 = UDim2.new(0, TileWidth - 10, 0, -(_Vector2.Y + 20))
					UIPadding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 10) })
				end
				local InputBindings = p1.props.inputBindings or (if IsDisabled or not OnActivated then nil else {
					Activate = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, OnActivated)
				} or nil)
				
				return ReactModule.createElement(InteractableModule, {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Selectable = p1.props.Selectable,
					[ReactModule.Event.Activated] = if IsDisabled then nil else OnActivated,
					[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChange,
					ref = p1.props.textButtonRef,
					SelectionImageObject = if p1.props.cursor then p1.props.cursor else Callback(CursorKindModule.RoundedRect)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, InnerPadding),
						HorizontalAlignment = if p1.props.nameOverThumbnail then nil else HorizontalAlignment
					}),
					Thumbnail = ReactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
						Size = ThumbnailFrameSize,
						SizeConstraint = Enum.SizeConstraint.RelativeXX,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						NextSelectionLeft = p1.props.NextSelectionLeft,
						NextSelectionRight = p1.props.NextSelectionRight,
						NextSelectionUp = p1.props.NextSelectionUp,
						NextSelectionDown = p1.props.NextSelectionDown,
						ref = p1.props.thumbnailRef,
						[ReactModule.Tag] = p1.props[ReactModule.Tag],
						SelectionImageObject = if p1.props.cursor then p1.props.cursor else Callback(CursorKindModule.RoundedRectNoInset),
						inputBindings = if p1.props.isRoactGamepadEnabled then InputBindings else nil
					}, {
						Image = ReactModule.createElement(TileThumbnailModule, {
							Image = Thumbnail,
							hasRoundedCorners = HasRoundedCorners,
							cornerRadius = if p1.props.isCircular then UDim.new(0.5, 0) else _UDim,
							isSelected = IsSelected,
							multiSelect = MultiSelect,
							overlayComponents = ThumbnailOverlayComponents,
							imageSize = ThumbnailSize,
							imageColor = ThumbnailColor,
							imageTransparency = ThumbnailTransparency,
							backgroundImage = BackgroundImage,
							scaleType = p1.props.thumbnailScaleType,
							onThumbnailLoaded = p1.props.onThumbnailLoaded
						}),
						TileInset = RenderTileInsetFunction and RenderTileInsetFunction() or nil,
						UIAspectRatioConstraint = if p1.props.thumbnailAspectRatio == nil then nil else ReactModule.createElement("UIAspectRatioConstraint", {
							AspectRatio = p1.props.thumbnailAspectRatio,
							AspectType = Enum.AspectType.ScaleWithParentSize
						})
					}),
					TitleArea = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = _UDim2
					}, {
						TitleTopPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, TitleTopPadding) }),
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, SubtitleTopPadding),
							HorizontalAlignment = HorizontalAlignment
						}),
						NameOverThumbnailPadding = UIPadding,
						Name = TitleTextLineCount > 0 and TileWidth > 0 and ReactModule.createElement(TileNameModule, {
							LayoutOrder = 1,
							titleIcon = TitleIcon,
							name = Name,
							nameTextColor = p1.props.nameTextColor,
							nameTextTransparency = p1.props.nameTextTransparency,
							hasVerifiedBadge = HasVerifiedBadge,
							maxHeight = Ceiled,
							maxWidth = TileWidth,
							useMaxHeight = UseMaxTitleHeight,
							titleFontStyle = TitleFontStyle,
							richText = TitleRichText,
							horizontalAlignment = HorizontalAlignment
						}),
						Subtitle = Subtitle ~= "" and (Subtitle ~= nil and ReactModule.createElement(StyledTextLabelModule, {
							layoutOrder = 2,
							fluidSizing = false,
							richText = false,
							lineHeight = 1,
							size = UDim2.new(0, 0, 0, YOffset),
							automaticSize = Enum.AutomaticSize.X,
							text = Subtitle,
							colorStyle = Theme.TextDefault,
							fontStyle = SubtitleFontStyle,
							openTypeFeatures = p1.props.openTypeFeatures,
							textTruncate = Enum.TextTruncate.AtEnd
						}))
					}),
					FooterContainer = HasFooter and ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, Largest)
					}, {
						FooterTopPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, FooterTopPadding) }),
						Banner = BannerText and ReactModule.createElement(TileBannerModule, { bannerText = BannerText }),
						Footer = not BannerText and Footer
					})
				})
			end)
		end)
	end)
end

local function v25(p1)
	-- upvalues: UseCursorModule (copy), _UDim (copy), CryoModule (copy), ReactModule (copy), Tile (copy)
	return ReactModule.createElement(Tile, (CryoModule.Dictionary.join({ cursor = UseCursorModule(_UDim) }, p1)))
end

return ReactModule.forwardRef(function(p1, ThumbnailRef)
	-- upvalues: ReactModule (copy), v25 (copy), CryoModule (copy)
	return ReactModule.createElement(v25, CryoModule.Dictionary.join(p1, { thumbnailRef = ThumbnailRef }))
end)