local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(script.Parent.Parent.Constants)
local SelectionEffect = RoactModule.PureComponent:extend("SelectionEffect")

function SelectionEffect.render(p1) --[[ Line: 13 ]]
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
		SelectedLine = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(0.5 + ConstantsModule.InnerCircleSizeRatio / 2, -Layout.SelectedLinePadding, 0.5, 0),
			Size = UDim2.new(1, 0, ConstantsModule.InnerCircleSizeRatio * math.sin((math.rad(360 / ConstantsModule.EmotesPerPage / 2))), -Layout.SelectedLinePadding),
			Image = Layout.SelectedLine
		}, {
			AsspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = Layout.SelectedLineImageSize.X / Layout.SelectedLineImageSize.Y
			})
		})
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 46 | Named "mapStateToProps" ]]
	return { emotesWheel = p1.emotesWheel, layout = p1.layout }
end, nil)(SelectionEffect)