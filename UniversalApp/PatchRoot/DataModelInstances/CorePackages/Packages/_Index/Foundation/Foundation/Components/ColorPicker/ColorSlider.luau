local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local ImageModule = require(Foundation.Components.Image)
local KnobModule = require(Foundation.Components.Knob)
local SliderModule = require(Foundation.Components.Slider)
local ViewModule = require(Foundation.Components.View)
local ColorSliderTypeModule = require(Foundation.Enums.ColorSliderType)
local InputSizeModule = require(Foundation.Enums.InputSize)
local SliderVariantModule = require(Foundation.Enums.SliderVariant)
local VisibilityModule = require(Foundation.Enums.Visibility)
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

local function createAlphaGradient(p1): ColorSequence
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, p1),
		ColorSequenceKeypoint.new(1, p1)
	})
end

local config = {
	sliderType = ColorSliderTypeModule.Hue,
	baseColor = ReactModule.createBinding(Color3.new(1, 1, 1))
}

return function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ColorSliderTypeModule (copy), ColorSequence1 (copy), createAlphaGradient (copy), ReactModule (copy), SliderModule (copy), InputSizeModule (copy), SliderVariantModule (copy), VisibilityModule (copy), KnobModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ImageModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local SliderType = WithDefaultsModuleResult.sliderType
	local Value = WithDefaultsModuleResult.value
	local OnValueChanged = WithDefaultsModuleResult.onValueChanged
	local ColorSequence2 = if SliderType == ColorSliderTypeModule.Hue then ColorSequence1 else WithDefaultsModuleResult.baseColor:map(createAlphaGradient)
	local MapResult = nil
	local NumberSequence1: NumberSequence? = nil
	
	if SliderType == ColorSliderTypeModule.Hue then
		MapResult = Value:map(function(Hue)
			return { Transparency = 0, Color3 = Color3.fromHSV(Hue, 1, 1) }
		end)
	elseif SliderType == ColorSliderTypeModule.Alpha then
		NumberSequence1 = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0)
		})
		MapResult = ReactModule.joinBindings({
			baseColor = WithDefaultsModuleResult.baseColor,
			value = Value
		}):map(function(p2)
			return { Color3 = p2.baseColor, Transparency = 1 - p2.value }
		end)
	end
	local Element = ReactModule.createElement(SliderModule, {
		isContained = true,
		value = Value,
		onValueChanged = OnValueChanged,
		onDragStarted = WithDefaultsModuleResult.onDragStarted,
		onDragEnded = WithDefaultsModuleResult.onDragEnded,
		size = InputSizeModule.Medium,
		variant = SliderVariantModule.Utility,
		width = UDim.new(1, 0),
		knobVisibility = VisibilityModule.Always,
		knob = ReactModule.createElement(KnobModule, {
			hasShadow = true,
			size = InputSizeModule.Small,
			style = MapResult,
			stroke = {
				Color = UseTokensModuleResult.Color.System.Contrast.Color3,
				Thickness = UseTokensModuleResult.Stroke.Thicker,
				Transparency = UseTokensModuleResult.Color.System.Contrast.Transparency
			}
		})
	})
	
	return if SliderType == ColorSliderTypeModule.Alpha then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = "size-full-300" }), {
		Background = ReactModule.createElement(ViewModule, {
			tag = "size-full stroke-standard stroke-emphasis radius-circle",
			ClipsDescendants = true,
			ZIndex = 1
		}, {
			Checkerboard = ReactModule.createElement(ImageModule, {
				Image = "component_assets/checkerboard_12",
				tag = "size-full",
				ZIndex = 1,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(UseTokensModuleResult.Size.Size_300, UseTokensModuleResult.Size.Size_300),
				cornerRadius = UDim.new(1, 0)
			}),
			GradientOverlay = ReactModule.createElement(ViewModule, {
				tag = "size-full",
				ZIndex = 2,
				backgroundStyle = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				cornerRadius = UDim.new(1, 0)
			}, {
				Gradient = ReactModule.createElement("UIGradient", { Color = ColorSequence2, Transparency = NumberSequence1 })
			})
		}),
		SliderContainer = ReactModule.createElement(ViewModule, { tag = "row align-y-center size-full", ZIndex = 2 }, { Slider = Element })
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "row align-y-center size-full-300 stroke-standard stroke-emphasis radius-circle",
		backgroundStyle = UseTokensModuleResult.Color.Extended.White.White_100
	}), {
		Gradient = ReactModule.createElement("UIGradient", { Color = ColorSequence2 }),
		Slider = Element
	})
end