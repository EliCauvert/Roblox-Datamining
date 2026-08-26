local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local cryoModule = require(parent_2.Cryo)
local tModule = require(parent_2.t)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local useStyleMetadataModule = require(parent_1.Core.Style.useStyleMetadata)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local loadableImageModule = require(parent_1.App.Loading.LoadableImage)
local tileSelectionOverlayModule = require(parent.TileSelectionOverlay)
local tileUnselectedOverlayModule = require(parent.TileUnselectedOverlay)
local tileThumbnail = roactModule.PureComponent:extend("TileThumbnail")
tileThumbnail.validateProps = tModule.strictInterface({
	hasRoundedCorners = tModule.optional(tModule.boolean),
	cornerRadius = tModule.optional(tModule.UDim),
	Image = tModule.optional(tModule.union(tModule.string, tModule.table)),
	imageSize = tModule.optional(tModule.UDim2),
	imageColor = tModule.optional(tModule.Color3),
	imageTransparency = tModule.optional(tModule.number),
	isSelected = tModule.optional(tModule.boolean),
	multiSelect = tModule.optional(tModule.boolean),
	overlayComponents = tModule.optional(tModule.table),
	backgroundImage = tModule.optional(tModule.union(tModule.string, tModule.table)),
	scaleType = tModule.optional(tModule.enum(Enum.ScaleType)),
	onThumbnailLoaded = tModule.optional(tModule.callback),
	hasSurfaceOverrides = tModule.optional(tModule.boolean)
})
tileThumbnail.defaultProps = {
	imageTransparency = 0,
	imageSize = UDim2.fromScale(1, 1),
	cornerRadius = UDim.new(0, 10),
	scaleType = Enum.ScaleType.Stretch
}

function tileThumbnail.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), imageSetComponentModule (ref), loadableImageModule (ref), tileSelectionOverlayModule (ref), tileUnselectedOverlayModule (ref)
	local hasRoundedCorners = p1.props.hasRoundedCorners
	local image = p1.props.Image
	local imageSize = p1.props.imageSize
	local imageColor = p1.props.imageColor
	local imageTransparency = p1.props.imageTransparency
	local isSelected = p1.props.isSelected
	local multiSelect = p1.props.multiSelect
	local overlayComponents = p1.props.overlayComponents
	local backgroundImage = p1.props.backgroundImage
	local cornerRadius = p1.props.cornerRadius
	local scaleType = p1.props.scaleType
	local isTable = typeof(image) == "table"
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), imageSetComponentModule (copy), backgroundImage (ref), isTable (ref), image (ref), imageColor (ref), imageTransparency (ref), imageSize (ref), scaleType (ref), hasRoundedCorners (ref), cornerRadius (ref), loadableImageModule (copy), overlayComponents (ref), isSelected (ref), tileSelectionOverlayModule (copy), multiSelect (ref), tileUnselectedOverlayModule (copy)
		local theme = p2.Theme
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
			ImageContainer = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				BackgroundColor3 = theme.PlaceHolder.Color,
				BackgroundTransparency = theme.PlaceHolder.Transparency,
				Size = UDim2.fromScale(1, 1)
			}, {
				BackgroundImage = roactModule.createElement(imageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 0,
					Image = backgroundImage,
					ImageColor3 = if p1.props.hasSurfaceOverrides then theme.BackgroundUIDefault.Color:Lerp(theme.PlayerBackgroundDefault.Color, theme.Overlay.Transparency) else nil,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromScale(1, 1)
				}, {
					ImageSetImage = isTable and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = image,
						ImageColor3 = imageColor or theme.UIEmphasis.Color,
						ImageTransparency = imageTransparency,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = imageSize,
						ScaleType = scaleType
					}, {
						UICorner = hasRoundedCorners and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
					}) or roactModule.createElement(loadableImageModule, {
						BackgroundTransparency = 1,
						showFailedStateWhenLoadingFailed = true,
						useShimmerAnimationWhileLoading = true,
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = theme.PlaceHolder.Color,
						Image = image,
						Position = UDim2.fromScale(0.5, 0.5),
						Size = imageSize,
						cornerRadius = if hasRoundedCorners then cornerRadius else nil,
						ScaleType = scaleType,
						onLoaded = p1.props.onThumbnailLoaded
					}),
					UICorner = hasRoundedCorners and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
				}),
				UICorner = hasRoundedCorners and roactModule.createElement("UICorner", { CornerRadius = cornerRadius }) or nil
			}),
			ComponentsFrame = overlayComponents and roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, overlayComponents),
			SelectionOverlay = isSelected and roactModule.createElement(tileSelectionOverlayModule, {
				ZIndex = 2,
				cornerRadius = if hasRoundedCorners then cornerRadius else nil
			}),
			UnselectedOverlay = multiSelect and (not isSelected and roactModule.createElement(tileUnselectedOverlayModule, { ZIndex = 2 }))
		})
	end)
end

return function(p1)
	-- upvalues: useStyleMetadataModule (ref), roactModule (ref), tileThumbnail (ref), cryoModule (ref)
	local var1 = useStyleMetadataModule()
	
	return roactModule.createElement(tileThumbnail, cryoModule.Dictionary.join(p1, {
		hasSurfaceOverrides = if var1 then var1.HasSurfaceOverrides else false
	}))
end