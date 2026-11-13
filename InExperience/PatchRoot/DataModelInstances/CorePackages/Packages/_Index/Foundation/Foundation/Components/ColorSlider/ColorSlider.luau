local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local ImageModule = require(Foundation.Components.Image)
local InternalSliderModule = require(Foundation.Components.InternalSlider)
local KnobModule = require(Foundation.Components.Knob)
local ViewModule = require(Foundation.Components.View)
local ColorSliderTypeModule = require(Foundation.Enums.ColorSliderType)
local InputSizeModule = require(Foundation.Enums.InputSize)
local VisibilityModule = require(Foundation.Enums.Visibility)
local UseBindableModule = require(Foundation.Utility.useBindable)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ColorSequence1 = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
	ColorSequenceKeypoint.new(0.16666666666666666, Color3.new(1, 1, 0)),
	ColorSequenceKeypoint.new(0.3333333333333333, Color3.new(0, 1, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
	ColorSequenceKeypoint.new(0.6666666666666666, Color3.new(0, 0, 1)),
	ColorSequenceKeypoint.new(0.8333333333333334, Color3.new(1, 0, 1)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
})
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(1, 0)
})

local function createAlphaGradient(p1): ColorSequence
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, p1),
		ColorSequenceKeypoint.new(1, p1)
	})
end

local config = {
	isDisabled = false,
	testId = "--foundation-color-slider",
	type = ColorSliderTypeModule.Hue,
	baseColor = ReactModule.createBinding(Color3.new(1, 1, 1))
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseBindableModule (copy), ColorSliderTypeModule (copy), ReactModule (copy), KnobModule (copy), InputSizeModule (copy), ViewModule (copy), ImageModule (copy), createAlphaGradient (copy), NumberSequence1 (copy), ColorSequence1 (copy), InternalSliderModule (copy), WithCommonPropsModule (copy), VisibilityModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseBindableModuleResult = UseBindableModule(WithDefaultsModuleResult.value)
	local IsTypeMatch = WithDefaultsModuleResult.type == ColorSliderTypeModule.Alpha
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsTypeMatch (copy), ReactModule (upval), WithDefaultsModuleResult (copy), UseBindableModuleResult (copy)
		return if IsTypeMatch then ReactModule.joinBindings({
			baseColor = WithDefaultsModuleResult.baseColor,
			value = UseBindableModuleResult
		}):map(function(p2)
			return { Color3 = p2.baseColor, Transparency = 1 - p2.value }
		end) else UseBindableModuleResult:map(function(Hue)
			return { Transparency = 0, Color3 = Color3.fromHSV(Hue, 1, 1) }
		end)
	end, {
		IsTypeMatch,
		UseBindableModuleResult,
		WithDefaultsModuleResult.baseColor
	})
	
	return ReactModule.createElement(InternalSliderModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		isContained = true,
		thumbs = ReactModule.useMemo(function()
			-- upvalues: UseBindableModuleResult (copy), WithDefaultsModuleResult (copy)
			return {
				{
					value = UseBindableModuleResult:map(function(Value: number): number
						return (math.clamp(Value, 0, 1))
					end),
					testId = `{WithDefaultsModuleResult.testId}--thumb`
				}
			}
		end, { UseBindableModuleResult, WithDefaultsModuleResult.testId }),
		onValueChanged = ReactModule.useCallback(function(_, p2)
			-- upvalues: WithDefaultsModuleResult (copy)
			if WithDefaultsModuleResult.onValueChanged then
				WithDefaultsModuleResult.onValueChanged(p2)
			end
		end, { WithDefaultsModuleResult.onValueChanged }),
		renderThumb = ReactModule.useCallback(function(_, _)
			-- upvalues: ReactModule (upval), KnobModule (upval), InputSizeModule (upval), UseMemoResult (copy), UseTokensModuleResult (copy), WithDefaultsModuleResult (copy)
			return ReactModule.createElement(KnobModule, {
				hasShadow = true,
				size = InputSizeModule.Medium,
				style = UseMemoResult,
				stroke = {
					Color = UseTokensModuleResult.Color.System.Contrast.Color3,
					Thickness = UseTokensModuleResult.Stroke.Thicker,
					Transparency = UseTokensModuleResult.Color.System.Contrast.Transparency
				},
				testId = `{WithDefaultsModuleResult.testId}--knob`
			})
		end, {
			UseMemoResult,
			WithDefaultsModuleResult.testId,
			UseTokensModuleResult
		}),
		size = InputSizeModule.Medium,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		knobVisibility = VisibilityModule.Always,
		onDragStarted = WithDefaultsModuleResult.onDragStarted,
		onDragEnded = WithDefaultsModuleResult.onDragEnded
	}), {
		Track = if IsTypeMatch then ReactModule.createElement(ViewModule, {
			tag = "size-full-400 position-center-center anchor-center-center radius-circle",
			ClipsDescendants = true,
			testId = `{WithDefaultsModuleResult.testId}--track`
		}, {
			Checkerboard = ReactModule.createElement(ImageModule, {
				Image = "component_assets/checkerboard_12",
				tag = "size-full",
				ZIndex = 1,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(UseTokensModuleResult.Size.Size_400, UseTokensModuleResult.Size.Size_400),
				cornerRadius = UDim.new(1, 0)
			}),
			GradientOverlay = ReactModule.createElement(ViewModule, {
				tag = "size-full",
				ZIndex = 2,
				backgroundStyle = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				cornerRadius = UDim.new(1, 0)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Color = WithDefaultsModuleResult.baseColor:map(createAlphaGradient),
					Transparency = NumberSequence1
				})
			})
		}) else ReactModule.createElement(ViewModule, {
			tag = "size-full-400 position-center-center anchor-center-center radius-circle",
			backgroundStyle = UseTokensModuleResult.Color.Extended.White.White_100,
			testId = `{WithDefaultsModuleResult.testId}--track`
		}, {
			Gradient = ReactModule.createElement("UIGradient", { Color = ColorSequence1 })
		})
	})
end