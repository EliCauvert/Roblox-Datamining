local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(_)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy), FlagsModule (copy)
	return {
		common = {
			title = {
				tag = "auto-xy text-wrap text-align-x-left content-emphasis"
			},
			metadata = { tag = "auto-xy text-align-x-left text-truncate-split" },
			description = { tag = "auto-xy text-wrap text-align-x-left" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				title = { tag = "text-title-small" },
				metadata = { tag = "text-body-small" },
				description = { tag = "text-body-small" },
				icon = { size = IconSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				title = {
					tag = if FlagsModule.FoundationListItemTypographySpacing then "text-title-medium" else "text-title-small"
				},
				metadata = { tag = "text-body-small" },
				description = { tag = "text-body-small" },
				icon = { size = IconSizeModule.Small }
			},
			[InputSizeModule.Medium] = {
				title = { tag = "text-title-medium" },
				metadata = { tag = "text-body-medium" },
				description = { tag = "text-body-medium" },
				icon = { size = IconSizeModule.Medium }
			},
			[InputSizeModule.Large] = {
				title = { tag = "text-title-large" },
				metadata = { tag = "text-body-medium" },
				description = { tag = "text-body-medium" },
				icon = { size = IconSizeModule.Large }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local ListItem = VariantsContextModule.useVariants("ListItem", variantsFactory, p1)
	
	return ComposeStyleVariantModule(ListItem.common, ListItem.sizes[p2])
end