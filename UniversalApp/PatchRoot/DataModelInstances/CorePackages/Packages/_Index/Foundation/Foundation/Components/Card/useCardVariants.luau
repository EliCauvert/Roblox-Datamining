local Foundation = script:FindFirstAncestor("Foundation")
local CardDensityModule = require(Foundation.Enums.CardDensity)
local CardHeaderSizeModule = require(Foundation.Enums.CardHeaderSize)
local CardHeightModule = require(Foundation.Enums.CardHeight)
local CardVariantModule = require(Foundation.Enums.CardVariant)
local IconSizeModule = require(Foundation.Enums.IconSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 38 ]]
	-- upvalues: CardDensityModule (copy), CardHeaderSizeModule (copy), IconSizeModule (copy), CardVariantModule (copy), CardHeightModule (copy)
	local ScaledFontSize = p1.Typography.BodySmall.FontSize * p1.Typography.BodySmall.LineHeight
	local ScaledFontSize1 = p1.Typography.BodyMedium.FontSize * p1.Typography.BodyMedium.LineHeight
	
	return {
		common = {
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
		},
		densities = {
			[CardDensityModule.Compact] = {
				container = { tag = "radius-medium" },
				content = { tag = "padding-medium" },
				actionsPadding = { tag = "padding-medium" },
				mediaEnd = { tag = "radius-right-medium" },
				mediaBottom = { tag = "radius-bottom-medium" }
			},
			[CardDensityModule.Default] = {
				container = { tag = "radius-large" },
				content = { tag = "padding-large" },
				actionsPadding = { tag = "padding-large" },
				mediaEnd = { tag = "radius-right-large" },
				mediaBottom = { tag = "radius-bottom-large" }
			},
			[CardDensityModule.Comfortable] = {
				container = { tag = "radius-large" },
				content = { tag = "padding-xlarge" },
				actionsPadding = { tag = "padding-xlarge" },
				mediaEnd = { tag = "radius-right-large" },
				mediaBottom = { tag = "radius-bottom-large" }
			}
		},
		headerSizes = {
			[CardHeaderSizeModule.XXSmall] = {
				content = { tag = "gap-medium" },
				eyebrow = { tag = "text-body-small" },
				description = { tag = "text-body-small", lineHeight = ScaledFontSize },
				title = { tag = "text-title-medium" },
				titleRow = { tag = "gap-xsmall" },
				icon = { size = IconSizeModule.Medium }
			},
			[CardHeaderSizeModule.XSmall] = {
				content = { tag = "gap-medium" },
				eyebrow = { tag = "text-body-small" },
				description = { tag = "text-body-small", lineHeight = ScaledFontSize },
				title = { tag = "text-title-large" },
				titleRow = { tag = "gap-xsmall" },
				icon = { size = IconSizeModule.Medium }
			},
			[CardHeaderSizeModule.Small] = {
				content = { tag = "gap-medium" },
				eyebrow = { tag = "text-body-medium" },
				description = { tag = "text-body-medium", lineHeight = ScaledFontSize1 },
				title = { tag = "text-heading-small" },
				titleRow = { gap = p1.Size.Size_150 },
				icon = { size = IconSizeModule.Large }
			},
			[CardHeaderSizeModule.Medium] = {
				content = { tag = "gap-large" },
				eyebrow = { tag = "text-body-medium" },
				description = { tag = "text-body-medium", lineHeight = ScaledFontSize1 },
				title = { tag = "text-heading-medium" },
				titleRow = { tag = "gap-small" },
				icon = { size = IconSizeModule.Large }
			},
			[CardHeaderSizeModule.Large] = {
				content = { tag = "gap-large" },
				eyebrow = { tag = "text-body-medium" },
				description = { tag = "text-body-medium", lineHeight = ScaledFontSize1 },
				title = { tag = "text-heading-large" },
				titleRow = { tag = "gap-small" },
				icon = { size = IconSizeModule.Large }
			}
		},
		variants = {
			[CardVariantModule.Standard] = { container = { tag = "stroke-standard stroke-default" } },
			[CardVariantModule.Emphasis] = { container = { tag = "bg-shift-200" } }
		},
		heights = {
			[CardHeightModule.Fit] = {
				container = { tag = "size-full-0 auto-y" },
				body = { tag = "size-full-0 auto-y" }
			},
			[CardHeightModule.Fill] = {
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

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ Line: 174 | Named "useCardVariants" ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Card = VariantsContextModule.useVariants("Card", variantsFactory, p1)
	local Density = Card.densities[p3]
	local ComposeStyleVariantModuleResult = ComposeStyleVariantModule(Card.common, Density, Card.headerSizes[p4], Card.variants[p2], Card.heights[p5], Card.endMedia[p6], Card.singleLine[p7])
	
	if not p8 then
		ComposeStyleVariantModuleResult = ComposeStyleVariantModule(ComposeStyleVariantModuleResult, { actions = Density.actionsPadding })
	end
	ComposeStyleVariantModuleResult.media = if p6 then Density.mediaEnd else Density.mediaBottom
	
	return ComposeStyleVariantModuleResult
end