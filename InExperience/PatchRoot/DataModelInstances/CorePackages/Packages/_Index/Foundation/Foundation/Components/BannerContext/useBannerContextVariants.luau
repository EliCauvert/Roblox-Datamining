local foundation = script:FindFirstAncestor("Foundation")
local bannerContextPresentationModule = require(foundation.Enums.BannerContextPresentation)
local bannerContextVariantModule = require(foundation.Enums.BannerContextVariant)
local iconSizeModule = require(foundation.Enums.IconSize)
local _ = require(foundation.Components.InternalNotice)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function _(p1, p2)
	return {
		top = UDim.new(0, math.round((p1.Size.Size_600 - p2) / 2))
	}
end

local function affixedContentPadding(p1, p2)
	return {
		top = UDim.new(0, p2),
		right = UDim.new(0, p1.Margin.Medium),
		bottom = UDim.new(0, p2),
		left = UDim.new(0, p1.Margin.Medium)
	}
end

local function variantsFactory(p1)
	-- upvalues: bannerContextPresentationModule (ref), iconSizeModule (ref), bannerContextVariantModule (ref), affixedContentPadding (ref)
	local t = {
		top = UDim.new(0, math.round((p1.Size.Size_600 - p1.Typography.BodySmall.FontSize) / 2))
	}
	local t_1 = {
		top = UDim.new(0, math.round((p1.Size.Size_600 - p1.Typography.BodyMedium.FontSize) / 2))
	}
	
	return {
		common = {
			content = { gap = "gap-large" },
			stack = { gap = "gap-xxsmall" },
			icon = { style = p1.Color.Content.Emphasis },
			message = { tag = "content-emphasis" },
			link = { tag = "content-emphasis" }
		},
		presentations = {
			[bannerContextPresentationModule.Inline] = {
				container = { tag = "radius-medium" },
				content = { tag = "padding-medium" },
				leading = { gap = "gap-small" },
				icon = { size = iconSizeModule.Small },
				message = { tag = "text-body-small", padding = t },
				link = { tag = "text-body-small", padding = t }
			},
			[bannerContextPresentationModule.Affixed] = {
				leading = { gap = "gap-medium" },
				icon = { size = iconSizeModule.Medium },
				message = { tag = "text-body-medium", padding = t_1 },
				link = { tag = "text-body-medium", padding = t_1 }
			}
		},
		variants = {
			[bannerContextVariantModule.Standard] = {},
			[bannerContextVariantModule.Emphasis] = { container = { tag = "bg-shift-200" } }
		},
		presentationVariants = {
			[bannerContextPresentationModule.Inline] = {
				[bannerContextVariantModule.Standard] = { container = { tag = "stroke-standard stroke-default" } },
				[bannerContextVariantModule.Emphasis] = {}
			},
			[bannerContextPresentationModule.Affixed] = {
				[bannerContextVariantModule.Standard] = {
					content = {
						padding = affixedContentPadding(p1, p1.Padding.Large - p1.Stroke.Standard)
					},
					border = {
						Size = UDim2.new(1, 0, 0, p1.Stroke.Standard),
						backgroundStyle = p1.Color.Stroke.Default
					}
				},
				[bannerContextVariantModule.Emphasis] = {
					content = { padding = affixedContentPadding(p1, p1.Padding.Large) }
				}
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local bannerContext = variantsContextModule.useVariants("BannerContext", variantsFactory, p1)
	
	return composeStyleVariantModule(bannerContext.common, bannerContext.presentations[p2], bannerContext.variants[p3], bannerContext.presentationVariants[p2][p3])
end