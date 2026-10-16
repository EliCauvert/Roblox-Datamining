local Foundation = script:FindFirstAncestor("Foundation")
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local AvatarIconSizeModule = require(Foundation.Enums.AvatarIconSize)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local _ = require(Foundation.Providers.Style.Tokens)

local function variantsFactory(p1) --[[ Line: 39 ]]
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy), AvatarIconSizeModule (copy)
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
			[InputSizeModule.XSmall] = {
				separator = { textTag = "auto-xy text-body-small content-default" },
				current = { tag = "auto-xy text-title-small" },
				label = { tag = "auto-xy text-body-small" },
				accessory = {
					tag = "size-400-400 radius-small",
					iconSize = IconSizeModule.XSmall,
					avatarSize = AvatarIconSizeModule.Small
				},
				item = { tag = "size-0-600" },
				overflow = { size = InputSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				separator = { textTag = "auto-xy text-body-small content-default" },
				current = { tag = "auto-xy text-title-small" },
				label = { tag = "auto-xy text-body-small" },
				accessory = {
					tag = "size-400-400 radius-small",
					iconSize = IconSizeModule.XSmall,
					avatarSize = AvatarIconSizeModule.Small
				},
				item = { tag = "size-0-600" },
				overflow = { size = InputSizeModule.XSmall }
			},
			[InputSizeModule.Medium] = {
				separator = { textTag = "auto-xy text-body-medium content-default" },
				current = { tag = "auto-xy text-title-medium" },
				label = { tag = "auto-xy text-body-medium" },
				accessory = {
					tag = "size-500-500 radius-small",
					iconSize = IconSizeModule.Small,
					avatarSize = AvatarIconSizeModule.Medium
				},
				item = { tag = "size-0-600" },
				overflow = { size = InputSizeModule.XSmall }
			},
			[InputSizeModule.Large] = {
				separator = { textTag = "auto-xy text-body-large content-default" },
				current = { tag = "auto-xy text-title-large" },
				label = { tag = "auto-xy text-body-large" },
				accessory = {
					tag = "size-600-600 radius-medium",
					iconSize = IconSizeModule.Medium,
					avatarSize = AvatarIconSizeModule.Large
				},
				item = { tag = "size-0-800" },
				overflow = { size = InputSizeModule.Small }
			}
		}
	}
end

return function(p1, p2) --[[ Line: 112 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Breadcrumb = VariantsContextModule.useVariants("Breadcrumb", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Breadcrumb.common, Breadcrumb.sizes[p2])
end