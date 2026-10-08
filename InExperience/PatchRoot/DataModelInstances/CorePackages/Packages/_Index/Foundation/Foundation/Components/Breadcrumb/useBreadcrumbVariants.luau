local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local avatarIconSizeModule = require(foundation.Enums.AvatarIconSize)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local _ = require(foundation.Providers.Style.Tokens)

local function variantsFactory(p1)
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref), avatarIconSizeModule (ref)
	return {
		common = {
			container = { tag = "row align-y-center auto-xy padding-y-xsmall" },
			item = { tag = "row align-y-center gap-small auto-x" },
			itemText = { tag = "row align-y-center gap-xsmall auto-xy" },
			separator = {
				tag = "row align-x-center align-y-center size-600-0 auto-y"
			},
			current = { tag = "content-emphasis" },
			label = { tag = "content-emphasis" },
			accessory = { style = p1.Color.Content.Emphasis }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				separator = { textTag = "auto-xy text-body-small content-default" },
				current = { tag = "auto-xy text-title-small" },
				label = { tag = "auto-xy text-body-small" },
				accessory = {
					tag = "size-400-400 radius-small",
					iconSize = iconSizeModule.XSmall,
					avatarSize = avatarIconSizeModule.Small
				},
				item = { tag = "size-0-600" },
				overflow = { size = inputSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				separator = { textTag = "auto-xy text-body-small content-default" },
				current = { tag = "auto-xy text-title-small" },
				label = { tag = "auto-xy text-body-small" },
				accessory = {
					tag = "size-400-400 radius-small",
					iconSize = iconSizeModule.XSmall,
					avatarSize = avatarIconSizeModule.Small
				},
				item = { tag = "size-0-600" },
				overflow = { size = inputSizeModule.XSmall }
			},
			[inputSizeModule.Medium] = {
				separator = { textTag = "auto-xy text-body-medium content-default" },
				current = { tag = "auto-xy text-title-medium" },
				label = { tag = "auto-xy text-body-medium" },
				accessory = {
					tag = "size-500-500 radius-small",
					iconSize = iconSizeModule.Small,
					avatarSize = avatarIconSizeModule.Medium
				},
				item = { tag = "size-0-600" },
				overflow = { size = inputSizeModule.XSmall }
			},
			[inputSizeModule.Large] = {
				separator = { textTag = "auto-xy text-body-large content-default" },
				current = { tag = "auto-xy text-title-large" },
				label = { tag = "auto-xy text-body-large" },
				accessory = {
					tag = "size-600-600 radius-medium",
					iconSize = iconSizeModule.Medium,
					avatarSize = avatarIconSizeModule.Large
				},
				item = { tag = "size-0-800" },
				overflow = { size = inputSizeModule.Small }
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local breadcrumb = variantsContextModule.useVariants("Breadcrumb", variantsFactory, p1)
	
	return composeStyleVariantModule(breadcrumb.common, breadcrumb.sizes[p2])
end