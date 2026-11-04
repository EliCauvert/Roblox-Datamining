local Foundation = script:FindFirstAncestor("Foundation")
local AvatarIconSizeModule = require(Foundation.Enums.AvatarIconSize)
local IconSizeModule = require(Foundation.Enums.IconSize)
local MetadataSizeModule = require(Foundation.Enums.MetadataSize)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Providers.Style.Tokens)

local function variantsFactory(p1)
	-- upvalues: IconSizeModule (copy), AvatarIconSizeModule (copy), MetadataSizeModule (copy)
	return {
		common = {
			container = { tag = "row align-y-center auto-xy" },
			item = { tag = "row align-y-center gap-xsmall auto-xy" },
			truncatedItem = { tag = "row align-y-center shrink gap-xsmall auto-xy" },
			text = {
				tag = "auto-xy content-default",
				openTypeFeatures = "zero, ss03"
			},
			truncatedText = {
				tag = "shrink auto-xy text-truncate-split content-default"
			},
			wrappedText = {
				tag = "shrink auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split content-default"
			},
			accessory = {
				avatarTag = "auto-xy padding-right-xxsmall",
				iconSize = IconSizeModule.Small,
				avatarSize = AvatarIconSizeModule.Small,
				style = p1.Color.Content.Default
			}
		},
		sizes = {
			[MetadataSizeModule.Medium] = {
				text = {
					tag = "text-body-medium",
					fontStyle = p1.Typography.BodyMedium
				},
				truncatedText = { tag = "text-body-medium" },
				wrappedText = { tag = "text-body-medium" }
			},
			[MetadataSizeModule.Small] = {
				text = {
					tag = "text-body-small",
					fontStyle = p1.Typography.BodySmall
				},
				truncatedText = { tag = "text-body-small" },
				wrappedText = { tag = "text-body-small" }
			}
		},
		spacing = {
			[true] = { container = { tag = "gap-small" } },
			[false] = { container = { tag = "gap-xsmall" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Metadata = VariantsContextModule.useVariants("Metadata", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Metadata.common, Metadata.sizes[p2], Metadata.spacing[p3])
end