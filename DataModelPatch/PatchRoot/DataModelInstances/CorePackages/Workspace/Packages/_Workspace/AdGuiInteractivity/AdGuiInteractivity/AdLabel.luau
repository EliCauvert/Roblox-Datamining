local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local FeatureNativeAdsLabelAd = require(Parent.RobloxTranslator):FormatByKey("Feature.NativeAds.Label.Ad")
local UIBloxModule = require(Parent.UIBlox)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images
local IconsMenuMoreOn = Images["icons/menu/more_on"]
local IconsMenuMoreOff = Images["icons/menu/more_off"]
local AdLabel = RoactModule.Component:extend("AdLabel")

function AdLabel.render(p1)
	-- upvalues: RoactModule (copy), FeatureNativeAdsLabelAd (copy), ImageSetButton (copy), IconsMenuMoreOn (copy), IconsMenuMoreOff (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.995, 0.995),
		BackgroundColor3 = Color3.new(0, 0, 0),
		AnchorPoint = Vector2.new(1, 1),
		Size = UDim2.fromScale(0.11447368421, 0.10108771929),
		Visible = p1.props.Visible
	}, {
		Label = RoactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextSize = 100,
			TextScaled = true,
			TextWrapped = false,
			Text = FeatureNativeAdsLabelAd,
			TextColor3 = Color3.new(1, 1, 1),
			Font = Enum.Font.Gotham,
			Position = UDim2.fromScale(0.134084726, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromScale(0.40808394869, 0.77610536218)
		}),
		MenuButton = RoactModule.createElement(ImageSetButton, {
			LayoutOrder = 2,
			Image = p1.props.isMenuOpen and IconsMenuMoreOn or IconsMenuMoreOff,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0.4, 0),
			Position = UDim2.fromScale(0.76, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[RoactModule.Event.Activated] = p1.props.onActivated
		}, {
			UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1,
				AspectType = Enum.AspectType.ScaleWithParentSize
			})
		})
	})
end

return AdLabel