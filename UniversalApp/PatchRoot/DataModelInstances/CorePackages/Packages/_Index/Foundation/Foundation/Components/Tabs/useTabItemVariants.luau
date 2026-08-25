local foundation = script:FindFirstAncestor("Foundation")
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)
local inputSizeModule = require(foundation.Enums.InputSize)
local iconSizeModule = require(foundation.Enums.IconSize)

local function variantsFactory(_)
	-- upvalues: inputSizeModule (ref), iconSizeModule (ref), flagsModule (ref)
	return {
		common = {
			text = { tag = "auto-x" },
			content = { tag = "row align-x-center align-y-center gap-small" }
		},
		sizes = {
			[inputSizeModule.XSmall] = {
				text = { tag = "size-0-400 text-label-small" },
				content = { tag = "padding-y-small" },
				icon = { size = iconSizeModule.XSmall }
			},
			[inputSizeModule.Small] = {
				text = { tag = "size-0-600 text-label-medium" },
				content = { tag = "padding-y-small" },
				icon = { size = iconSizeModule.Medium }
			},
			[inputSizeModule.Medium] = {
				text = { tag = "size-0-600 text-label-medium" },
				content = { tag = "padding-y-medium" },
				icon = { size = iconSizeModule.Medium }
			},
			[inputSizeModule.Large] = {
				text = { tag = "size-0-600 text-label-medium" },
				content = { tag = "padding-y-xlarge" },
				icon = { size = iconSizeModule.Medium }
			}
		},
		isFill = {
			[false] = {
				container = { tag = "auto-xy" },
				content = { tag = "size-0-0 auto-xy" }
			},
			[true] = {
				container = { tag = "grow auto-xy" },
				content = { tag = "auto-y", Size = UDim2.fromScale(1, 0) }
			}
		},
		paddings = {
			[inputSizeModule.XSmall] = {
				content = {
					tag = if flagsModule.FoundationFixTabsFitBorderWidth then "padding-x-xsmall" else "padding-x-small"
				}
			},
			[inputSizeModule.Small] = { content = { tag = "padding-x-small" } },
			[inputSizeModule.Medium] = { content = { tag = "padding-x-medium" } },
			[inputSizeModule.Large] = { content = { tag = "padding-x-large" } }
		}
	}
end

return function(p0, p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref), flagsModule (ref)
	local tab = variantsContextModule.useVariants("Tab", variantsFactory, p0)
	
	return composeStyleVariantModule(tab.common, tab.sizes[p1], tab.isFill[p2], if flagsModule.FoundationFixTabsFitBorderWidth then tab.paddings[p1] elseif p2 then tab.paddings[p1] else {})
end