local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Components.Types)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local GetKnobSizeModule = require(script.Parent.getKnobSize)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function computeProps(p1)
	local NewOffset = p1.size.X.Offset + p1.shadowPadding * 2
	
	return {
		knob = { size = p1.size, iconSize = p1.iconSize },
		knobShadow = {
			size = UDim2.fromOffset(NewOffset, NewOffset),
			padding = p1.shadowPadding
		}
	}
end

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy), computeProps (copy), IconSizeModule (copy), GetKnobSizeModule (copy)
	return {
		common = {
			knob = {
				tag = "align-x-center align-y-center position-center-center anchor-center-center auto-xy radius-circle"
			},
			knobShadow = { tag = "position-center-center anchor-center-center" }
		},
		sizes = {
			[InputSizeModule.XSmall] = computeProps({
				iconSize = IconSizeModule.XSmall,
				size = GetKnobSizeModule(p1, InputSizeModule.XSmall),
				shadowPadding = p1.Padding.XXSmall
			}),
			[InputSizeModule.Small] = computeProps({
				iconSize = IconSizeModule.Small,
				size = GetKnobSizeModule(p1, InputSizeModule.Small),
				shadowPadding = p1.Padding.XSmall
			}),
			[InputSizeModule.Medium] = computeProps({
				iconSize = IconSizeModule.Small,
				size = GetKnobSizeModule(p1, InputSizeModule.Medium),
				shadowPadding = p1.Padding.Small
			}),
			[InputSizeModule.Large] = computeProps({
				iconSize = IconSizeModule.Small,
				size = GetKnobSizeModule(p1, InputSizeModule.Large),
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

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Knob = VariantsContextModule.useVariants("Knob", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Knob.common, Knob.sizes[p2], Knob.isInverse[p3])
end