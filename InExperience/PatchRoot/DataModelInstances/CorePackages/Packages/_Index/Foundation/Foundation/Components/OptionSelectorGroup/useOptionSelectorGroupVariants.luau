local Foundation = script:FindFirstAncestor("Foundation")
local InputLabelSizeModule = require(Foundation.Enums.InputLabelSize)
local OptionSelectorGroupSizeModule = require(Foundation.Enums.OptionSelectorGroupSize)
local OrientationModule = require(Foundation.Enums.Orientation)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(_) --[[ Line: 29 ]]
	-- upvalues: OptionSelectorGroupSizeModule (copy), InputLabelSizeModule (copy), OrientationModule (copy)
	return {
		common = {
			container = { tag = "col gap-small size-full-0 auto-y" },
			list = { tag = "gap-medium size-full-0 auto-y" }
		},
		sizes = {
			[OptionSelectorGroupSizeModule.XSmall] = { legend = { size = InputLabelSizeModule.Small } },
			[OptionSelectorGroupSizeModule.Small] = { legend = { size = InputLabelSizeModule.Small } },
			[OptionSelectorGroupSizeModule.Medium] = { legend = { size = InputLabelSizeModule.Medium } }
		},
		orientations = {
			[OrientationModule.Vertical] = { list = { tag = { col = true } } },
			[OrientationModule.Horizontal] = { list = { tag = { row = true } } }
		}
	}
end

return function(p1, p2, p3) --[[ Line: 75 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local OptionSelectorGroup = VariantsContextModule.useVariants("OptionSelectorGroup", variantsFactory, p1)
	
	return (ComposeStyleVariantModule(OptionSelectorGroup.common, OptionSelectorGroup.sizes[p2], OptionSelectorGroup.orientations[p3]))
end