local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.InternalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ControlState)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local getKnobSizeModule = require(foundation.Components.Knob.getKnobSize)

local function computeProps(p0)
	local offset = p0.knobSize.X.Offset
	local var7 = (p0.size.height - offset) / 2
	
	return {
		input = {
			tag = p0.tag,
			size = UDim2.fromOffset(p0.size.width, p0.size.height),
			stroke = { thickness = p0.strokeThickness }
		},
		knob = {
			offPosition = UDim2.new(0, var7, 0.5, 0),
			onPosition = UDim2.new(0, p0.size.width - offset - var7, 0.5, 0)
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

return function(p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local toggle = variantsContextModule.useVariants("Toggle", variantsFactory, p2)
	
	return composeStyleVariantModule(toggle.common, toggle.sizes[p3])
end