local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(reactModule.forwardRef(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref)
	local var1 = useTokens()
	local background = var1.Color.ActionSubtle.Background
	local foreground = var1.Color.ActionSubtle.Foreground
	local numberSequence = NumberSequence.new({
		NumberSequenceKeypoint.new(0, foreground.Transparency),
		NumberSequenceKeypoint.new(0.4999, foreground.Transparency),
		NumberSequenceKeypoint.new(0.5, background.Transparency),
		NumberSequenceKeypoint.new(1, background.Transparency)
	})
	local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, foreground.Color3),
		ColorSequenceKeypoint.new(0.4999, foreground.Color3),
		ColorSequenceKeypoint.new(0.5, background.Color3),
		ColorSequenceKeypoint.new(1, background.Color3)
	})
	
	return reactModule.createElement(view, {
		BackgroundTransparency = 1,
		tag = "anchor-center-center bg-action-subtle position-center-center size-full"
	}, {
		LeftGradient = reactModule.createElement(view, {
			tag = "bg-action-subtle clip",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = numberSequence,
					Color = colorSequence,
					Rotation = p1.progress:map(function(p2)
						return math.clamp(p2 * 360, 180, 360)
					end)
				})
			})
		}),
		RightGradient = reactModule.createElement(view, {
			tag = "bg-action-subtle clip position-top-center",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = reactModule.createElement(image, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = numberSequence,
					Color = colorSequence,
					Rotation = p1.progress:map(function(p2)
						return math.clamp(p2 * 360, 0, 180)
					end)
				})
			})
		})
	})
end))