local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ItemTileIcon = RoactModule.PureComponent:extend("ItemTileIcon")
ItemTileIcon.defaultProps = { hasRoundedCorners = false }

function ItemTileIcon.render(p1)
	-- upvalues: RoactModule (copy), LoadableImage (copy), ImageSetLabel (copy), Images (copy), WithStyleFunction (copy)
	local Image = p1.props.Image
	local HasRoundedCorners = p1.props.hasRoundedCorners
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), LoadableImage (upval), Image (copy), HasRoundedCorners (copy), ImageSetLabel (upval), Images (upval)
		local Theme = p2.Theme
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			LoadableImage = RoactModule.createElement(LoadableImage, {
				useShimmerAnimationWhileLoading = true,
				Size = UDim2.new(1, 0, 1, 0),
				Image = Image
			}),
			RoundedCornersOverlay = HasRoundedCorners and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Image = Images["component_assets/circle_17_mask"],
				ImageColor3 = Theme.BackgroundDefault.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Size = UDim2.new(1, 0, 1, 0)
			})
		})
	end)
end

return ItemTileIcon