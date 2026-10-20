local Foundation = script:FindFirstAncestor("Foundation")
local StatusBadgeShapeModule = require(Foundation.Enums.StatusBadgeShape)
local StatusBadgeSizeModule = require(Foundation.Enums.StatusBadgeSize)
local StatusBadgeVariantModule = require(Foundation.Enums.StatusBadgeVariant)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

function variantsFactory(p1)
	-- upvalues: StatusBadgeVariantModule (copy), StatusBadgeShapeModule (copy), StatusBadgeSizeModule (copy)
	return {
		common = {
			container = { tag = "row align-x-center align-y-center auto-xy" },
			statusLight = {
				tag = "row align-x-center align-y-center auto-x size-0-300 padding-x-xxsmall"
			},
			content = { tag = "row align-y-center auto-x size-0-full" },
			dot = { tag = "radius-circle" },
			text = {
				tag = "auto-xy text-align-x-left text-truncate-split padding-right-xxsmall",
				style = p1.Color.Content.Emphasis
			}
		},
		variants = {
			[StatusBadgeVariantModule.Standard] = { dot = { tag = "bg-system-neutral" } },
			[StatusBadgeVariantModule.Emphasis] = { dot = { tag = "bg-system-emphasis" } },
			[StatusBadgeVariantModule.Success] = { dot = { tag = "bg-system-success" } },
			[StatusBadgeVariantModule.Warning] = { dot = { tag = "bg-system-warning" } },
			[StatusBadgeVariantModule.Alert] = { dot = { tag = "bg-system-alert" } }
		},
		shapes = {
			[StatusBadgeShapeModule.Utility] = {},
			[StatusBadgeShapeModule.Box] = { container = { tag = "radius-small bg-shift-200" } }
		},
		sizes = {
			[StatusBadgeSizeModule.XSmall] = {
				container = { tag = "size-0-400" },
				content = { tag = "gap-xxsmall" },
				dot = { tag = "size-150" },
				text = { tag = "text-caption-small" }
			},
			[StatusBadgeSizeModule.Small] = {
				container = { tag = "size-0-600" },
				content = { gap = p1.Size.Size_150 },
				dot = { tag = "size-200" },
				text = { tag = "text-caption-medium" }
			}
		},
		boxSizes = {
			[StatusBadgeSizeModule.XSmall] = { container = { tag = "padding-x-xsmall" } },
			[StatusBadgeSizeModule.Small] = { container = { tag = "padding-x-small" } }
		}
	}
end

return function(p1, p2, Box, p3)
	-- upvalues: VariantsContextModule (copy), ComposeStyleVariantModule (copy), StatusBadgeShapeModule (copy)
	local StatusBadge = VariantsContextModule.useVariants("StatusBadge", variantsFactory, p1)
	
	return ComposeStyleVariantModule(StatusBadge.common, StatusBadge.variants[p2], StatusBadge.shapes[Box], StatusBadge.sizes[p3], if Box == StatusBadgeShapeModule.Box then StatusBadge.boxSizes[p3] else nil)
end