local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local imageModule = require(foundation.Components.Image)
local knobModule = require(foundation.Components.Knob)
local sliderModule = require(foundation.Components.Slider)
local viewModule = require(foundation.Components.View)
local colorSliderTypeModule = require(foundation.Enums.ColorSliderType)
local inputSizeModule = require(foundation.Enums.InputSize)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local visibilityModule = require(foundation.Enums.Visibility)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local colorSequence = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
	ColorSequenceKeypoint.new(0.166666666667, Color3.new(1, 1, 0)),
	ColorSequenceKeypoint.new(0.333333333333, Color3.new(0, 1, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
	ColorSequenceKeypoint.new(0.666666666667, Color3.new(0, 0, 1)),
	ColorSequenceKeypoint.new(0.833333333333, Color3.new(1, 0, 1)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
})

local function createAlphaGradient(x) --[[ line: 44 ]]
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, x),
		ColorSequenceKeypoint.new(1, x)
	})
end

local t = {
	sliderType = colorSliderTypeModule.Hue,
	baseColor = reactModule.createBinding(Color3.new(1, 1, 1))
}

return function(p0) --[[ line: 56 | named "ColorSlider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), colorSliderTypeModule (ref), colorSequence (ref), createAlphaGradient (ref), reactModule (ref), sliderModule (ref), inputSizeModule (ref), sliderVariantModule (ref), visibilityModule (ref), knobModule (ref), viewModule (ref), withCommonPropsModule (ref), imageModule (ref)
	local var16 = withDefaultsModule(p0, t)
	local var17 = useTokensModule()
	local sliderType = var16.sliderType
	local value = var16.value
	local onValueChanged = var16.onValueChanged
	local var18 = if sliderType == colorSliderTypeModule.Hue then colorSequence else var16.baseColor:map(createAlphaGradient)
	local var19 = nil
	local numberSequence = nil
	
	if sliderType == colorSliderTypeModule.Hue then
		var19 = value:map(function(p1) --[[ line: 71 ]]
			return { Transparency = 0, Color3 = Color3.fromHSV(p1, 1, 1) }
		end)
	elseif sliderType == colorSliderTypeModule.Alpha then
		numberSequence = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0)
		})
		var19 = reactModule.joinBindings({ baseColor = var16.baseColor, value = value }):map(function(p2) --[[ line: 82 ]]
			return { Color3 = p2.baseColor, Transparency = 1 - p2.value }
		end)
	end
	local var21 = reactModule.createElement(sliderModule, {
		isContained = true,
		value = value,
		onValueChanged = onValueChanged,
		onDragStarted = var16.onDragStarted,
		onDragEnded = var16.onDragEnded,
		size = inputSizeModule.Medium,
		variant = sliderVariantModule.Utility,
		width = UDim.new(1, 0),
		knobVisibility = visibilityModule.Always,
		knob = reactModule.createElement(knobModule, {
			hasShadow = true,
			size = inputSizeModule.Small,
			style = var19,
			stroke = {
				Color = var17.Color.System.Contrast.Color3,
				Thickness = var17.Stroke.Thicker,
				Transparency = var17.Color.System.Contrast.Transparency
			}
		})
	})
	
	return if sliderType == colorSliderTypeModule.Alpha then reactModule.createElement(viewModule, withCommonPropsModule(var16, { tag = "size-full-300" }), {
		Background = reactModule.createElement(viewModule, {
			tag = "size-full stroke-standard stroke-emphasis radius-circle",
			ClipsDescendants = true,
			ZIndex = 1
		}, {
			Checkerboard = reactModule.createElement(imageModule, {
				Image = "component_assets/checkerboard_12",
				tag = "size-full",
				ZIndex = 1,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(var17.Size.Size_300, var17.Size.Size_300),
				cornerRadius = UDim.new(1, 0)
			}),
			GradientOverlay = reactModule.createElement(viewModule, {
				tag = "size-full",
				ZIndex = 2,
				backgroundStyle = { Transparency = 0, Color3 = Color3.new(1, 1, 1) },
				cornerRadius = UDim.new(1, 0)
			}, {
				Gradient = reactModule.createElement("UIGradient", { Color = var18, Transparency = numberSequence })
			})
		}),
		SliderContainer = reactModule.createElement(viewModule, { tag = "row align-y-center size-full", ZIndex = 2 }, { Slider = var21 })
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var16, {
		tag = "row align-y-center size-full-300 stroke-standard stroke-emphasis radius-circle",
		backgroundStyle = var17.Color.Extended.White.White_100
	}), {
		Gradient = reactModule.createElement("UIGradient", { Color = var18 }),
		Slider = var21
	})
end