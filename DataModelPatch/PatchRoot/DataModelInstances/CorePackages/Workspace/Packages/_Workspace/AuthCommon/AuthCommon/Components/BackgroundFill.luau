local Parent = script:FindFirstAncestor("AuthCommon").Parent
local FoundationModule = require(Parent.Foundation)
local RoactModule = require(Parent.Roact)
local BackgroundFill = RoactModule.PureComponent:extend("BackgroundFill")

function BackgroundFill.render(p1)
	-- upvalues: RoactModule (copy), FoundationModule (copy)
	return RoactModule.createElement(FoundationModule.Image, {
		BorderSizePixel = 0,
		Image = p1.props.Image,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ScaleType = Enum.ScaleType.Crop
	})
end

return BackgroundFill