local Foundation = script:FindFirstAncestor("Foundation")
local ProgressSizeModule = require(Foundation.Enums.ProgressSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1) --[[ Line: 14 ]]
	-- upvalues: ProgressSizeModule (copy)
	return {
		sizes = {
			[ProgressSizeModule.Small] = {
				bar = { height = p1.Size.Size_50 },
				circle = { size = p1.Size.Size_400 }
			},
			[ProgressSizeModule.Medium] = {
				bar = { height = p1.Size.Size_100 },
				circle = { size = p1.Size.Size_800 }
			},
			[ProgressSizeModule.Large] = {
				bar = { height = p1.Size.Size_150 },
				circle = {
					size = p1.Size.Size_1300,
					labelFont = p1.Typography.LabelMedium
				}
			}
		}
	}
end

return function(p1, p2) --[[ Line: 46 ]]
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	return ComposeStyleVariantModule(VariantsContextModule.useVariants("Progress", variantsFactory, p1).sizes[p2])
end