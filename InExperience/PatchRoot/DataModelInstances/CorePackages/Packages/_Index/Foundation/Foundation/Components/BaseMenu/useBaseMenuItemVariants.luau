local foundation = script:FindFirstAncestor("Foundation")
local inputSizeModule = require(foundation.Enums.InputSize)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)
local iconSizeModule = require(foundation.Enums.IconSize)

local function legacyVariants(p0) --[[ line: 42 ]]
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = { tag = "row flex-x-between align-y-center auto-x" },
			icon = {
				tag = "radius-small content-emphasis",
				style = p0.Color.Content.Emphasis
			},
			text = {
				tag = "fill auto-xy text-align-x-left text-truncate-split content-emphasis"
			},
			title = {
				tag = "fill auto-xy text-align-x-left text-truncate-split content-default"
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
					tag = "gap-xsmall size-full-600 padding-x-medium radius-small"
				},
				icon = { tag = "size-400", size = iconSizeModule.XSmall },
				text = { tag = "text-body-small" },
				title = { tag = "text-caption-small" },
				check = { tag = "size-300", size = p0.Size.Size_600 },
				chevron = { size = iconSizeModule.Small },
				groupPadding = { size = p0.Padding.XSmall }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = "gap-xsmall size-full-800 padding-x-medium radius-medium"
				},
				icon = { tag = "size-500", size = iconSizeModule.Small },
				text = { tag = "text-body-small" },
				title = { tag = "text-caption-small" },
				check = { tag = "size-400", size = p0.Size.Size_700 },
				chevron = { size = iconSizeModule.Small },
				groupPadding = { size = p0.Padding.Small }
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = "gap-small size-full-1000 padding-x-medium radius-medium"
				},
				icon = { tag = "size-600", size = iconSizeModule.Medium },
				text = { tag = "text-body-medium" },
				title = { tag = "text-caption-medium" },
				check = { tag = "size-500", size = p0.Size.Size_800 },
				chevron = { size = iconSizeModule.Medium },
				groupPadding = { size = p0.Padding.Small }
			},
			[inputSizeModule.Large] = {
				container = {
					tag = "gap-small size-full-1200 padding-x-large radius-medium"
				},
				icon = { tag = "size-700", size = iconSizeModule.Large },
				text = { tag = "text-body-large" },
				title = { tag = "text-caption-large" },
				check = { tag = "size-600", size = p0.Size.Size_900 },
				chevron = { size = iconSizeModule.Large },
				groupPadding = { size = p0.Padding.Small }
			}
		},
		isChecked = {
			[false] = { container = { tag = "" } },
			[true] = { container = { tag = "bg-surface-200" } }
		},
		isScrollable = {
			[false] = { submenuContent = { tag = "col auto-xy" } },
			[true] = { submenuContent = { tag = "" } }
		},
		defaultSize = { container = { tag = "auto-x" } }
	}
end

local function refreshVariants(p1) --[[ line: 125 ]]
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = { tag = "" },
			icon = {
				tag = "radius-small content-emphasis",
				style = p1.Color.Content.Emphasis
			},
			text = {
				tag = "fill auto-xy text-align-x-left text-truncate-end content-emphasis"
			},
			title = {
				tag = "fill auto-xy text-align-x-left text-truncate-end content-default"
			},
			check = {
				tag = "content-emphasis",
				style = p1.Color.Content.Emphasis
			},
			slotAlign = { tag = "align-x-center align-y-center" },
			submenuContent = { tag = "stroke-standard stroke-default radius-medium" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				container = {
					tag = "size-full-600 radius-small",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Padding.Small,
					paddingRight = p1.Padding.Small
				},
				wrapper = { gap = p1.Size.Size_150 },
				icon = { tag = "size-400", size = iconSizeModule.XSmall },
				text = { tag = "text-body-small" },
				title = {
					tag = "text-caption-small",
					checkColumnWidth = p1.Size.Size_500
				},
				check = { tag = "size-500-400", size = p1.Size.Size_400 },
				chevron = { size = iconSizeModule.Small },
				groupPadding = { size = p1.Padding.XSmall }
			},
			[inputSizeModule.Small] = {
				container = {
					tag = "size-full-800 radius-small",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Padding.Small,
					paddingRight = p1.Padding.Small
				},
				wrapper = { gap = p1.Size.Size_150 },
				icon = { tag = "size-500", size = iconSizeModule.Small },
				text = { tag = "text-body-small" },
				title = {
					tag = "text-caption-small",
					checkColumnWidth = p1.Size.Size_600
				},
				check = { tag = "size-600-400", size = p1.Size.Size_400 },
				chevron = { size = iconSizeModule.Small },
				groupPadding = { size = p1.Padding.Small }
			},
			[inputSizeModule.Medium] = {
				container = {
					tag = "size-full-1000 radius-medium",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Size.Size_250,
					paddingRight = p1.Size.Size_250
				},
				wrapper = { gap = p1.Size.Size_150 },
				icon = { tag = "size-500", size = iconSizeModule.Medium },
				text = { tag = "text-body-medium" },
				title = {
					tag = "text-caption-medium",
					checkColumnWidth = p1.Size.Size_700
				},
				check = { tag = "size-700-500", size = p1.Size.Size_500 },
				chevron = { size = iconSizeModule.Medium },
				groupPadding = { size = p1.Padding.Small }
			},
			[inputSizeModule.Large] = {
				container = {
					tag = "size-full-1200 radius-medium",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Size.Size_350,
					paddingRight = p1.Size.Size_350
				},
				wrapper = { gap = p1.Padding.Small },
				icon = { tag = "size-600", size = iconSizeModule.Large },
				text = { tag = "text-body-large" },
				title = {
					tag = "text-caption-large",
					checkColumnWidth = p1.Size.Size_800
				},
				check = { tag = "size-800-600", size = p1.Size.Size_600 },
				chevron = { size = iconSizeModule.Large },
				groupPadding = { size = p1.Padding.Small }
			}
		},
		isChecked = {
			[false] = { container = { tag = "" } },
			[true] = { container = { tag = "" } }
		},
		isScrollable = {
			[false] = { submenuContent = { tag = "col auto-xy" } },
			[true] = { submenuContent = { tag = "" } }
		},
		defaultSize = { container = { tag = "auto-x" } }
	}
end

local function variantsMap(p2) --[[ line: 233 ]]
	-- upvalues: flagsModule (ref), refreshVariants (ref), legacyVariants (ref)
	return if flagsModule.FoundationBaseMenuBeta then refreshVariants(p2) else legacyVariants(p2)
end

return function(p3, p4, p5, p6) --[[ line: 243 ]]
	-- upvalues: variantsContextModule (ref), variantsMap (ref), flagsModule (ref), composeStyleVariantModule (ref)
	local baseMenuItem = variantsContextModule.useVariants("BaseMenuItem", variantsMap, p3)
	
	return if flagsModule.FoundationBaseMenuBeta then composeStyleVariantModule(baseMenuItem.common, baseMenuItem.sizes[p4], baseMenuItem.defaultSize, baseMenuItem.isScrollable[p6]) else composeStyleVariantModule(baseMenuItem.common, baseMenuItem.sizes[p4], baseMenuItem.isChecked[p5], baseMenuItem.isScrollable[p6])
end