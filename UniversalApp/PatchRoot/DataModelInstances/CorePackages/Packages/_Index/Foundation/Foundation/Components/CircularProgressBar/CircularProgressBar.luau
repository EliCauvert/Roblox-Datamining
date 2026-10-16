local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ImageModule = require(Foundation.Components.Image)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { testId = "--foundation-circular-progress-bar" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 22 | Named "CircularProgressBar" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local NumberSequence1 = NumberSequence.new({
		NumberSequenceKeypoint.new(0, UseTokensModuleResult.Color.Content.Emphasis.Transparency),
		NumberSequenceKeypoint.new(0.4999, UseTokensModuleResult.Color.Content.Emphasis.Transparency),
		NumberSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Content.Muted.Transparency),
		NumberSequenceKeypoint.new(1, UseTokensModuleResult.Color.Content.Muted.Transparency)
	})
	local ColorSequence1 = ColorSequence.new({
		ColorSequenceKeypoint.new(0, UseTokensModuleResult.Color.Content.Emphasis.Color3),
		ColorSequenceKeypoint.new(0.4999, UseTokensModuleResult.Color.Content.Emphasis.Color3),
		ColorSequenceKeypoint.new(0.5, UseTokensModuleResult.Color.Content.Muted.Color3),
		ColorSequenceKeypoint.new(1, UseTokensModuleResult.Color.Content.Muted.Color3)
	})
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "size-full-full", ref = Ref }), {
		LeftGradient = ReactModule.createElement(ViewModule, {
			tag = "position-top-left clip",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = ReactModule.createElement(ImageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "position-top-left content-emphasis",
				Size = UDim2.fromScale(2, 1),
				testId = `{WithDefaultsModuleResult.testId}--left-gradient`
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Transparency = NumberSequence1,
					Color = ColorSequence1,
					Rotation = WithDefaultsModuleResult.progress:map(function(p2: number): number --[[ Line: 60 ]]
						return (math.clamp(p2 * 360, 180, 360))
					end)
				})
			})
		}),
		RightGradient = ReactModule.createElement(ViewModule, {
			tag = "position-top-center clip",
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = ReactModule.createElement(ImageModule, {
				Image = "rbxasset://textures/ui/Controls/RadialFill.png",
				tag = "content-emphasis",
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0),
				testId = `{WithDefaultsModuleResult.testId}--right-gradient`
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Transparency = NumberSequence1,
					Color = ColorSequence1,
					Rotation = WithDefaultsModuleResult.progress:map(function(p2: number): number --[[ Line: 80 ]]
						return (math.clamp(p2 * 360, 0, 180))
					end)
				})
			})
		})
	})
end))