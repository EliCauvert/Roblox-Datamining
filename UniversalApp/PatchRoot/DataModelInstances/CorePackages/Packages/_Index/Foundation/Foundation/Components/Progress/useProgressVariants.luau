local foundation = script:FindFirstAncestor("Foundation")
local progressSizeModule = require(foundation.Enums.ProgressSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p0) --[[ line: 14 ]]
	-- upvalues: progressSizeModule (ref)
	return {
		sizes = {
			[progressSizeModule.Small] = {
				bar = { height = p0.Size.Size_50 },
				circle = { size = p0.Size.Size_400 }
			},
			[progressSizeModule.Medium] = {
				bar = { height = p0.Size.Size_100 },
				circle = { size = p0.Size.Size_800 }
			},
			[progressSizeModule.Large] = {
				bar = { height = p0.Size.Size_150 },
				circle = {
					size = p0.Size.Size_1300,
					labelFont = p0.Typography.LabelMedium
				}
			}
		}
	}
end

return function(p1, p2) --[[ line: 46 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	return composeStyleVariantModule(variantsContextModule.useVariants("Progress", variantsFactory, p1).sizes[p2])
end