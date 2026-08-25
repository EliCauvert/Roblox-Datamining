local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local reactModule = require(parent_1.Parent.React)
local _ = require(parent.Style.StyleTypes)
local useStyleModule = require(core.Style.useStyle)

return function(p0)
	-- upvalues: useStyleModule (ref), reactModule (ref)
	local frameRef = p0.frameRef
	local gradientStyle = p0.gradientStyle
	local height = p0.height
	local zIndex = p0.ZIndex
	local theme = useStyleModule().Theme
	local var2 = if gradientStyle then gradientStyle.Color else theme.BackgroundDefault.Color
	local var3 = if gradientStyle then gradientStyle.Transparency else theme.BackgroundDefault.Transparency
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = zIndex,
		ref = frameRef
	}, {
		Left = reactModule.createElement("Frame", {
			BackgroundTransparency = var3,
			BackgroundColor3 = var2,
			Size = UDim2.new(0, 50, 0, height)
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 1)
				})
			})
		}),
		Right = reactModule.createElement("Frame", {
			BackgroundTransparency = var3,
			BackgroundColor3 = var2,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, 50, 0, height)
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end