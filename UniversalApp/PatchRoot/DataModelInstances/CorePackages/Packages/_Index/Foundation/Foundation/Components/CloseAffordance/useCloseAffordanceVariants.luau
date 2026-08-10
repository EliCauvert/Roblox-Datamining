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

local var10 = function(p0) --[[ line: 45 ]]
	-- upvalues: getSharedVariantsModule (ref), inputSizeModule (ref), iconSizeModule (ref), closeAffordanceVariantModule (ref), dashModule (ref), colorNamespaceModule (ref), constantsModule (ref)
	local var11 = getSharedVariantsModule(p0)
	
	return {
		common = {
			container = { tag = "row align-x-center align-y-center auto-xy clip" }
		},
		types = {
			[closeAffordanceVariantModule.OverMedia] = dashModule.map(colorNamespaceModule, function() --[[ line: 101 ]]
				-- upvalues: p0 (ref)
				return {
					container = { tag = "bg-over-media-100" },
					content = { style = p0.Color.Content.Emphasis }
				}
			end),
			[closeAffordanceVariantModule.Utility] = dashModule.map(colorNamespaceModule, function(p1) --[[ line: 107 ]]
				-- upvalues: constantsModule (copy), p0 (ref)
				return {
					container = {
						stateLayer = {
							mode = constantsModule.COLOR_NAMESPACE_TO_STATE_LAYER_MODE[false][p1]
						}
					},
					content = { style = p0[p1].Content.Emphasis }
				}
			end)
		},
		sizes = {
			[true] = {
				[inputSizeModule.XSmall] = {
					container = {
						size = UDim2.fromOffset(var11.sizes[inputSizeModule.XSmall].container.height, var11.sizes[inputSizeModule.XSmall].container.height),
						padding = UDim.new(0, p0.Size.Size_100)
					},
					content = { iconSize = iconSizeModule.Small }
				},
				[inputSizeModule.Small] = {
					container = {
						size = UDim2.fromOffset(var11.sizes[inputSizeModule.Small].container.height, var11.sizes[inputSizeModule.Small].container.height),
						padding = UDim.new(0, p0.Size.Size_150)
					},
					content = { iconSize = iconSizeModule.Medium }
				},
				[inputSizeModule.Medium] = {
					container = {
						size = UDim2.fromOffset(var11.sizes[inputSizeModule.Medium].container.height, var11.sizes[inputSizeModule.Medium].container.height),
						padding = UDim.new(0, p0.Size.Size_200)
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
			[true] = { container = { radius = p0.Radius.Medium } },
			[false] = { container = { radius = 0 } }
		},
		circular = {
			[true] = { container = { radius = p0.Radius.Circle } },
			[false] = {}
		}
	}
end

return function(p2, p3, p4, p5, p6, p7) --[[ line: 138 ]]
	-- upvalues: variantsContextModule (ref), var10 (ref), closeAffordanceVariantModule (ref), composeStyleVariantModule (ref), colorNamespaceModule (ref)
	local closeAffordance = variantsContextModule.useVariants("CloseAffordance", var10, p2)
	
	return composeStyleVariantModule(closeAffordance.common, closeAffordance.types[p4][p5 or colorNamespaceModule.Color], closeAffordance.sizes[p6][p3], closeAffordance.padding[p6], closeAffordance.circular[if p4 ~= closeAffordanceVariantModule.OverMedia then p7 else true])
end