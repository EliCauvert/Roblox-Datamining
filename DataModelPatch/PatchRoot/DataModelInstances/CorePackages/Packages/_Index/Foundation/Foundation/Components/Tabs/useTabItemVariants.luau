local Foundation = script:FindFirstAncestor("Foundation")
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)
local InputSizeModule = require(Foundation.Enums.InputSize)
local IconSizeModule = require(Foundation.Enums.IconSize)

local function variantsFactory(_)
	-- upvalues: InputSizeModule (copy), IconSizeModule (copy), FlagsModule (copy)
	return {
		common = {
			text = { tag = "auto-x" },
			content = { tag = "row align-x-center align-y-center gap-small" }
		},
		sizes = {
			[InputSizeModule.XSmall] = {
				text = { tag = "size-0-400 text-label-small" },
				content = { tag = "padding-y-small" },
				icon = { size = IconSizeModule.XSmall }
			},
			[InputSizeModule.Small] = {
				text = { tag = "size-0-600 text-label-medium" },
				content = { tag = "padding-y-small" },
				icon = { size = IconSizeModule.Medium }
			},
			[InputSizeModule.Medium] = {
				text = { tag = "size-0-600 text-label-medium" },
				content = { tag = "padding-y-medium" },
				icon = { size = IconSizeModule.Medium }
			},
			[InputSizeModule.Large] = {
				text = { tag = "size-0-600 text-label-medium" },
				content = { tag = "padding-y-xlarge" },
				icon = { size = IconSizeModule.Medium }
			}
		},
		isFill = {
			[false] = {
				container = { tag = "auto-xy" },
				content = { tag = "size-0-0 auto-xy" }
			},
			[true] = {
				container = { tag = "grow auto-xy" },
				content = if FlagsModule.FoundationTabsInlineSizeFull then { tag = "auto-y", Size = UDim2.fromScale(1, 0) } else { tag = "size-full-0 auto-y" }
			}
		},
		paddings = {
			[InputSizeModule.XSmall] = { content = { tag = "padding-x-small" } },
			[InputSizeModule.Small] = { content = { tag = "padding-x-small" } },
			[InputSizeModule.Medium] = { content = { tag = "padding-x-medium" } },
			[InputSizeModule.Large] = { content = { tag = "padding-x-large" } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local Tab = VariantsContextModule.useVariants("Tab", variantsFactory, p1)
	
	return ComposeStyleVariantModule(Tab.common, Tab.sizes[p2], Tab.isFill[p3], if p3 then Tab.paddings[p2] else {})
end