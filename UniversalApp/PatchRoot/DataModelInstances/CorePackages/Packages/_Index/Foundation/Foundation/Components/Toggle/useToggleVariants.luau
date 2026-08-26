local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.InternalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ControlState)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local getKnobSizeModule = require(foundation.Components.Knob.getKnobSize)

local function computeProps(p1)
	local offset = p1.knobSize.X.Offset
	local var1 = (p1.size.height - offset) / 2
	
	return {
		input = {
			tag = p1.tag,
			size = UDim2.fromOffset(p1.size.width, p1.size.height),
			stroke = { thickness = p1.strokeThickness }
		},
		knob = {
			offPosition = UDim2.new(0, var1, 0.5, 0),
			onPosition = UDim2.new(0, p1.size.width - offset - var1, 0.5, 0)
		}
	}
end

local function variantsFactory(p1)
	-- upvalues: inputSizeModule (ref), computeProps (ref), getKnobSizeModule (ref)
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
			[inputSizeModule.XSmall] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_700, height = p1.Size.Size_400 },
				knobSize = getKnobSizeModule(p1, inputSizeModule.XSmall),
				strokeThickness = p1.Stroke.None
			}),
			[inputSizeModule.Small] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_800, height = p1.Size.Size_500 },
				knobSize = getKnobSizeModule(p1, inputSizeModule.Small),
				strokeThickness = p1.Stroke.None
			}),
			[inputSizeModule.Medium] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_1000, height = p1.Size.Size_600 },
				knobSize = getKnobSizeModule(p1, inputSizeModule.Medium),
				strokeThickness = p1.Stroke.None
			}),
			[inputSizeModule.Large] = computeProps({
				tag = "radius-circle",
				size = { width = p1.Size.Size_1100, height = p1.Size.Size_600 },
				knobSize = getKnobSizeModule(p1, inputSizeModule.Medium),
				strokeThickness = p1.Stroke.None
			})
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local toggle = variantsContextModule.useVariants("Toggle", variantsFactory, p1)
	
	return composeStyleVariantModule(toggle.common, toggle.sizes[p2])
end