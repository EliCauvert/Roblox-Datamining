local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local CryoModule = require(Parent2.Cryo)
local TModule = require(Parent2.t)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local UseStyleMetadataModule = require(Parent1.Core.Style.useStyleMetadata)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local LoadableImageModule = require(Parent1.App.Loading.LoadableImage)
local TileSelectionOverlayModule = require(Parent.TileSelectionOverlay)
local TileUnselectedOverlayModule = require(Parent.TileUnselectedOverlay)
local TileThumbnail = RoactModule.PureComponent:extend("TileThumbnail")
TileThumbnail.validateProps = TModule.strictInterface({
	hasRoundedCorners = TModule.optional(TModule.boolean),
	cornerRadius = TModule.optional(TModule.UDim),
	Image = TModule.optional(TModule.union(TModule.string, TModule.table)),
	imageSize = TModule.optional(TModule.UDim2),
	imageColor = TModule.optional(TModule.Color3),
	imageTransparency = TModule.optional(TModule.number),
	isSelected = TModule.optional(TModule.boolean),
	multiSelect = TModule.optional(TModule.boolean),
	overlayComponents = TModule.optional(TModule.table),
	backgroundImage = TModule.optional(TModule.union(TModule.string, TModule.table)),
	scaleType = TModule.optional(TModule.enum(Enum.ScaleType)),
	onThumbnailLoaded = TModule.optional(TModule.callback),
	hasSurfaceOverrides = TModule.optional(TModule.boolean)
})
TileThumbnail.defaultProps = {
	imageTransparency = 0,
	imageSize = UDim2.fromScale(1, 1),
	cornerRadius = UDim.new(0, 10),
	scaleType = Enum.ScaleType.Stretch
}

function TileThumbnail.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ImageSetComponentModule (copy), LoadableImageModule (copy), TileSelectionOverlayModule (copy), TileUnselectedOverlayModule (copy)
	local HasRoundedCorners = p1.props.hasRoundedCorners
	local Image = p1.props.Image
	local ImageSize = p1.props.imageSize
	local ImageColor = p1.props.imageColor
	local ImageTransparency = p1.props.imageTransparency
	local IsSelected = p1.props.isSelected
	local MultiSelect = p1.props.multiSelect
	local OverlayComponents = p1.props.overlayComponents
	local BackgroundImage = p1.props.backgroundImage
	local CornerRadius = p1.props.cornerRadius
	local ScaleType = p1.props.scaleType
	local IsTable = typeof(Image) == "table"
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), ImageSetComponentModule (upval), BackgroundImage (copy), IsTable (copy), Image (copy), ImageColor (copy), ImageTransparency (copy), ImageSize (copy), ScaleType (copy), HasRoundedCorners (copy), CornerRadius (copy), LoadableImageModule (upval), OverlayComponents (copy), IsSelected (copy), TileSelectionOverlayModule (upval), MultiSelect (copy), TileUnselectedOverlayModule (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			ImageContainer = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				BackgroundColor3 = Theme.PlaceHolder.Color,
				BackgroundTransparency = Theme.PlaceHolder.Transparency,
				Size = UDim2.fromScale(1, 1)
			}, {
				BackgroundImage = RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 0,
					Image = BackgroundImage,
					ImageColor3 = if p1.props.hasSurfaceOverrides then Theme.BackgroundUIDefault.Color:Lerp(Theme.PlayerBackgroundDefault.Color, Theme.Overlay.Transparency) else nil,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromScale(1, 1)
				}, {
					ImageSetImage = IsTable and RoactModule.createElement(ImageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = Image,
						ImageColor3 = ImageColor or Theme.UIEmphasis.Color,
						ImageTransparency = ImageTransparency,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = ImageSize,
						ScaleType = ScaleType
					}, {
						UICorner = HasRoundedCorners and RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
					}) or RoactModule.createElement(LoadableImageModule, {
						BackgroundTransparency = 1,
						showFailedStateWhenLoadingFailed = true,
						useShimmerAnimationWhileLoading = true,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Theme.PlaceHolder.Color,
						Image = Image,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = ImageSize,
						cornerRadius = HasRoundedCorners and CornerRadius or nil,
						ScaleType = ScaleType,
						onLoaded = p1.props.onThumbnailLoaded
					}),
					UICorner = HasRoundedCorners and RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
				}),
				UICorner = HasRoundedCorners and RoactModule.createElement("UICorner", { CornerRadius = CornerRadius }) or nil
			}),
			ComponentsFrame = OverlayComponents and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, OverlayComponents),
			SelectionOverlay = IsSelected and RoactModule.createElement(TileSelectionOverlayModule, {
				ZIndex = 2,
				cornerRadius = HasRoundedCorners and CornerRadius or nil
			}),
			UnselectedOverlay = MultiSelect and (not IsSelected and RoactModule.createElement(TileUnselectedOverlayModule, { ZIndex = 2 }))
		})
	end)
end

return function(p1)
	-- upvalues: UseStyleMetadataModule (copy), RoactModule (copy), TileThumbnail (copy), CryoModule (copy)
	local UseStyleMetadataModuleResult = UseStyleMetadataModule()
	
	return RoactModule.createElement(TileThumbnail, CryoModule.Dictionary.join(p1, {
		hasSurfaceOverrides = if UseStyleMetadataModuleResult then UseStyleMetadataModuleResult.HasSurfaceOverrides else false
	}))
end