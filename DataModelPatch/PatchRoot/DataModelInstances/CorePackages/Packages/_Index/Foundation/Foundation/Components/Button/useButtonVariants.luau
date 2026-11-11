local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ButtonVariant)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local GetSharedVariantsModule = require(script.Parent.getSharedVariants)
local _ = require(Foundation.Providers.Style.Tokens)

local function v10(p1)
	-- upvalues: GetSharedVariantsModule (copy), InputSizeModule (copy), FlagsModule (copy)
	local SharedVariantsModule = GetSharedVariantsModule(p1)
	
	return {
		common = {
			container = { tag = "row align-x-center align-y-center clip" },
			text = { tag = "shrink size-0-full auto-x text-truncate-end" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = "gap-xsmall padding-small",
					radius = SharedVariantsModule.sizes[InputSizeModule.XSmall].container.radius,
					height = SharedVariantsModule.sizes[InputSizeModule.XSmall].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_300, p1.Size.Size_300)
				},
				text = {
					tag = {
						["text-label-small"] = FlagsModule.FoundationButtonLabelTypography,
						["text-title-small"] = not FlagsModule.FoundationButtonLabelTypography
					}
				}
			},
			[InputSizeModule.Small] = {
				container = {
					tag = "gap-xsmall padding-small",
					radius = SharedVariantsModule.sizes[InputSizeModule.Small].container.radius,
					height = SharedVariantsModule.sizes[InputSizeModule.Small].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400)
				},
				text = {
					tag = {
						["text-label-small"] = FlagsModule.FoundationButtonLabelTypography,
						["text-title-small"] = not FlagsModule.FoundationButtonLabelTypography
					}
				}
			},
			[InputSizeModule.Medium] = {
				container = {
					tag = "gap-small padding-medium",
					radius = SharedVariantsModule.sizes[InputSizeModule.Medium].container.radius,
					height = SharedVariantsModule.sizes[InputSizeModule.Medium].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				text = {
					tag = {
						["text-label-medium"] = FlagsModule.FoundationButtonLabelTypography,
						["text-title-medium"] = not FlagsModule.FoundationButtonLabelTypography
					}
				}
			},
			[InputSizeModule.Large] = {
				container = {
					tag = "gap-small padding-medium",
					radius = SharedVariantsModule.sizes[InputSizeModule.Large].container.radius,
					height = SharedVariantsModule.sizes[InputSizeModule.Large].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
				},
				text = {
					tag = {
						["text-label-large"] = FlagsModule.FoundationButtonLabelTypography,
						["text-title-large"] = not FlagsModule.FoundationButtonLabelTypography
					}
				}
			}
		},
		types = SharedVariantsModule.types
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: VariantsContextModule (copy), v10 (copy), ComposeStyleVariantModule (copy), ColorModeModule (copy)
	local Button = VariantsContextModule.useVariants("Button", v10, p1)
	
	return ComposeStyleVariantModule(Button.common, Button.sizes[p2], Button.types[p3][p4 or ColorModeModule.Color])
end