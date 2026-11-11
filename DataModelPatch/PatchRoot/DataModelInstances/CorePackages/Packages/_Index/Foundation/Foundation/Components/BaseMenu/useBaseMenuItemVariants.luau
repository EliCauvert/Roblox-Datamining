local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function legacyVariants(p1)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy)
	return {
		common = {
			container = { tag = "row flex-x-between align-y-center auto-x" },
			icon = {
				tag = "radius-small content-emphasis",
				style = p1.Color.Content.Emphasis
			},
			text = {
				tag = "fill auto-xy text-align-x-left text-truncate-split content-emphasis"
			},
			title = {
				tag = "fill auto-xy text-align-x-left text-truncate-split content-default"
			},
			check = {
				tag = "content-emphasis",
				style = p1.Color.Content.Emphasis
			},
			slotAlign = { tag = "align-x-center align-y-center" },
			submenuContent = {
				tag = "col auto-xy stroke-standard stroke-default radius-medium"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = "gap-xsmall size-full-600 padding-x-medium radius-small"
				},
				icon = { tag = "size-400", size = IconSizeModule.XSmall },
				text = { tag = "text-body-small" },
				title = { tag = "text-caption-small" },
				check = { tag = "size-300", size = p1.Size.Size_600 },
				chevron = { size = IconSizeModule.Small },
				groupPadding = { size = p1.Padding.XSmall }
			},
			[InputSizeModule.Small] = {
				container = {
					tag = "gap-xsmall size-full-800 padding-x-medium radius-medium"
				},
				icon = { tag = "size-500", size = IconSizeModule.Small },
				text = { tag = "text-body-small" },
				title = { tag = "text-caption-small" },
				check = { tag = "size-400", size = p1.Size.Size_700 },
				chevron = { size = IconSizeModule.Small },
				groupPadding = { size = p1.Padding.Small }
			},
			[InputSizeModule.Medium] = {
				container = {
					tag = "gap-small size-full-1000 padding-x-medium radius-medium"
				},
				icon = { tag = "size-600", size = IconSizeModule.Medium },
				text = { tag = "text-body-medium" },
				title = { tag = "text-caption-medium" },
				check = { tag = "size-500", size = p1.Size.Size_800 },
				chevron = { size = IconSizeModule.Medium },
				groupPadding = { size = p1.Padding.Small }
			},
			[InputSizeModule.Large] = {
				container = {
					tag = "gap-small size-full-1200 padding-x-large radius-medium"
				},
				icon = { tag = "size-700", size = IconSizeModule.Large },
				text = { tag = "text-body-large" },
				title = { tag = "text-caption-large" },
				check = { tag = "size-600", size = p1.Size.Size_900 },
				chevron = { size = IconSizeModule.Large },
				groupPadding = { size = p1.Padding.Small }
			}
		},
		isChecked = {
			[false] = { container = { tag = "" } },
			[true] = { container = { tag = "bg-surface-200" } }
		},
		defaultSize = { container = { tag = "auto-x" } }
	}
end

local function refreshVariants(p1)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy)
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
			submenuContent = {
				tag = "col auto-xy stroke-standard stroke-default radius-medium"
			}
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				container = {
					tag = "size-full-600 radius-small",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Padding.Small,
					paddingRight = p1.Padding.Small
				},
				wrapper = { gap = p1.Size.Size_150 },
				icon = { tag = "size-400", size = IconSizeModule.XSmall },
				text = { tag = "text-body-small" },
				title = {
					tag = "text-caption-small",
					checkColumnWidth = p1.Size.Size_500
				},
				check = { tag = "size-500-400", size = p1.Size.Size_400 },
				chevron = { size = IconSizeModule.Small },
				groupPadding = { size = p1.Padding.XSmall }
			},
			[InputSizeModule.Small] = {
				container = {
					tag = "size-full-800 radius-small",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Padding.Small,
					paddingRight = p1.Padding.Small
				},
				wrapper = { gap = p1.Size.Size_150 },
				icon = { tag = "size-500", size = IconSizeModule.Small },
				text = { tag = "text-body-small" },
				title = {
					tag = "text-caption-small",
					checkColumnWidth = p1.Size.Size_600
				},
				check = { tag = "size-600-400", size = p1.Size.Size_400 },
				chevron = { size = IconSizeModule.Small },
				groupPadding = { size = p1.Padding.Small }
			},
			[InputSizeModule.Medium] = {
				container = {
					tag = "size-full-1000 radius-medium",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Size.Size_250,
					paddingRight = p1.Size.Size_250
				},
				wrapper = { gap = p1.Size.Size_150 },
				icon = { tag = "size-500", size = IconSizeModule.Medium },
				text = { tag = "text-body-medium" },
				title = {
					tag = "text-caption-medium",
					checkColumnWidth = p1.Size.Size_700
				},
				check = { tag = "size-700-500", size = p1.Size.Size_500 },
				chevron = { size = IconSizeModule.Medium },
				groupPadding = { size = p1.Padding.Small }
			},
			[InputSizeModule.Large] = {
				container = {
					tag = "size-full-1200 radius-medium",
					paddingLeftWithCheck = 0,
					paddingLeftWithoutCheck = p1.Size.Size_350,
					paddingRight = p1.Size.Size_350
				},
				wrapper = { gap = p1.Padding.Small },
				icon = { tag = "size-600", size = IconSizeModule.Large },
				text = { tag = "text-body-large" },
				title = {
					tag = "text-caption-large",
					checkColumnWidth = p1.Size.Size_800
				},
				check = { tag = "size-800-600", size = p1.Size.Size_600 },
				chevron = { size = IconSizeModule.Large },
				groupPadding = { size = p1.Padding.Small }
			}
		},
		isChecked = {
			[false] = { container = { tag = "" } },
			[true] = { container = { tag = "" } }
		},
		defaultSize = { container = { tag = "auto-x" } }
	}
end

local function variantsMap(p1)
	-- upvalues: FlagsModule (copy), refreshVariants (copy), legacyVariants (copy)
	return if FlagsModule.FoundationBaseMenuBeta then refreshVariants(p1) else legacyVariants(p1)
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsMap (copy), FlagsModule (copy), ComposeStyleVariantModule (copy)
	local BaseMenuItem = VariantsContextModule.useVariants("BaseMenuItem", variantsMap, p1)
	
	return if FlagsModule.FoundationBaseMenuBeta then ComposeStyleVariantModule(BaseMenuItem.common, BaseMenuItem.sizes[p2], BaseMenuItem.defaultSize) else ComposeStyleVariantModule(BaseMenuItem.common, BaseMenuItem.sizes[p2], BaseMenuItem.isChecked[p3])
end