local foundation = script:FindFirstAncestor("Foundation")
local dashModule = require(foundation.Parent.Dash)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Components.Types)
local iconSizeModule = require(foundation.Enums.IconSize)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local _ = require(foundation.Providers.Style.Tokens)
local constantsModule = require(foundation.Constants)
local getSharedVariantsModule = require(foundation.Components.Button.getSharedVariants)

local var1 = function(p1)
	-- upvalues: getSharedVariantsModule (ref), inputSizeModule (ref), iconSizeModule (ref), closeAffordanceVariantModule (ref), dashModule (ref), colorNamespaceModule (ref), constantsModule (ref)
	local var2 = getSharedVariantsModule(p1)
	
	return {
		common = {
			container = { tag = "row align-x-center align-y-center auto-xy clip" }
		},
		types = {
			[closeAffordanceVariantModule.OverMedia] = dashModule.map(colorNamespaceModule, function()
				-- upvalues: p1 (ref)
				return {
					container = { tag = "bg-over-media-100" },
					content = { style = p1.Color.Content.Emphasis }
				}
			end),
			[closeAffordanceVariantModule.Utility] = dashModule.map(colorNamespaceModule, function(p2)
				-- upvalues: constantsModule (copy), p1 (ref)
				return {
					container = {
						stateLayer = {
							mode = constantsModule.COLOR_NAMESPACE_TO_STATE_LAYER_MODE[false][p2]
						}
					},
					content = { style = p1[p2].Content.Emphasis }
				}
			end)
		},
		sizes = {
			[true] = {
				[inputSizeModule.XSmall] = {
					container = {
						size = UDim2.fromOffset(var2.sizes[inputSizeModule.XSmall].container.height, var2.sizes[inputSizeModule.XSmall].container.height),
						padding = UDim.new(0, p1.Size.Size_100)
					},
					content = { iconSize = iconSizeModule.Small }
				},
				[inputSizeModule.Small] = {
					container = {
						size = UDim2.fromOffset(var2.sizes[inputSizeModule.Small].container.height, var2.sizes[inputSizeModule.Small].container.height),
						padding = UDim.new(0, p1.Size.Size_150)
					},
					content = { iconSize = iconSizeModule.Medium }
				},
				[inputSizeModule.Medium] = {
					container = {
						size = UDim2.fromOffset(var2.sizes[inputSizeModule.Medium].container.height, var2.sizes[inputSizeModule.Medium].container.height),
						padding = UDim.new(0, p1.Size.Size_200)
					},
					content = { iconSize = iconSizeModule.Large }
				}
			},
			[false] = {
				[inputSizeModule.XSmall] = { content = { iconSize = iconSizeModule.XSmall } },
				[inputSizeModule.Small] = { content = { iconSize = iconSizeModule.Small } },
				[inputSizeModule.Medium] = { content = { iconSize = iconSizeModule.Large } }
			}
		},
		padding = {
			[true] = { container = { radius = p1.Radius.Medium } },
			[false] = { container = { radius = 0 } }
		},
		circular = {
			[true] = { container = { radius = p1.Radius.Circle } },
			[false] = {}
		}
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: variantsContextModule (ref), var1 (ref), closeAffordanceVariantModule (ref), composeStyleVariantModule (ref), colorNamespaceModule (ref)
	local closeAffordance = variantsContextModule.useVariants("CloseAffordance", var1, p1)
	
	return composeStyleVariantModule(closeAffordance.common, closeAffordance.types[p3][p4 or colorNamespaceModule.Color], closeAffordance.sizes[p5][p2], closeAffordance.padding[p5], closeAffordance.circular[if p3 ~= closeAffordanceVariantModule.OverMedia then p6 else true])
end