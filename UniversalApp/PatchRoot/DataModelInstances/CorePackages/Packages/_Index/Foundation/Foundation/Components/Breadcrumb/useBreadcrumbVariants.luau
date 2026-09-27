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
			item = { tag = "row align-y-center gap-small auto-xy" },
			itemText = { tag = "row align-y-center gap-xsmall auto-xy" },
			separator = {
				tag = "row align-x-center align-y-center size-600-0 auto-y",
				style = p1.Color.Content.Default
			},
			current = { style = p1.Color.Content.Emphasis },
			label = { style = p1.Color.Content.Emphasis },
			accessory = { style = p1.Color.Content.Emphasis }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				separator = { textTag = "auto-xy text-body-small" },
				current = { tag = "auto-xy text-title-small" },
				label = { tag = "auto-xy text-body-small" },
				accessory = {
					iconSize = iconSizeModule.XSmall,
					avatarSize = avatarIconSizeModule.Small,
					size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400),
					cornerRadius = UDim.new(0, p1.Radius.Small)
				},
				overflow = { size = inputSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				separator = { textTag = "auto-xy text-body-small" },
				current = { tag = "auto-xy text-title-small" },
				label = { tag = "auto-xy text-body-small" },
				accessory = {
					iconSize = iconSizeModule.XSmall,
					avatarSize = avatarIconSizeModule.Small,
					size = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400),
					cornerRadius = UDim.new(0, p1.Radius.Small)
				},
				overflow = { size = inputSizeModule.XSmall }
			},
			[inputSizeModule.Medium] = {
				separator = { textTag = "auto-xy text-body-medium" },
				current = { tag = "auto-xy text-title-medium" },
				label = { tag = "auto-xy text-body-medium" },
				accessory = {
					iconSize = iconSizeModule.Small,
					avatarSize = avatarIconSizeModule.Medium,
					size = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500),
					cornerRadius = UDim.new(0, p1.Radius.Small)
				},
				overflow = { size = inputSizeModule.XSmall }
			},
			[inputSizeModule.Large] = {
				separator = { textTag = "auto-xy text-body-large" },
				current = { tag = "auto-xy text-title-large" },
				label = { tag = "auto-xy text-body-large" },
				accessory = {
					iconSize = iconSizeModule.Medium,
					avatarSize = avatarIconSizeModule.Large,
					size = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600),
					cornerRadius = UDim.new(0, p1.Radius.Medium)
				},
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