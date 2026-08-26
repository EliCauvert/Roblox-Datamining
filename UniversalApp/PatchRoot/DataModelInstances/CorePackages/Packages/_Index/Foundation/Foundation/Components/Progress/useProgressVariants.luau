local foundation = script:FindFirstAncestor("Foundation")
local progressSizeModule = require(foundation.Enums.ProgressSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: progressSizeModule (ref)
	return {
		sizes = {
			[progressSizeModule.Small] = {
				bar = { height = p1.Size.Size_50 },
				circle = { size = p1.Size.Size_400 }
			},
			[progressSizeModule.Medium] = {
				bar = { height = p1.Size.Size_100 },
				circle = { size = p1.Size.Size_800 }
			},
			[progressSizeModule.Large] = {
				bar = { height = p1.Size.Size_150 },
				circle = {
					size = p1.Size.Size_1300,
					labelFont = p1.Typography.LabelMedium
				}
			}
		}
	}
end

return function(p1, p2)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	return composeStyleVariantModule(variantsContextModule.useVariants("Progress", variantsFactory, p1).sizes[p2])
end