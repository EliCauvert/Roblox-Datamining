local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local circularButton = roactModule.Component:extend("CircularButton")

function circularButton.render(p1)
	-- upvalues: roactModule (ref), imageSetLabel (ref)
	local _ = nil
	
	return roactModule.createElement("TextButton", {
		Size = UDim2.fromScale(p1.props.HorizontalScale, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p1.props.Position,
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundColor3 = Color3.fromRGB(17, 18, 19),
		Transparency = p1.props.Transparency,
		Text = "",
		Visible = if typeof(p1.props.Transparency) == "table" then p1.props.Transparency:map(function(p2)
			-- upvalues: p1 (ref)
			return p2 < 1 and p1.props.Visible
		end) else p1.props.Visible and p1.props.Transparency < 1,
		AutoButtonColor = p1.props.AutoButtonColor,
		[roactModule.Event.Activated] = p1.props.onActivated
	}, {
		UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.ScaleWithParentSize
		}),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		ImageLabel = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = p1.props.ImageSize,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = p1.props.Image,
			ImageTransparency = p1.props.Transparency
		})
	})
end

return circularButton