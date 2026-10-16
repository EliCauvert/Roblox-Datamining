local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.InternalInput)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ControlState)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local GetKnobSizeModule = require(Foundation.Components.Knob.getKnobSize)

local function computeProps(p1) --[[ Line: 29 ]]
	local Offset = p1.knobSize.X.Offset
	local HeightRatio = (p1.size.height - Offset) / 2
	
	return {
		input = {
			tag = p1.tag,
			size = UDim2.fromOffset(p1.size.width, p1.size.height),
			stroke = { thickness = p1.strokeThickness }
		},
		knob = {
			offPosition = UDim2.new(0, HeightRatio, 0.5, 0),
			onPosition = UDim2.new(0, p1.size.width - Offset - HeightRatio, 0.5, 0)
		}
	}
end

local function variantsFactory(p1) --[[ Line: 53 ]]
	-- upvalues: InputSizeModule (copy), computeProps (copy), GetKnobSizeModule (copy)
	return {
		common = {
			input = {
				colors = {
					backgroundStyle = p1.Color.ActionStandard.Background,
					hoverStyle = p1.Color.State.Hover,
					checkedStyle = p1.Color.System.Contrast,
					labelStyle = p1.Color.Content.Emphasis,
					labelHoverStyle = p1.Color.Content.Emphasis
				},
				cursorRadius = UDim.new(0, p1.Radius.Circle)
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_700, height = p1.Size.Size_400 },
				knobSize = GetKnobSizeModule(p1, InputSizeModule.XSmall),
				strokeThickness = p1.Stroke.None
			}),
			[InputSizeModule.Small] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_800, height = p1.Size.Size_500 },
				knobSize = GetKnobSizeModule(p1, InputSizeModule.Small),
				strokeThickness = p1.Stroke.None
			}),
			[InputSizeModule.Medium] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_1000, height = p1.Size.Size_600 },
				knobSize = GetKnobSizeModule(p1, InputSizeModule.Medium),
				strokeThickness = p1.Stroke.None
			}),
			[InputSizeModule.Large] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_1100, height = p1.Size.Size_600 },
				knobSize = GetKnobSizeModule(p1, InputSizeModule.Medium),
				strokeThickness = p1.Stroke.None
			})
		}
	}
end

return function(p1, p2) --[[ Line: 96 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Toggle = VariantsContextModule.useVariants("Toggle", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Toggle.common, Toggle.sizes[p2])
end