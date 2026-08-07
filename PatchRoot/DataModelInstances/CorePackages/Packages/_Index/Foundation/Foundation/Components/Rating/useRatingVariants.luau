-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local chipSizeModule = require(foundation.Enums.ChipSize)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 40 ]]
	-- upvalues: chipSizeModule (ref), iconSizeModule (ref)
	return {
		common = {
			container = {
				tag = "row align-y-center auto-xy radius-circle clip",
				backgroundStyle = p0.Color.ActionStandard.Background
			},
			thumbUpSegment = {
				tag = "row align-x-center align-y-center shrink-1 auto-x radius-circle"
			},
			thumbDownSegment = {
				tag = "row align-x-center align-y-center auto-x radius-circle"
			},
			text = { contentStyle = p0.Color.ActionStandard.Foreground }
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

return function(p1, p2) --[[ line: 90 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local rating = variantsContextModule.useVariants("Rating", variantsFactory, p1)
	local var7 = rating.sizes[p2]
	local var8 = composeStyleVariantModule(rating.common, {
		thumbUpSegment = var7.thumbSegment,
		thumbDownSegment = var7.thumbSegment,
		text = var7.text
	})
	
	return {
		container = var8.container,
		thumbUpSegment = var8.thumbUpSegment,
		thumbDownSegment = var8.thumbDownSegment,
		dividerContainer = var7.dividerContainer,
		thumbUpIcon = var7.thumbUpIcon,
		thumbDownIcon = var7.thumbDownIcon,
		text = {
			tag = var8.text.tag,
			contentStyle = var8.text.contentStyle
		},
		iconSize = var7.iconSize
	}
end