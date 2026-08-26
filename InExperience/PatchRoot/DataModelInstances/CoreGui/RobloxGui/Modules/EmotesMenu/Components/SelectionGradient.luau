local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local selectionGradient = roactModule.PureComponent:extend("SelectionGradient")

function selectionGradient.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref)
	local layout = constantsModule.Layouts[p1.props.layout]
	local focusedSegmentIndex = p1.props.emotesWheel.focusedSegmentIndex
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Rotation = 360 / constantsModule.EmotesPerPage * (focusedSegmentIndex - 1) + constantsModule.SegmentsStartRotation,
		Visible = focusedSegmentIndex ~= 0
	}, {
		SelectedGradient = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0.5, 0, 1, 0),
			ImageTransparency = constantsModule.GradientTransparency,
			Image = layout.SelectedGradient
		}, {
			AsspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = layout.SelectedGradientImageSize.X / layout.SelectedGradientImageSize.Y
			}),
			SizeConstraint = roactModule.createElement("UISizeConstraint", { MaxSize = layout.SelectedGradientImageSize })
		})
	})
end

return roactRoduxModule.connect(function(p1)
	return { emotesWheel = p1.emotesWheel, layout = p1.layout }
end, nil)(selectionGradient)