local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ButtonVariant)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local GetSharedVariantsModule = require(Foundation.Components.Button.getSharedVariants)

local function v9(p1)
	-- upvalues: GetSharedVariantsModule (copy), InputSizeModule (copy)
	local SharedVariantsModule = GetSharedVariantsModule(p1)
	
	return {
		common = {},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					radius = SharedVariantsModule.sizes[InputSizeModule.XSmall].container.radius,
					size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.XSmall].container.height, SharedVariantsModule.sizes[InputSizeModule.XSmall].container.height),
					padding = UDim.new(0, p1.Size.Size_150)
				}
			},
			[InputSizeModule.Small] = {
				container = {
					radius = SharedVariantsModule.sizes[InputSizeModule.Small].container.radius,
					size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.Small].container.height, SharedVariantsModule.sizes[InputSizeModule.Small].container.height),
					padding = UDim.new(0, p1.Size.Size_200)
				}
			},
			[InputSizeModule.Medium] = {
				container = {
					radius = SharedVariantsModule.sizes[InputSizeModule.Medium].container.radius,
					size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.Medium].container.height, SharedVariantsModule.sizes[InputSizeModule.Medium].container.height),
					padding = UDim.new(0, p1.Size.Size_250)
				}
			},
			[InputSizeModule.Large] = {
				container = {
					radius = SharedVariantsModule.sizes[InputSizeModule.Large].container.radius,
					size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.Large].container.height, SharedVariantsModule.sizes[InputSizeModule.Large].container.height),
					padding = UDim.new(0, p1.Size.Size_300)
				}
			}
		},
		types = SharedVariantsModule.types
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: VariantsContextModule (copy), v9 (copy), ComposeStyleVariantModule (copy), ColorNamespaceModule (copy)
	local IconButton = VariantsContextModule.useVariants("IconButton", v9, p1)
	
	return ComposeStyleVariantModule(IconButton.common, IconButton.sizes[p2], IconButton.types[p3][p4 or ColorNamespaceModule.Color])
end