local foundation = script:FindFirstAncestor("Foundation")
local cardDensityModule = require(foundation.Enums.CardDensity)
local cardHeaderSizeModule = require(foundation.Enums.CardHeaderSize)
local cardHeightModule = require(foundation.Enums.CardHeight)
local cardVariantModule = require(foundation.Enums.CardVariant)
local iconSizeModule = require(foundation.Enums.IconSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: cardDensityModule (ref), cardHeaderSizeModule (ref), iconSizeModule (ref), cardVariantModule (ref), cardHeightModule (ref)
	local t = {
		container = { tag = "clip" },
		content = { tag = "col auto-y" },
		children = { tag = "col gap-large size-full-0 auto-y" },
		header = { tag = "row gap-small size-full-0 auto-y" },
		headerText = { tag = "col fill auto-y" },
		eyebrow = {
			tag = "size-full-0 auto-y text-wrap text-align-x-left content-default"
		},
		titleRow = {
			tag = "row align-y-center size-full-0 auto-y padding-y-xxsmall"
		},
		title = {
			tag = "shrink auto-xy text-wrap text-align-x-left content-emphasis"
		},
		description = {
			tag = "size-full-0 auto-y padding-bottom-xxsmall text-wrap text-align-x-left content-default"
		},
		actions = { tag = "row gap-small auto-xy" }
	}
	local t_1 = {
		[cardDensityModule.Compact] = {
			container = { tag = "radius-medium" },
			content = { tag = "padding-medium" },
			actionsPadding = { tag = "padding-medium" },
			mediaEnd = { tag = "radius-right-medium" },
			mediaBottom = { tag = "radius-bottom-medium" }
		},
		[cardDensityModule.Default] = {
			container = { tag = "radius-large" },
			content = { tag = "padding-large" },
			actionsPadding = { tag = "padding-large" },
			mediaEnd = { tag = "radius-right-large" },
			mediaBottom = { tag = "radius-bottom-large" }
		},
		[cardDensityModule.Comfortable] = {
			container = { tag = "radius-large" },
			content = { tag = "padding-xlarge" },
			actionsPadding = { tag = "padding-xlarge" },
			mediaEnd = { tag = "radius-right-large" },
			mediaBottom = { tag = "radius-bottom-large" }
		}
	}
	local var1 = p1.Typography.BodySmall.FontSize * p1.Typography.BodySmall.LineHeight
	local var2 = p1.Typography.BodyMedium.FontSize * p1.Typography.BodyMedium.LineHeight
	
	return {
		common = t,
		densities = t_1,
		headerSizes = {
			[cardHeaderSizeModule.XXSmall] = {
				content = { tag = "gap-medium" },
				eyebrow = { tag = "text-body-small" },
				description = { tag = "text-body-small", lineHeight = var1 },
				title = { tag = "text-title-medium" },
				titleRow = { tag = "gap-xsmall" },
				icon = { size = iconSizeModule.Medium }
			},
			[cardHeaderSizeModule.XSmall] = {
				content = { tag = "gap-medium" },
				eyebrow = { tag = "text-body-small" },
				description = { tag = "text-body-small", lineHeight = var1 },
				title = { tag = "text-title-large" },
				titleRow = { tag = "gap-xsmall" },
				icon = { size = iconSizeModule.Medium }
			},
			[cardHeaderSizeModule.Small] = {
				content = { tag = "gap-medium" },
				eyebrow = { tag = "text-body-medium" },
				description = { tag = "text-body-medium", lineHeight = var2 },
				title = { tag = "text-heading-small" },
				titleRow = { gap = p1.Size.Size_150 },
				icon = { size = iconSizeModule.Large }
			},
			[cardHeaderSizeModule.Medium] = {
				content = { tag = "gap-large" },
				eyebrow = { tag = "text-body-medium" },
				description = { tag = "text-body-medium", lineHeight = var2 },
				title = { tag = "text-heading-medium" },
				titleRow = { tag = "gap-small" },
				icon = { size = iconSizeModule.Large }
			},
			[cardHeaderSizeModule.Large] = {
				content = { tag = "gap-large" },
				eyebrow = { tag = "text-body-medium" },
				description = { tag = "text-body-medium", lineHeight = var2 },
				title = { tag = "text-heading-large" },
				titleRow = { tag = "gap-small" },
				icon = { size = iconSizeModule.Large }
			}
		},
		variants = {
			[cardVariantModule.Standard] = { container = { tag = "stroke-standard stroke-default" } },
			[cardVariantModule.Emphasis] = { container = { tag = "bg-shift-200" } }
		},
		heights = {
			[cardHeightModule.Fit] = {
				container = { tag = "size-full-0 auto-y" },
				body = { tag = "size-full-0 auto-y" }
			},
			[cardHeightModule.Fill] = {
				container = { tag = "fill self-stretch size-full-0" },
				body = { tag = "size-full" }
			}
		},
		endMedia = {
			[true] = { body = { tag = "row" }, content = { tag = "fill" } },
			[false] = {
				body = { tag = "col" },
				content = { tag = "size-full-0" }
			}
		},
		singleLine = {
			[true] = { header = { tag = "align-y-center" } },
			[false] = { header = { tag = "align-y-top" } }
		}
	}
end

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local card = variantsContextModule.useVariants("Card", variantsFactory, p1)
	local var1 = card.densities[p3]
	local var2 = composeStyleVariantModule(card.common, var1, card.headerSizes[p4], card.variants[p2], card.heights[p5], card.endMedia[p6], card.singleLine[p7])
	
	if not p8 then
		var2 = composeStyleVariantModule(var2, { actions = var1.actionsPadding })
	end
	var2.media = if p6 then var1.mediaEnd else var1.mediaBottom
	
	return var2
end