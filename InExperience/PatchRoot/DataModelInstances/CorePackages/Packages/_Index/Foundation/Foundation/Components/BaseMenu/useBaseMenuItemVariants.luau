local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local iconSizeModule = require(foundation.Enums.IconSize)

local function variantsMap(p0)
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = { tag = "" },
			icon = {
				tag = "radius-small content-emphasis",
				style = p0.Color.Content.Emphasis
			},
			text = {
				tag = "fill auto-xy text-align-x-left text-truncate-end content-emphasis"
			},
			title = {
				tag = "fill auto-xy text-align-x-left text-truncate-end content-default"
			},
			check = {
				tag = "content-emphasis",
				style = p0.Color.Content.Emphasis
			},
			slotAlign = { tag = "align-x-center align-y-center" },
			submenuContent = { tag = "stroke-standard stroke-default radius-medium" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = "size-full-600 radius-small",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p0.Padding.Small,
					paddingRight = p0.Padding.Small
				},
				wrapper = { gap = p0.Size.Size_150 },
				icon = { tag = "size-400", size = iconSizeModule.XSmall },
				text = { tag = "text-body-small" },
				title = {
					tag = "text-caption-small",
					checkColumnWidth = p0.Size.Size_500
				},
				check = { tag = "size-500-400", size = p0.Size.Size_400 },
				chevron = { size = iconSizeModule.Small },
				groupPadding = { size = p0.Padding.XSmall }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = "size-full-800 radius-small",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p0.Padding.Small,
					paddingRight = p0.Padding.Small
				},
				wrapper = { gap = p0.Size.Size_150 },
				icon = { tag = "size-500", size = iconSizeModule.Small },
				text = { tag = "text-body-small" },
				title = {
					tag = "text-caption-small",
					checkColumnWidth = p0.Size.Size_600
				},
				check = { tag = "size-600-400", size = p0.Size.Size_400 },
				chevron = { size = iconSizeModule.Small },
				groupPadding = { size = p0.Padding.Small }
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = "size-full-1000 radius-medium",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p0.Size.Size_250,
					paddingRight = p0.Size.Size_250
				},
				wrapper = { gap = p0.Size.Size_150 },
				icon = { tag = "size-500", size = iconSizeModule.Medium },
				text = { tag = "text-body-medium" },
				title = {
					tag = "text-caption-medium",
					checkColumnWidth = p0.Size.Size_700
				},
				check = { tag = "size-700-500", size = p0.Size.Size_500 },
				chevron = { size = iconSizeModule.Medium },
				groupPadding = { size = p0.Padding.Small }
			},
			[inputSizeModule.Large] = {
				container = {
					tag = "size-full-1200 radius-medium",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p0.Size.Size_350,
					paddingRight = p0.Size.Size_350
				},
				wrapper = { gap = p0.Padding.Small },
				icon = { tag = "size-600", size = iconSizeModule.Large },
				text = { tag = "text-body-large" },
				title = {
					tag = "text-caption-large",
					checkColumnWidth = p0.Size.Size_800
				},
				check = { tag = "size-800-600", size = p0.Size.Size_600 },
				chevron = { size = iconSizeModule.Large },
				groupPadding = { size = p0.Padding.Small }
			}
		},
		isScrollable = {
			[false] = { submenuContent = { tag = "col auto-xy" } },
			[true] = { submenuContent = { tag = "" } }
		},
		defaultSize = { container = { tag = "auto-x" } }
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsMap (ref), composeStyleVariantModule (ref)
	local baseMenuItem = variantsContextModule.useVariants("BaseMenuItem", variantsMap, p1)
	
	return composeStyleVariantModule(baseMenuItem.common, baseMenuItem.sizes[p2], baseMenuItem.defaultSize, baseMenuItem.isScrollable[p3])
end