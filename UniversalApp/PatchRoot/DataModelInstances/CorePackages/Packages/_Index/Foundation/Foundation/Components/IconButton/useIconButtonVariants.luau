local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.ButtonVariant)
local colorModeModule = require(foundation.Enums.ColorMode)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local getSharedVariantsModule = require(foundation.Components.Button.getSharedVariants)

local var6 = function(p0) --[[ line: 41 ]]
	-- upvalues: getSharedVariantsModule (ref), inputSizeModule (ref)
	local var7 = getSharedVariantsModule(p0)
	
	return {
		common = {},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					radius = var7.sizes[inputSizeModule.XSmall].container.radius,
					size = UDim2.fromOffset(var7.sizes[inputSizeModule.XSmall].container.height, var7.sizes[inputSizeModule.XSmall].container.height),
					padding = UDim.new(0, p0.Size.Size_150)
				}
			},
			[inputSizeModule.Small] = {
				container = {
					radius = var7.sizes[inputSizeModule.Small].container.radius,
					size = UDim2.fromOffset(var7.sizes[inputSizeModule.Small].container.height, var7.sizes[inputSizeModule.Small].container.height),
					padding = UDim.new(0, p0.Size.Size_200)
				}
			},
			[inputSizeModule.Medium] = {
				container = {
					radius = var7.sizes[inputSizeModule.Medium].container.radius,
					size = UDim2.fromOffset(var7.sizes[inputSizeModule.Medium].container.height, var7.sizes[inputSizeModule.Medium].container.height),
					padding = UDim.new(0, p0.Size.Size_250)
				}
			},
			[inputSizeModule.Large] = {
				container = {
					radius = var7.sizes[inputSizeModule.Large].container.radius,
					size = UDim2.fromOffset(var7.sizes[inputSizeModule.Large].container.height, var7.sizes[inputSizeModule.Large].container.height),
					padding = UDim.new(0, p0.Size.Size_300)
				}
			}
		},
		types = var7.types
	}
end

return function(p1, p2, p3, p4) --[[ line: 92 ]]
	-- upvalues: variantsContextModule (ref), var6 (ref), composeStyleVariantModule (ref), colorModeModule (ref)
	local iconButton = variantsContextModule.useVariants("IconButton", var6, p1)
	
	return composeStyleVariantModule(iconButton.common, iconButton.sizes[p2], iconButton.types[p3][p4 or colorModeModule.Color])
end