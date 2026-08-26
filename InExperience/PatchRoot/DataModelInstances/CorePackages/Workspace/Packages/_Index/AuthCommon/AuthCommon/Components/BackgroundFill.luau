local parent = script:FindFirstAncestor("AuthCommon").Parent
local foundationModule = require(parent.Foundation)
local roactModule = require(parent.Roact)
local backgroundFill = roactModule.PureComponent:extend("BackgroundFill")

function backgroundFill.render(p1)
	-- upvalues: roactModule (ref), foundationModule (ref)
	return roactModule.createElement(foundationModule.Image, {
		BorderSizePixel = 0,
		Image = p1.props.Image,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ScaleType = Enum.ScaleType.Crop
	})
end

return backgroundFill