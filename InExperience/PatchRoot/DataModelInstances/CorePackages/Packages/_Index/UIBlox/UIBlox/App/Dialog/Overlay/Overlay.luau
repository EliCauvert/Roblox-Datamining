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

return function(p0) --[[ line: 48 | named "Overlay" ]]
	-- upvalues: useStyleModule (ref), reactOtterModule (ref), reactModule (ref), t (ref), t_1 (ref)
	local theme = useStyleModule().Theme
	local var5, var6 = reactOtterModule.useAnimatedBinding(if p0.showGradient then 0 else 1)
	reactModule.useEffect(function() --[[ line: 55 ]]
		-- upvalues: p0 (ref), var6 (ref), reactOtterModule (copy), t (copy)
		if p0.showGradient == false then
			var6(reactOtterModule.spring(1, t))
			
			return
		end
		var6(reactOtterModule.spring(0, t))
	end, { p0.showGradient })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p0.ZIndex
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
			BackgroundTransparency = var5
		}, {
			UIGradient = reactModule.createElement("UIGradient", {
				Rotation = t_1[p0.gradientDirection],
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