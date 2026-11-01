local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Components.Types)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local GetKnobSizeModule = require(script.Parent.getKnobSize)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function _(p1)
	return { knob = { size = p1.size, iconSize = p1.iconSize } }
end

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy), GetKnobSizeModule (copy)
	local XSmall = InputSizeModule.XSmall
	local config = {
		iconSize = IconSizeModule.XSmall,
		size = GetKnobSizeModule(p1, InputSizeModule.XSmall)
	}
	local config1 = {
		knob = { size = config.size, iconSize = config.iconSize }
	}
	local Small = InputSizeModule.Small
	local config2 = {
		iconSize = IconSizeModule.Small,
		size = GetKnobSizeModule(p1, InputSizeModule.Small)
	}
	local config21 = {
		knob = { size = config2.size, iconSize = config2.iconSize }
	}
	local Medium = InputSizeModule.Medium
	local config3 = {
		iconSize = IconSizeModule.Small,
		size = GetKnobSizeModule(p1, InputSizeModule.Medium)
	}
	local config31 = {
		knob = { size = config3.size, iconSize = config3.iconSize }
	}
	local Large = InputSizeModule.Large
	local config4 = {
		iconSize = IconSizeModule.Small,
		size = GetKnobSizeModule(p1, InputSizeModule.Large)
	}
	
	return {
		common = {
			knob = {
				tag = "align-x-center align-y-center position-center-center anchor-center-center auto-xy radius-circle"
			}
		},
		sizes = {
			[XSmall] = config1,
			[Small] = config21,
			[Medium] = config31,
			[Large] = {
				knob = { size = config4.size, iconSize = config4.iconSize }
			}
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