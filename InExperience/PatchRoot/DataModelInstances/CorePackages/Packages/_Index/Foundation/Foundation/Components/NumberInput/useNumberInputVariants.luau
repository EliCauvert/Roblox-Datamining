local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.NumberInputControlsVariant)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy)
	return {
		common = {
			controls = { tag = "row align-y-center bg-action-standard" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				controls = {
					tag = "radius-small",
					width = p1.Size.Size_1200,
					buttonSize = p1.Size.Size_600,
					iconSize = IconSizeModule.XSmall,
					radius = p1.Radius.Small
				}
			},
			[InputSizeModule.Small] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_1600,
					buttonSize = p1.Size.Size_800,
					iconSize = IconSizeModule.Small,
					radius = p1.Radius.Medium
				}
			},
			[InputSizeModule.Medium] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_2000,
					buttonSize = p1.Size.Size_1000,
					iconSize = IconSizeModule.Medium,
					radius = p1.Radius.Medium
				}
			},
			[InputSizeModule.Large] = {
				controls = {
					tag = "radius-medium",
					width = p1.Size.Size_2400,
					buttonSize = p1.Size.Size_1200,
					iconSize = IconSizeModule.Large,
					radius = p1.Radius.Medium
				}
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local NumberInput = VariantsContextModule.useVariants("NumberInput", variantsFactory, p1)
	
	return ComposeStyleVariantModule(NumberInput.common, NumberInput.sizes[p2])
end