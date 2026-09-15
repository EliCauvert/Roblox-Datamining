local foundation = script:FindFirstAncestor("Foundation")
local iconSizeModule = require(foundation.Enums.IconSize)
local inputSizeModule = require(foundation.Enums.InputSize)
local shortcutVariantModule = require(foundation.Enums.ShortcutVariant)
local _ = require(foundation.Components.Types)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: iconSizeModule (ref), inputSizeModule (ref), shortcutVariantModule (ref)
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
			icon = { size = iconSizeModule.XSmall },
			gamepadIcon = { style = p1.Color.Content.Emphasis }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				keys = { tag = "gap-xxsmall" },
				cap = { tag = "size-400 radius-xsmall" },
				capWide = { padding = p1.Padding.XSmall },
				text = { tag = "text-caption-small" },
				separator = { tag = "size-0-400 text-label-small" },
				keybinding = { tag = "text-label-small" },
				gamepadIcon = { size = p1.Size.Size_400 }
			},
			[inputSizeModule.Small] = {
				keys = { tag = "gap-xsmall" },
				cap = { tag = "size-500 radius-small" },
				capWide = { padding = p1.Size.Size_150 },
				text = { tag = "text-caption-small" },
				separator = { tag = "size-0-500 text-label-medium" },
				keybinding = { tag = "text-label-medium" },
				gamepadIcon = { size = p1.Size.Size_500 }
			},
			[inputSizeModule.Medium] = {
				container = { gap = p1.Size.Size_200 },
				keys = { tag = "gap-xsmall" },
				cap = { tag = "size-600 radius-small" },
				capWide = { padding = p1.Padding.Small },
				text = { tag = "text-caption-medium" },
				separator = { tag = "size-0-600 text-label-large" },
				keybinding = { tag = "text-label-medium" },
				icon = { size = iconSizeModule.Small },
				gamepadIcon = { size = p1.Size.Size_600 }
			}
		},
		variants = {
			[shortcutVariantModule.Standard] = {
				cap = { tag = "bg-shift-200" },
				text = { tag = "content-emphasis" },
				icon = { style = p1.Color.Content.Emphasis }
			},
			[shortcutVariantModule.Contrast] = {
				cap = { tag = "bg-system-contrast" },
				text = { tag = "content-inverse-emphasis" },
				icon = { style = p1.Inverse.Content.Emphasis }
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local shortcut = variantsContextModule.useVariants("Shortcut", variantsFactory, p1)
	
	return composeStyleVariantModule(shortcut.common, shortcut.sizes[p2], shortcut.variants[p3])
end