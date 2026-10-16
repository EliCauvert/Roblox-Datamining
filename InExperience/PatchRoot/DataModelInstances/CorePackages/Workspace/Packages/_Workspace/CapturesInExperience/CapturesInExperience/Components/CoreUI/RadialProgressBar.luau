local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(ReactModule.forwardRef(function(p1) --[[ Line: 18 | Named "RadialProgressBar" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local Background = UseTokensResult.Color.ActionSubtle.Background
	local Foreground = UseTokensResult.Color.ActionSubtle.Foreground
	local NumberSequence1 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, Foreground.Transparency),
		NumberSequenceKeypoint.new(0.4999, Foreground.Transparency),
		NumberSequenceKeypoint.new(0.5, Background.Transparency),
		NumberSequenceKeypoint.new(1, Background.Transparency)
	})
	local ColorSequence1 = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Foreground.Color3),
		ColorSequenceKeypoint.new(0.4999, Foreground.Color3),
		ColorSequenceKeypoint.new(0.5, Background.Color3),
		ColorSequenceKeypoint.new(1, Background.Color3)
	})
	
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		tag = "anchor-center-center bg-action-subtle position-center-center size-full"
	}, {
		LeftGradient = ReactModule.createElement(View, {
			tag = "bg-action-subtle clip",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = ReactModule.createElement(Image, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Transparency = NumberSequence1,
					Color = ColorSequence1,
					Rotation = p1.progress:map(function(p2: number): number --[[ Line: 52 ]]
						return (math.clamp(p2 * 360, 180, 360))
					end)
				})
			})
		}),
		RightGradient = ReactModule.createElement(View, {
			tag = "bg-action-subtle clip position-top-center",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = ReactModule.createElement(Image, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Transparency = NumberSequence1,
					Color = ColorSequence1,
					Rotation = p1.progress:map(function(p2: number): number --[[ Line: 71 ]]
						return (math.clamp(p2 * 360, 0, 180))
					end)
				})
			})
		})
	})
end))