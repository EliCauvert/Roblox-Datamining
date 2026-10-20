local Foundation = script:FindFirstAncestor("Foundation")
local BannerContextPresentationModule = require(Foundation.Enums.BannerContextPresentation)
local BannerContextVariantModule = require(Foundation.Enums.BannerContextVariant)
local IconSizeModule = require(Foundation.Enums.IconSize)
local _ = require(Foundation.Components.InternalNotice)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function _(p1, p2)
	return {
		top = UDim.new(0, (math.round((p1.Size.Size_600 - p2) / 2)))
	}
end

local function affixedContentPadding(p1, Offset)
	return {
		top = UDim.new(0, Offset),
		right = UDim.new(0, p1.Margin.Medium),
		bottom = UDim.new(0, Offset),
		left = UDim.new(0, p1.Margin.Medium)
	}
end

local function variantsFactory(p1)
	-- upvalues: BannerContextPresentationModule (copy), IconSizeModule (copy), BannerContextVariantModule (copy), affixedContentPadding (copy)
	local Padding = {
		top = UDim.new(0, (math.round((p1.Size.Size_600 - p1.Typography.BodySmall.FontSize) / 2)))
	}
	local Padding1 = {
		top = UDim.new(0, (math.round((p1.Size.Size_600 - p1.Typography.BodyMedium.FontSize) / 2)))
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
			[BannerContextPresentationModule.Inline] = {
				container = { tag = "radius-medium" },
				content = { tag = "padding-medium" },
				leading = { gap = "gap-small" },
				icon = { size = IconSizeModule.Small },
				message = { tag = "text-body-small", padding = Padding },
				link = { tag = "text-body-small", padding = Padding }
			},
			[BannerContextPresentationModule.Affixed] = {
				leading = { gap = "gap-medium" },
				icon = { size = IconSizeModule.Medium },
				message = { tag = "text-body-medium", padding = Padding1 },
				link = { tag = "text-body-medium", padding = Padding1 }
			}
		},
		variants = {
			[BannerContextVariantModule.Standard] = {},
			[BannerContextVariantModule.Emphasis] = { container = { tag = "bg-shift-200" } }
		},
		presentationVariants = {
			[BannerContextPresentationModule.Inline] = {
				[BannerContextVariantModule.Standard] = { container = { tag = "stroke-standard stroke-default" } },
				[BannerContextVariantModule.Emphasis] = {}
			},
			[BannerContextPresentationModule.Affixed] = {
				[BannerContextVariantModule.Standard] = {
					content = {
						padding = affixedContentPadding(p1, p1.Padding.Large - p1.Stroke.Standard)
					},
					border = {
						Size = UDim2.new(1, 0, 0, p1.Stroke.Standard),
						backgroundStyle = p1.Color.Stroke.Default
					}
				},
				[BannerContextVariantModule.Emphasis] = {
					content = { padding = affixedContentPadding(p1, p1.Padding.Large) }
				}
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local BannerContext = VariantsContextModule.useVariants("BannerContext", variantsFactory, p1)
	
	return ComposeStyleVariantModule(BannerContext.common, BannerContext.presentations[p2], BannerContext.variants[p3], BannerContext.presentationVariants[p2][p3])
end