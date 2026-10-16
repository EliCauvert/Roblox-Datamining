local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local ReactOtterModule = require(Parent1.ReactOtter)
local config = { dampingRatio = 1, frequency = 3 }
local config1 = {
	top = 270,
	topRight = 305,
	right = 0,
	bottomRight = 45,
	bottom = 90,
	bottomLeft = 135,
	left = 180,
	topLeft = 225
}

return function(p1) --[[ Line: 48 | Named "Overlay" ]]
	-- upvalues: UseStyleModule (copy), ReactOtterModule (copy), ReactModule (copy), config (copy), config1 (copy)
	local Theme = UseStyleModule().Theme
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if p1.showGradient then 0 else 1)
	ReactModule.useEffect(function() --[[ Line: 55 ]]
		-- upvalues: p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if p1.showGradient == false then
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
		end
	end, { p1.showGradient })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		ZIndex = p1.ZIndex
	}, {
		Overlay = ReactModule.createElement("Frame", {
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency
		}),
		Gradient = ReactModule.createElement("Frame", {
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = UseAnimatedBindingResult
		}, {
			UIGradient = ReactModule.createElement("UIGradient", {
				Rotation = config1[p1.gradientDirection],
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