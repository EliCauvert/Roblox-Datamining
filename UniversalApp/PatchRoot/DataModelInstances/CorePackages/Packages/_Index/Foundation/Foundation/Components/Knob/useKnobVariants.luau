local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Components.Types)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local getKnobSizeModule = require(script.Parent.getKnobSize)
local iconSizeModule = require(foundation.Enums.IconSize)
local flagsModule = require(foundation.Utility.Flags)

local function computeProps(p0)
	local var9 = p0.size.X.Offset + p0.shadowPadding * 2
	
	return {
		knob = { size = p0.size, iconSize = p0.iconSize },
		knobShadow = {
			size = UDim2.fromOffset(var9, var9),
			padding = p0.shadowPadding
		}
	}
end

local function variantsFactory(p1)
	-- upvalues: flagsModule (ref), inputSizeModule (ref), computeProps (ref), iconSizeModule (ref), getKnobSizeModule (ref)
	return {
		common = {
			knob = {
				tag = if flagsModule.FoundationToggleBetaUpdate then "align-x-center align-y-center position-center-center anchor-center-center auto-xy radius-circle" else "position-center-center anchor-center-center auto-xy radius-circle"
			},
			knobShadow = { tag = "position-center-center anchor-center-center" }
		},
		sizes = {
			[inputSizeModule.XSmall] = computeProps({
				iconSize = iconSizeModule.XSmall,
				size = getKnobSizeModule(p1, inputSizeModule.XSmall),
				shadowPadding = p1.Padding.XXSmall
			}),
			[inputSizeModule.Small] = computeProps({
				iconSize = iconSizeModule.Small,
				size = getKnobSizeModule(p1, inputSizeModule.Small),
				shadowPadding = p1.Padding.XSmall
			}),
			[inputSizeModule.Medium] = computeProps({
				iconSize = if flagsModule.FoundationToggleBetaUpdate then iconSizeModule.Small else iconSizeModule.Medium,
				size = getKnobSizeModule(p1, inputSizeModule.Medium),
				shadowPadding = p1.Padding.Small
			}),
			[inputSizeModule.Large] = computeProps({
				iconSize = if flagsModule.FoundationToggleBetaUpdate then iconSizeModule.Small else iconSizeModule.Large,
				size = getKnobSizeModule(p1, inputSizeModule.Large),
				shadowPadding = p1.Padding.Small
			})
		},
		isInverse = {
			[false] = {
				knob = { style = p1.Color.Content.Emphasis },
				iconContainer = { backgroundStyle = p1.Inverse.Content.Emphasis }
			},
			[true] = {
				knob = { style = p1.Inverse.Content.Emphasis },
				iconContainer = { backgroundStyle = p1.Color.Content.Emphasis }
			}
		}
	}
end

return function(p2, p3, p4)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local knob = variantsContextModule.useVariants("Knob", variantsFactory, p2)
	
	return composeStyleVariantModule(knob.common, knob.sizes[p3], knob.isInverse[p4])
end