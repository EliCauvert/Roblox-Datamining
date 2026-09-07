local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ButtonVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local getSharedVariantsModule = require(script.Parent.getSharedVariants)
local _ = require(foundation.Providers.Style.Tokens)

local var1 = function(p1)
	-- upvalues: getSharedVariantsModule (ref), inputSizeModule (ref), flagsModule (ref)
	local var2 = getSharedVariantsModule(p1)
	
	return {
		common = {
			container = { tag = "row align-x-center align-y-center clip" },
			text = { tag = "shrink size-0-full auto-x text-truncate-end" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = "gap-xsmall padding-small",
					radius = var2.sizes[inputSizeModule.XSmall].container.radius,
					height = var2.sizes[inputSizeModule.XSmall].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_300, p1.Size.Size_300)
				},
				text = {
					tag = {
						["text-label-small"] = flagsModule.FoundationButtonLabelTypography,
						["text-title-small"] = not flagsModule.FoundationButtonLabelTypography
					}
				}
			},
			[inputSizeModule.Small] = {
				container = {
					tag = "gap-xsmall padding-small",
					radius = var2.sizes[inputSizeModule.Small].container.radius,
					height = var2.sizes[inputSizeModule.Small].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400)
				},
				text = {
					tag = {
						["text-label-small"] = flagsModule.FoundationButtonLabelTypography,
						["text-title-small"] = not flagsModule.FoundationButtonLabelTypography
					}
				}
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = "gap-small padding-medium",
					radius = var2.sizes[inputSizeModule.Medium].container.radius,
					height = var2.sizes[inputSizeModule.Medium].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
				},
				text = {
					tag = {
						["text-label-medium"] = flagsModule.FoundationButtonLabelTypography,
						["text-title-medium"] = not flagsModule.FoundationButtonLabelTypography
					}
				}
			},
			[inputSizeModule.Large] = {
				container = {
					tag = "gap-small padding-medium",
					radius = var2.sizes[inputSizeModule.Large].container.radius,
					height = var2.sizes[inputSizeModule.Large].container.height
				},
				icon = {
					size = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
				},
				text = {
					tag = {
						["text-label-large"] = flagsModule.FoundationButtonLabelTypography,
						["text-title-large"] = not flagsModule.FoundationButtonLabelTypography
					}
				}
			}
		},
		types = var2.types
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), var1 (ref), composeStyleVariantModule (ref), colorNamespaceModule (ref)
	local button = variantsContextModule.useVariants("Button", var1, p1)
	
	return composeStyleVariantModule(button.common, button.sizes[p2], button.types[p3][p4 or colorNamespaceModule.Color])
end