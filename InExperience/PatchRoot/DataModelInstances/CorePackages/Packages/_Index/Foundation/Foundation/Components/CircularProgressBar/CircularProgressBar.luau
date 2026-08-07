local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local imageModule = require(foundation.Components.Image)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { testId = "--foundation-circular-progress-bar" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 22 | named "CircularProgressBar" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9 = useTokensModule()
	local numberSequence = NumberSequence.new({
		NumberSequenceKeypoint.new(0, var9.Color.Content.Emphasis.Transparency),
		NumberSequenceKeypoint.new(0.4999, var9.Color.Content.Emphasis.Transparency),
		NumberSequenceKeypoint.new(0.5, var9.Color.Content.Muted.Transparency),
		NumberSequenceKeypoint.new(1, var9.Color.Content.Muted.Transparency)
	})
	local colorSequence = ColorSequence.new({
		ColorSequenceKeypoint.new(0, var9.Color.Content.Emphasis.Color3),
		ColorSequenceKeypoint.new(0.4999, var9.Color.Content.Emphasis.Color3),
		ColorSequenceKeypoint.new(0.5, var9.Color.Content.Muted.Color3),
		ColorSequenceKeypoint.new(1, var9.Color.Content.Muted.Color3)
	})
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var8, { tag = "size-full-full", ref = p1 }), {
		LeftGradient = reactModule.createElement(viewModule, {
			tag = "position-top-left clip",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = reactModule.createElement(imageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "position-top-left content-emphasis",
				Size = UDim2.fromScale(2, 1),
				testId = `{var8.testId}--left-gradient`
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = numberSequence,
					Color = colorSequence,
					Rotation = var8.progress:map(function(p2) --[[ line: 60 ]]
						return math.clamp(p2 * 360, 180, 360)
					end)
				})
			})
		}),
		RightGradient = reactModule.createElement(viewModule, {
			tag = "position-top-center clip",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = reactModule.createElement(imageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "content-emphasis",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0),
				testId = `{var8.testId}--right-gradient`
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = numberSequence,
					Color = colorSequence,
					Rotation = var8.progress:map(function(p3) --[[ line: 80 ]]
						return math.clamp(p3 * 360, 0, 180)
					end)
				})
			})
		})
	})
end))