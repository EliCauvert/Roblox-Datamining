local foundation = script:FindFirstAncestor("Foundation")
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)
local optionSelectorGroupSizeModule = require(foundation.Enums.OptionSelectorGroupSize)
local orientationModule = require(foundation.Enums.Orientation)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(_)
	-- upvalues: optionSelectorGroupSizeModule (ref), inputLabelSizeModule (ref), orientationModule (ref)
	return {
		common = {
			container = { tag = "col gap-small size-full-0 auto-y" },
			list = { tag = "gap-medium size-full-0 auto-y" }
		},
		sizes = {
			[optionSelectorGroupSizeModule.XSmall] = { legend = { size = inputLabelSizeModule.Small } },
			[optionSelectorGroupSizeModule.Small] = { legend = { size = inputLabelSizeModule.Small } },
			[optionSelectorGroupSizeModule.Medium] = { legend = { size = inputLabelSizeModule.Medium } }
		},
		orientations = {
			[orientationModule.Vertical] = { list = { tag = { col = true } } },
			[orientationModule.Horizontal] = { list = { tag = { row = true } } }
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local optionSelectorGroup = variantsContextModule.useVariants("OptionSelectorGroup", variantsFactory, p1)
	
	return composeStyleVariantModule(optionSelectorGroup.common, optionSelectorGroup.sizes[p2], optionSelectorGroup.orientations[p3])
end