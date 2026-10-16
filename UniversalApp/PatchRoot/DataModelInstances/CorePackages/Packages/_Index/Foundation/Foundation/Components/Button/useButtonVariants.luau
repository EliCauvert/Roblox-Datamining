local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.ButtonVariant)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local GetSharedVariantsModule = require(script.Parent.getSharedVariants)
local _ = require(Foundation.Providers.Style.Tokens)

local function v9(p1) --[[ Line: 47 ]]
	-- upvalues: GetSharedVariantsModule (copy), InputSizeModule (copy)
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
				text = { tag = "text-label-small" }
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
				text = { tag = "text-label-small" }
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
				text = { tag = "text-label-medium" }
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
				text = { tag = "text-label-large" }
			}
		},
		types = SharedVariantsModule.types
	}
end

return function(p1, p2, p3, p4) --[[ Line: 117 ]]
	-- upvalues: VariantsContextModule (copy), v9 (copy), ComposeStyleVariantModule (copy), ColorNamespaceModule (copy)
	local Button = VariantsContextModule.useVariants("Button", v9, p1)
	
	return ComposeStyleVariantModule(Button.common, Button.sizes[p2], Button.types[p3][p4 or ColorNamespaceModule.Color])
end