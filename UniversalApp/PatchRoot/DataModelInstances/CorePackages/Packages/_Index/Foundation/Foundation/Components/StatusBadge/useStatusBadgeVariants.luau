local foundation = script:FindFirstAncestor("Foundation")
local statusBadgeShapeModule = require(foundation.Enums.StatusBadgeShape)
local statusBadgeSizeModule = require(foundation.Enums.StatusBadgeSize)
local statusBadgeVariantModule = require(foundation.Enums.StatusBadgeVariant)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

function variantsFactory(p0)
	-- upvalues: statusBadgeVariantModule (ref), statusBadgeShapeModule (ref), statusBadgeSizeModule (ref)
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
				style = p0.Color.Content.Emphasis
			}
		},
		variants = {
			[statusBadgeVariantModule.Standard] = { dot = { tag = "bg-system-neutral" } },
			[statusBadgeVariantModule.Emphasis] = { dot = { tag = "bg-system-emphasis" } },
			[statusBadgeVariantModule.Success] = { dot = { tag = "bg-system-success" } },
			[statusBadgeVariantModule.Warning] = { dot = { tag = "bg-system-warning" } },
			[statusBadgeVariantModule.Alert] = { dot = { tag = "bg-system-alert" } }
		},
		shapes = {
			[statusBadgeShapeModule.Utility] = {},
			[statusBadgeShapeModule.Box] = { container = { tag = "radius-small bg-shift-200" } }
		},
		sizes = {
			[statusBadgeSizeModule.XSmall] = {
				container = { tag = "size-0-400" },
				content = { tag = "gap-xxsmall" },
				dot = { tag = "size-150" },
				text = { tag = "text-caption-small" }
			},
			[statusBadgeSizeModule.Small] = {
				container = { tag = "size-0-600" },
				content = { gap = p0.Size.Size_150 },
				dot = { tag = "size-200" },
				text = { tag = "text-caption-medium" }
			}
		},
		boxSizes = {
			[statusBadgeSizeModule.XSmall] = { container = { tag = "padding-x-xsmall" } },
			[statusBadgeSizeModule.Small] = { container = { tag = "padding-x-small" } }
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), composeStyleVariantModule (ref), statusBadgeShapeModule (ref)
	local statusBadge = variantsContextModule.useVariants("StatusBadge", variantsFactory, p1)
	
	return composeStyleVariantModule(statusBadge.common, statusBadge.variants[p2], statusBadge.shapes[p3], statusBadge.sizes[p4], if p3 == statusBadgeShapeModule.Box then statusBadge.boxSizes[p4] else nil)
end