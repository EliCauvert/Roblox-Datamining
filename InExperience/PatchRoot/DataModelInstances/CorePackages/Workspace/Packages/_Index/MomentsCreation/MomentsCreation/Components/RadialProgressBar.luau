local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local constantsModule = require(momentsCreation.Constants)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), image (ref), constantsModule (ref)
	local var4 = useTokens()
	local background = var4.Color.ActionSubtle.Background
	local foreground = var4.Color.ActionSubtle.Foreground
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
		tag = "anchor-center-center position-center-center size-full"
	}, {
		LeftGradient = reactModule.createElement(view, { tag = "clip", Size = UDim2.fromScale(0.5, 1) }, {
			Image = reactModule.createElement(image, {
				Image = constantsModule.RadialFillImage,
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = numberSequence,
					Color = colorSequence,
					Rotation = p0.progress:map(function(p1)
						return math.clamp(p1 * 360, 180, 360)
					end)
				})
			})
		}),
		RightGradient = reactModule.createElement(view, {
			tag = "clip position-top-center",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = reactModule.createElement(image, {
				Image = constantsModule.RadialFillImage,
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = numberSequence,
					Color = colorSequence,
					Rotation = p0.progress:map(function(p2)
						return math.clamp(p2 * 360, 0, 180)
					end)
				})
			})
		})
	})
end