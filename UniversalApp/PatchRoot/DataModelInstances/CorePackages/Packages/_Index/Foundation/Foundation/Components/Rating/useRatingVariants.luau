local Foundation = script:FindFirstAncestor("Foundation")
local IconSizeModule = require(Foundation.Enums.IconSize)
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 40 ]]
	-- upvalues: ChipSizeModule (copy), IconSizeModule (copy)
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
			[ChipSizeModule.Small] = {
				thumbSegment = { tag = "size-0-600" },
				dividerContainer = {
					tag = "align-y-center size-0-600 auto-x padding-y-xsmall"
				},
				thumbUpIcon = { tag = "auto-xy padding-left-small padding-right-xsmall" },
				thumbDownIcon = { tag = "auto-xy padding-left-small padding-right-medium" },
				text = {
					tag = "shrink size-0-full auto-x text-label-small text-truncate-end padding-right-small"
				},
				iconSize = IconSizeModule.XSmall
			},
			[ChipSizeModule.Medium] = {
				thumbSegment = { tag = "size-0-800" },
				dividerContainer = { tag = "align-y-center size-0-800 auto-x padding-y-small" },
				thumbUpIcon = { tag = "auto-xy padding-left-medium padding-right-xsmall" },
				thumbDownIcon = { tag = "auto-xy padding-left-medium padding-right-medium" },
				text = {
					tag = "shrink size-0-full auto-x text-label-medium text-truncate-end padding-right-medium"
				},
				iconSize = IconSizeModule.Small
			},
			[ChipSizeModule.Large] = {
				thumbSegment = { tag = "size-0-1000" },
				dividerContainer = {
					tag = "align-y-center size-0-1000 auto-x padding-y-small"
				},
				thumbUpIcon = { tag = "auto-xy padding-left-medium padding-right-small" },
				thumbDownIcon = { tag = "auto-xy padding-left-medium padding-right-medium" },
				text = {
					tag = "shrink size-0-full auto-x text-label-medium text-truncate-end padding-right-large"
				},
				iconSize = IconSizeModule.Medium
			}
		}
	}
end

return function(p1, p2) --[[ Line: 90 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Rating = VariantsContextModule.useVariants("Rating", variantsFactory, p1)
	local Size = Rating.sizes[p2]
	local ComposeStyleVariantModuleResult = ComposeStyleVariantModule(Rating.common, {
		thumbUpSegment = Size.thumbSegment,
		thumbDownSegment = Size.thumbSegment,
		text = Size.text
	})
	
	return {
		container = ComposeStyleVariantModuleResult.container,
		thumbUpSegment = ComposeStyleVariantModuleResult.thumbUpSegment,
		thumbDownSegment = ComposeStyleVariantModuleResult.thumbDownSegment,
		dividerContainer = Size.dividerContainer,
		thumbUpIcon = Size.thumbUpIcon,
		thumbDownIcon = Size.thumbDownIcon,
		text = {
			tag = ComposeStyleVariantModuleResult.text.tag,
			contentStyle = ComposeStyleVariantModuleResult.text.contentStyle
		},
		iconSize = Size.iconSize
	}
end