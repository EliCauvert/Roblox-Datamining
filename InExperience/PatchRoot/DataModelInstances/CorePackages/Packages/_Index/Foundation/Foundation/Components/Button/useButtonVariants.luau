local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ButtonVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local getSharedVariantsModule = require(script.Parent.getSharedVariants)
local _ = require(foundation.Providers.Style.Tokens)

local var6 = function(p0)
	-- upvalues: getSharedVariantsModule (ref), inputSizeModule (ref)
	local var7 = getSharedVariantsModule(p0)
	
	return {
		common = {
			container = { tag = "row align-x-center align-y-center clip" },
			text = { tag = "shrink size-0-full auto-x text-truncate-end" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = "gap-xsmall padding-small",
					radius = var7.sizes[inputSizeModule.XSmall].container.radius,
					height = var7.sizes[inputSizeModule.XSmall].container.height
				},
				icon = {
					size = UDim2.fromOffset(p0.Size.Size_300, p0.Size.Size_300)
				},
				text = { tag = "text-label-small" }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = "gap-xsmall padding-small",
					radius = var7.sizes[inputSizeModule.Small].container.radius,
					height = var7.sizes[inputSizeModule.Small].container.height
				},
				icon = {
					size = UDim2.fromOffset(p0.Size.Size_400, p0.Size.Size_400)
				},
				text = { tag = "text-label-small" }
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = "gap-small padding-medium",
					radius = var7.sizes[inputSizeModule.Medium].container.radius,
					height = var7.sizes[inputSizeModule.Medium].container.height
				},
				icon = {
					size = UDim2.fromOffset(p0.Size.Size_500, p0.Size.Size_500)
				},
				text = { tag = "text-label-medium" }
			},
			[inputSizeModule.Large] = {
				container = {
					tag = "gap-small padding-medium",
					radius = var7.sizes[inputSizeModule.Large].container.radius,
					height = var7.sizes[inputSizeModule.Large].container.height
				},
				icon = {
					size = UDim2.fromOffset(p0.Size.Size_600, p0.Size.Size_600)
				},
				text = { tag = "text-label-large" }
			}
		},
		types = var7.types
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), var6 (ref), composeStyleVariantModule (ref), colorNamespaceModule (ref)
	local button = variantsContextModule.useVariants("Button", var6, p1)
	
	return composeStyleVariantModule(button.common, button.sizes[p2], button.types[p3][p4 or colorNamespaceModule.Color])
end