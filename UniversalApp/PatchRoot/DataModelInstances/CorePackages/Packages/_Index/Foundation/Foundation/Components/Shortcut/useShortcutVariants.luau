local Foundation = script:FindFirstAncestor("Foundation")
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ShortcutVariantModule = require(Foundation.Enums.ShortcutVariant)
local _ = require(Foundation.Components.Types)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: IconSizeModule (copy), InputSizeModule (copy), ShortcutVariantModule (copy)
	return {
		common = {
			container = { tag = "auto-xy", gap = p1.Size.Size_150 },
			keys = { tag = "row align-y-center auto-xy" },
			cap = { tag = "row align-x-center align-y-center auto-x" },
			capless = { tag = "row align-x-center align-y-center auto-xy" },
			text = { tag = "auto-xy text-align-x-center" },
			separator = {
				tag = "auto-x padding-x-xxsmall text-align-x-center content-emphasis"
			},
			keybinding = { tag = "auto-xy text-align-x-left content-default" },
			icon = { size = IconSizeModule.XSmall },
			gamepadIcon = { style = p1.Color.Content.Emphasis }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				keys = { tag = "gap-xxsmall" },
				cap = { tag = "size-400 radius-xsmall" },
				capWide = { padding = p1.Padding.XSmall },
				text = { tag = "text-caption-small" },
				separator = { tag = "size-0-400 text-label-small" },
				keybinding = { tag = "text-label-small" },
				gamepadIcon = { size = p1.Size.Size_400 }
			},
			[InputSizeModule.Small] = {
				keys = { tag = "gap-xsmall" },
				cap = { tag = "size-500 radius-small" },
				capWide = { padding = p1.Size.Size_150 },
				text = { tag = "text-caption-small" },
				separator = { tag = "size-0-500 text-label-medium" },
				keybinding = { tag = "text-label-medium" },
				gamepadIcon = { size = p1.Size.Size_500 }
			},
			[InputSizeModule.Medium] = {
				container = { gap = p1.Size.Size_200 },
				keys = { tag = "gap-xsmall" },
				cap = { tag = "size-600 radius-small" },
				capWide = { padding = p1.Padding.Small },
				text = { tag = "text-caption-medium" },
				separator = { tag = "size-0-600 text-label-large" },
				keybinding = { tag = "text-label-medium" },
				icon = { size = IconSizeModule.Small },
				gamepadIcon = { size = p1.Size.Size_600 }
			}
		},
		variants = {
			[ShortcutVariantModule.Standard] = {
				cap = { tag = "bg-shift-200" },
				text = { tag = "content-emphasis" },
				icon = { style = p1.Color.Content.Emphasis }
			},
			[ShortcutVariantModule.Contrast] = {
				cap = { tag = "bg-system-contrast" },
				text = { tag = "content-inverse-emphasis" },
				icon = { style = p1.Inverse.Content.Emphasis }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Shortcut = VariantsContextModule.useVariants("Shortcut", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Shortcut.common, Shortcut.sizes[p2], Shortcut.variants[p3])
end