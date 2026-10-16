local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.Parent.React)
local _ = require(Parent.Style.StyleTypes)
local UseStyleModule = require(Parent1.Core.Style.useStyle)

return function(p1) --[[ Line: 29 | Named "GradientFrame" ]]
	-- upvalues: UseStyleModule (copy), ReactModule (copy)
	local FrameRef = p1.frameRef
	local GradientStyle = p1.gradientStyle
	local Height = p1.height
	local ZIndex = p1.ZIndex
	local Theme = UseStyleModule().Theme
	local Color = GradientStyle and GradientStyle.Color or Theme.BackgroundDefault.Color
	local Transparency = GradientStyle and GradientStyle.Transparency or Theme.BackgroundDefault.Transparency
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = ZIndex,
		ref = FrameRef
	}, {
		Left = ReactModule.createElement("Frame", {
			BackgroundTransparency = Transparency,
			BackgroundColor3 = Color,
			Size = UDim2.new(0, 50, 0, Height)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		Right = ReactModule.createElement("Frame", {
			BackgroundTransparency = Transparency,
			BackgroundColor3 = Color,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, 50, 0, Height)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end