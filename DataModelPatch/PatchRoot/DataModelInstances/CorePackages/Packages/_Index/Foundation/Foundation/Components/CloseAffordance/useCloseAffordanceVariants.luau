local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Components.Types)
local IconSizeModule = require(Foundation.Enums.IconSize)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local ConstantsModule = require(Foundation.Constants)
local GetSharedVariantsModule = require(Foundation.Components.Button.getSharedVariants)

local function v12(p1)
	-- upvalues: GetSharedVariantsModule (copy), InputSizeModule (copy), IconSizeModule (copy), CloseAffordanceVariantModule (copy), DashModule (copy), ColorModeModule (copy), ConstantsModule (copy)
	local SharedVariantsModule = GetSharedVariantsModule(p1)
	
	return {
		common = {
			container = { tag = "row align-x-center align-y-center auto-xy clip" }
		},
		types = {
			[CloseAffordanceVariantModule.OverMedia] = DashModule.map(ColorModeModule, function()
				-- upvalues: p1 (copy)
				return {
					container = { tag = "bg-over-media-100" },
					content = { style = p1.Color.Content.Emphasis }
				}
			end),
			[CloseAffordanceVariantModule.Utility] = DashModule.map(ColorModeModule, function(p2)
				-- upvalues: ConstantsModule (upval), p1 (copy)
				return {
					container = {
						stateLayer = {
							mode = ConstantsModule.COLOR_MODE_TO_STATE_LAYER_MODE[false][p2]
						}
					},
					content = { style = p1[p2].Content.Emphasis }
				}
			end)
		},
		sizes = {
			[true] = {
				[InputSizeModule.XSmall] = {
					container = {
						size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.XSmall].container.height, SharedVariantsModule.sizes[InputSizeModule.XSmall].container.height),
						padding = UDim.new(0, p1.Size.Size_100)
					},
					content = { iconSize = IconSizeModule.Small }
				},
				[InputSizeModule.Small] = {
					container = {
						size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.Small].container.height, SharedVariantsModule.sizes[InputSizeModule.Small].container.height),
						padding = UDim.new(0, p1.Size.Size_150)
					},
					content = { iconSize = IconSizeModule.Medium }
				},
				[InputSizeModule.Medium] = {
					container = {
						size = UDim2.fromOffset(SharedVariantsModule.sizes[InputSizeModule.Medium].container.height, SharedVariantsModule.sizes[InputSizeModule.Medium].container.height),
						padding = UDim.new(0, p1.Size.Size_200)
					},
					content = { iconSize = IconSizeModule.Large }
				}
			},
			[false] = {
				[InputSizeModule.XSmall] = { content = { iconSize = IconSizeModule.XSmall } },
				[InputSizeModule.Small] = { content = { iconSize = IconSizeModule.Small } },
				[InputSizeModule.Medium] = { content = { iconSize = IconSizeModule.Large } }
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

return function(p1, p2, OverMedia, p3, p4, p5)
	-- upvalues: VariantsContextModule (copy), v12 (copy), CloseAffordanceVariantModule (copy), ComposeStyleVariantModule (copy), ColorModeModule (copy)
	local CloseAffordance = VariantsContextModule.useVariants("CloseAffordance", v12, p1)
	
	return ComposeStyleVariantModule(CloseAffordance.common, CloseAffordance.types[OverMedia][p3 or ColorModeModule.Color], CloseAffordance.sizes[p4][p2], CloseAffordance.padding[p4], CloseAffordance.circular[OverMedia == CloseAffordanceVariantModule.OverMedia or p5])
end