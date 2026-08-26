local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ButtonVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local getSharedVariantsModule = require(foundation.Components.Button.getSharedVariants)

local var1 = function(p1)
	-- upvalues: getSharedVariantsModule (ref), inputSizeModule (ref)
	local var2 = getSharedVariantsModule(p1)
	
	return {
		common = {},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					radius = var2.sizes[inputSizeModule.XSmall].container.radius,
					size = UDim2.fromOffset(var2.sizes[inputSizeModule.XSmall].container.height, var2.sizes[inputSizeModule.XSmall].container.height),
					padding = UDim.new(0, p1.Size.Size_150)
				}
			},
			[inputSizeModule.Small] = {
				container = {
					radius = var2.sizes[inputSizeModule.Small].container.radius,
					size = UDim2.fromOffset(var2.sizes[inputSizeModule.Small].container.height, var2.sizes[inputSizeModule.Small].container.height),
					padding = UDim.new(0, p1.Size.Size_200)
				}
			},
			[inputSizeModule.Medium] = {
				container = {
					radius = var2.sizes[inputSizeModule.Medium].container.radius,
					size = UDim2.fromOffset(var2.sizes[inputSizeModule.Medium].container.height, var2.sizes[inputSizeModule.Medium].container.height),
					padding = UDim.new(0, p1.Size.Size_250)
				}
			},
			[inputSizeModule.Large] = {
				container = {
					radius = var2.sizes[inputSizeModule.Large].container.radius,
					size = UDim2.fromOffset(var2.sizes[inputSizeModule.Large].container.height, var2.sizes[inputSizeModule.Large].container.height),
					padding = UDim.new(0, p1.Size.Size_300)
				}
			}
		},
		types = var2.types
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), var1 (ref), composeStyleVariantModule (ref), colorNamespaceModule (ref)
	local iconButton = variantsContextModule.useVariants("IconButton", var1, p1)
	
	return composeStyleVariantModule(iconButton.common, iconButton.sizes[p2], iconButton.types[p3][p4 or colorNamespaceModule.Color])
end