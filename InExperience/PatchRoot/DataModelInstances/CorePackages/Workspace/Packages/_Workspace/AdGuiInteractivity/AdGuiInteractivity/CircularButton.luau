local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local imageSetLabel = require(parent.UIBlox).Core.ImageSet.ImageSetLabel
local circularButton = roactModule.Component:extend("CircularButton")

function circularButton.render(p0) --[[ line: 10 ]]
	-- upvalues: roactModule (ref), imageSetLabel (ref)
	local _ = nil
	
	return roactModule.createElement("TextButton", {
		Size = UDim2.fromScale(p0.props.HorizontalScale, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p0.props.Position,
		AnchorPoint = p0.props.AnchorPoint,
		BackgroundColor3 = Color3.fromRGB(17, 18, 19),
		Transparency = p0.props.Transparency,
		Text = "",
		Visible = if typeof(p0.props.Transparency) == "table" then p0.props.Transparency:map(function(p1) --[[ line: 13 ]]
			-- upvalues: p0 (ref)
			return p1 < 1 and p0.props.Visible
		end) else p0.props.Visible and p0.props.Transparency < 1,
		AutoButtonColor = p0.props.AutoButtonColor,
		[roactModule.Event.Activated] = p0.props.onActivated
	}, {
		UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1,
			AspectType = Enum.AspectType.ScaleWithParentSize
		}),
		UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		ImageLabel = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			Size = p0.props.ImageSize,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Image = p0.props.Image,
			ImageTransparency = p0.props.Transparency
		})
	})
end

return circularButton