local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local selectionEffect = roactModule.PureComponent:extend("SelectionEffect")

function selectionEffect.render(p0) --[[ line: 13 ]]
	-- upvalues: constantsModule (ref), roactModule (ref)
	local layout = constantsModule.Layouts[p0.props.layout]
	local focusedSegmentIndex = p0.props.emotesWheel.focusedSegmentIndex
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Rotation = 360 / constantsModule.EmotesPerPage * (focusedSegmentIndex - 1) + constantsModule.SegmentsStartRotation,
		Visible = focusedSegmentIndex ~= 0
	}, {
		SelectedLine = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(0.5 + constantsModule.InnerCircleSizeRatio / 2, -layout.SelectedLinePadding, 0.5, 0),
			Size = UDim2.new(1, 0, constantsModule.InnerCircleSizeRatio * math.sin(math.rad(360 / constantsModule.EmotesPerPage / 2)), -layout.SelectedLinePadding),
			Image = layout.SelectedLine
		}, {
			AsspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = layout.SelectedLineImageSize.X / layout.SelectedLineImageSize.Y
			})
		})
	})
end

return roactRoduxModule.connect(function(p1) --[[ line: 46 | named "mapStateToProps" ]]
	return { emotesWheel = p1.emotesWheel, layout = p1.layout }
end, nil)(selectionEffect)