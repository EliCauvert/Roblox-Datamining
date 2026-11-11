local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local IconSize = UIBloxModule.App.Constant.IconSize
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconsActionsPreviewShrink = Images["icons/actions/previewShrink"]
local IconsActionsPreviewExpand = Images["icons/actions/previewExpand"]
local _Vector2 = Vector2.new(8, 8)
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local ComponentAssetsDropshadow246 = Images["component_assets/dropshadow_24_6"]
local FullViewEntryButton = RoactModule.PureComponent:extend("FullViewEntryButton")
FullViewEntryButton.validateProps = TModule.strictInterface({
	isUIFullView = TModule.optional(TModule.boolean),
	isSceneFullView = TModule.optional(TModule.boolean),
	changeViewFunction = TModule.optional(TModule.callback),
	LayoutOrder = TModule.optional(TModule.number)
})

function FullViewEntryButton.renderExpandButton(p1, Theme)
	-- upvalues: RoactModule (copy), ImageSetButton (copy), IconSize (copy), IconsActionsPreviewShrink (copy)
	return RoactModule.createElement(ImageSetButton, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, IconSize.Regular, 0, IconSize.Regular),
		Image = IconsActionsPreviewShrink,
		ImageColor3 = Theme.IconEmphasis.Color,
		ImageTransparency = Theme.IconEmphasis.Transparency,
		LayoutOrder = p1.props.LayoutOrder,
		[RoactModule.Event.Activated] = p1.props.changeViewFunction
	})
end

function FullViewEntryButton.renderCollapseButton(p1, Theme)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), IconSize (copy), _Vector2 (copy), ComponentAssetsDropshadow246 (copy), ImageSetButton (copy), ComponentAssetsCircle17 (copy), IconsActionsPreviewExpand (copy)
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		Size = UDim2.new(0, IconSize.Regular + _Vector2.X + 14, 0, IconSize.Regular + _Vector2.Y + 14),
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(16, 16, 18, 18),
		Image = ComponentAssetsDropshadow246,
		ImageColor3 = Theme.DropShadow.Color,
		ImageTransparency = Theme.DropShadow.Transparency,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		BackgroundImage = RoactModule.createElement(ImageSetButton, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, IconSize.Regular + _Vector2.X, 0, IconSize.Regular + _Vector2.Y),
			BackgroundTransparency = 1,
			Image = ComponentAssetsCircle17,
			ImageColor3 = Theme.BackgroundContrast.Color,
			ImageTransparency = 0,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			[RoactModule.Event.Activated] = p1.props.changeViewFunction
		}, {
			FullViewImageButton = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Image = IconsActionsPreviewExpand,
				ImageColor3 = Theme.IconEmphasis.Color,
				ImageTransparency = Theme.IconEmphasis.Transparency,
				Size = UDim2.new(0, -IconSize.Regular, 0, -IconSize.Regular)
			})
		})
	})
end

function FullViewEntryButton.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		local Theme = p2.Theme
		
		return if p1.props.isUIFullView then p1:renderCollapseButton(Theme) else p1:renderExpandButton(Theme)
	end)
end

return FullViewEntryButton