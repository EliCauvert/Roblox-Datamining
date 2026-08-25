local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local var1 = require(parent.RobloxTranslator):FormatByKey("Feature.NativeAds.Label.Ad")
local UIBloxModule = require(parent.UIBlox)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local images = UIBloxModule.App.ImageSet.Images
local moreOn = images["icons/menu/more_on"]
local moreOff = images["icons/menu/more_off"]
local adLabel = roactModule.Component:extend("AdLabel")

function adLabel.render(p0)
	-- upvalues: roactModule (ref), var1 (ref), imageSetButton (ref), moreOn (ref), moreOff (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.995, 0.995),
		BackgroundColor3 = Color3.new(0, 0, 0),
		AnchorPoint = Vector2.new(1, 1),
		Size = UDim2.fromScale(0.11447368421, 0.10108771929),
		Visible = p0.props.Visible
	}, {
		Label = roactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			TextSize = 100,
			TextScaled = true,
			TextWrapped = false,
			Text = var1,
			TextColor3 = Color3.new(1, 1, 1),
			Font = Enum.Font.Gotham,
			Position = UDim2.fromScale(0.134084726, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			Size = UDim2.fromScale(0.40808394869, 0.77610536218)
		}),
		MenuButton = roactModule.createElement(imageSetButton, {
			LayoutOrder = 2,
			Image = if p0.props.isMenuOpen then moreOn else moreOff,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0.4, 0),
			Position = UDim2.fromScale(0.76, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[roactModule.Event.Activated] = p0.props.onActivated
		}, {
			UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = 1,
				AspectType = Enum.AspectType.ScaleWithParentSize
			})
		})
	})
end

return adLabel