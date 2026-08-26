local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useStyleModule = require(parent.Core.Style.useStyle)
local reactOtterModule = require(parent_1.ReactOtter)
local t = { dampingRatio = 1, frequency = 3 }
local t_1 = {
	top = 270,
	topRight = 305,
	right = 0,
	bottomRight = 45,
	bottom = 90,
	bottomLeft = 135,
	left = 180,
	topLeft = 225
}

return function(p1)
	-- upvalues: useStyleModule (ref), reactOtterModule (ref), reactModule (ref), t (ref), t_1 (ref)
	local theme = useStyleModule().Theme
	local var1, var2 = reactOtterModule.useAnimatedBinding(if p1.showGradient then 0 else 1)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), reactOtterModule (copy), t (copy)
		if p1.showGradient == false then
			var2(reactOtterModule.spring(1, t))
			
			return
		end
		var2(reactOtterModule.spring(0, t))
	end, { p1.showGradient })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, {
		Overlay = reactModule.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = theme.Overlay.Color,
			BackgroundTransparency = theme.Overlay.Transparency
		}),
		Gradient = reactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = var1
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = t_1[p1.gradientDirection],
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, Color3.new(0, 0, 0)),
					ColorSequenceKeypoint.new(1, Color3.new(0, 0, 0))
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 0),
					NumberSequenceKeypoint.new(1, 0.89)
				})
			})
		})
	})
end