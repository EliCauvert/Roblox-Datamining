local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(script.Parent.Parent.Constants)
local SelectionGradient = RoactModule.PureComponent:extend("SelectionGradient")

function SelectionGradient.render(p1) --[[ Line: 13 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy)
	local Layout = ConstantsModule.Layouts[p1.props.layout]
	local FocusedSegmentIndex: number = p1.props.emotesWheel.focusedSegmentIndex
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Rotation = 360 / ConstantsModule.EmotesPerPage * (FocusedSegmentIndex - 1) + ConstantsModule.SegmentsStartRotation,
		Visible = FocusedSegmentIndex ~= 0
	}, {
		SelectedGradient = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0.5, 0, 1, 0),
			ImageTransparency = ConstantsModule.GradientTransparency,
			Image = Layout.SelectedGradient
		}, {
			AsspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = Layout.SelectedGradientImageSize.X / Layout.SelectedGradientImageSize.Y
			}),
			SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Layout.SelectedGradientImageSize })
		})
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 47 | Named "mapStateToProps" ]]
	return { emotesWheel = p1.emotesWheel, layout = p1.layout }
end, nil)(SelectionGradient)