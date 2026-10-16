local Foundation = script:FindFirstAncestor("Foundation")
local InputSizeModule = require(Foundation.Enums.InputSize)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function variantsMap(p1) --[[ Line: 38 ]]
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
			submenuContent = { tag = "stroke-standard stroke-default radius-medium" }
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
		isScrollable = {
			[false] = { submenuContent = { tag = "col auto-xy" } },
			[true] = { submenuContent = { tag = "" } }
		},
		defaultSize = { container = { tag = "auto-x" } }
	}
end

return function(p1, p2, p3) --[[ Line: 134 ]]
	-- upvalues: VariantsContextModule (copy), variantsMap (copy), ComposeStyleVariantModule (copy)
	local BaseMenuItem = VariantsContextModule.useVariants("BaseMenuItem", variantsMap, p1)
	
	return ComposeStyleVariantModule(BaseMenuItem.common, BaseMenuItem.sizes[p2], BaseMenuItem.defaultSize, BaseMenuItem.isScrollable[p3])
end