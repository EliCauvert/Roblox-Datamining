local foundation = script:FindFirstAncestor("Foundation")
local flagsModule = require(foundation.Utility.Flags)
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(_) --[[ line: 26 ]]
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref), flagsModule (ref)
	return {
		common = {
			title = {
				tag = "auto-xy text-wrap text-align-x-left content-emphasis"
			},
			metadata = { tag = "auto-xy text-align-x-left text-truncate-split" },
			description = { tag = "auto-xy text-wrap text-align-x-left" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				title = { tag = "text-title-small" },
				metadata = { tag = "text-body-small" },
				description = { tag = "text-body-small" },
				icon = { size = iconSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				title = {
					tag = if flagsModule.FoundationListItemTypographySpacing then "text-title-medium" else "text-title-small"
				},
				metadata = { tag = "text-body-small" },
				description = { tag = "text-body-small" },
				icon = { size = iconSizeModule.Small }
			},
			[inputSizeModule.Medium] = {
				title = { tag = "text-title-medium" },
				metadata = { tag = "text-body-medium" },
				description = { tag = "text-body-medium" },
				icon = { size = iconSizeModule.Medium }
			},
			[inputSizeModule.Large] = {
				title = { tag = "text-title-large" },
				metadata = { tag = "text-body-medium" },
				description = { tag = "text-body-medium" },
				icon = { size = iconSizeModule.Large }
			}
		}
	}
end

return function(p0, p1) --[[ line: 68 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local listItem = variantsContextModule.useVariants("ListItem", variantsFactory, p0)
	
	return composeStyleVariantModule(listItem.common, listItem.sizes[p1])
end