local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local chipSizeModule = require(foundation.Enums.ChipSize)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: chipSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = "row align-y-center auto-xy radius-circle clip",
				backgroundStyle = p1.Color.ActionStandard.Background
			},
			thumbUpSegment = {
				tag = "row align-x-center align-y-center shrink-1 auto-x radius-circle"
			},
			thumbDownSegment = {
				tag = "row align-x-center align-y-center auto-x radius-circle"
			},
			text = { contentStyle = p1.Color.ActionStandard.Foreground }
		},
		sizes = {
			[chipSizeModule.Small] = {
				thumbSegment = { tag = "size-0-600" },
				dividerContainer = {
					tag = "align-y-center size-0-600 auto-x padding-y-xsmall"
				},
				thumbUpIcon = { tag = "auto-xy padding-left-small padding-right-xsmall" },
				thumbDownIcon = { tag = "auto-xy padding-left-small padding-right-medium" },
				text = {
					tag = "shrink size-0-full auto-x text-label-small text-truncate-end padding-right-small"
				},
				iconSize = iconSizeModule.XSmall
			},
			[chipSizeModule.Medium] = {
				thumbSegment = { tag = "size-0-800" },
				dividerContainer = { tag = "align-y-center size-0-800 auto-x padding-y-small" },
				thumbUpIcon = { tag = "auto-xy padding-left-medium padding-right-xsmall" },
				thumbDownIcon = { tag = "auto-xy padding-left-medium padding-right-medium" },
				text = {
					tag = "shrink size-0-full auto-x text-label-medium text-truncate-end padding-right-medium"
				},
				iconSize = iconSizeModule.Small
			},
			[chipSizeModule.Large] = {
				thumbSegment = { tag = "size-0-1000" },
				dividerContainer = {
					tag = "align-y-center size-0-1000 auto-x padding-y-small"
				},
				thumbUpIcon = { tag = "auto-xy padding-left-medium padding-right-small" },
				thumbDownIcon = { tag = "auto-xy padding-left-medium padding-right-medium" },
				text = {
					tag = "shrink size-0-full auto-x text-label-medium text-truncate-end padding-right-large"
				},
				iconSize = iconSizeModule.Medium
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local rating = variantsContextModule.useVariants("Rating", variantsFactory, p1)
	local var1 = rating.sizes[p2]
	local var2 = composeStyleVariantModule(rating.common, {
		thumbUpSegment = var1.thumbSegment,
		thumbDownSegment = var1.thumbSegment,
		text = var1.text
	})
	
	return {
		container = var2.container,
		thumbUpSegment = var2.thumbUpSegment,
		thumbDownSegment = var2.thumbDownSegment,
		dividerContainer = var1.dividerContainer,
		thumbUpIcon = var1.thumbUpIcon,
		thumbDownIcon = var1.thumbDownIcon,
		text = {
			tag = var2.text.tag,
			contentStyle = var2.text.contentStyle
		},
		iconSize = var1.iconSize
	}
end