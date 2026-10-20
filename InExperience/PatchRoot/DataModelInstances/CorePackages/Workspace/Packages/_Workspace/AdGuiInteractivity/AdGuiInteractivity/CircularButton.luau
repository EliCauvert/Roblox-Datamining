local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local CircularButton = RoactModule.Component:extend("CircularButton")

function CircularButton.render(p1)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy)
	return RoactModule.createElement("TextButton", {
		Size = UDim2.fromScale(p1.props.HorizontalScale, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundColor3 = Color3.fromRGB(17, 18, 19),
		Transparency = p1.props.Transparency,
		Text = "",
		Visible = if typeof(p1.props.Transparency) == "table" then p1.props.Transparency:map(function(p2: number)
			-- upvalues: p1 (copy)
			return p2 < 1 and p1.props.Visible
		end) else p1.props.Visible and p1.props.Transparency < 1,
		AutoButtonColor = p1.props.AutoButtonColor,
		[RoactModule.Event.Activated] = p1.props.onActivated
	}, {
		UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.ScaleWithParentSize
		}),
		UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		ImageLabel = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Size = p1.props.ImageSize,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = p1.props.Image,
			ImageTransparency = p1.props.Transparency
		})
	})
end

return CircularButton