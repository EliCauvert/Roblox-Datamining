local foundation = script:FindFirstAncestor("Foundation")
local chipSizeModule = require(foundation.Enums.ChipSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: chipSizeModule (ref)
	return {
		textSpacing = {
			Leading = {
				[chipSizeModule.Small] = UDim.new(0, p1.Padding.XSmall),
				[chipSizeModule.Medium] = UDim.new(0, p1.Size.Size_150),
				[chipSizeModule.Large] = UDim.new(0, p1.Padding.Small)
			},
			Trailing = {
				[chipSizeModule.Small] = UDim.new(0, p1.Size.Size_150),
				[chipSizeModule.Medium] = UDim.new(0, p1.Padding.Small),
				[chipSizeModule.Large] = UDim.new(0, p1.Size.Size_250)
			}
		},
		accessorySpacing = {
			Circular = {
				[chipSizeModule.Small] = UDim.new(0, p1.Size.Size_150),
				[chipSizeModule.Medium] = UDim.new(0, p1.Size.Size_200),
				[chipSizeModule.Large] = UDim.new(0, p1.Size.Size_250)
			},
			Default = {
				[chipSizeModule.Small] = UDim.new(0, p1.Padding.Small),
				[chipSizeModule.Medium] = UDim.new(0, p1.Padding.Medium),
				[chipSizeModule.Large] = UDim.new(0, p1.Padding.Medium)
			}
		},
		accessorySize = {
			Default = {
				[chipSizeModule.Small] = UDim2.fromOffset(p1.Size.Size_300, p1.Size.Size_300),
				[chipSizeModule.Medium] = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400),
				[chipSizeModule.Large] = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
			},
			Circular = {
				[chipSizeModule.Small] = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400),
				[chipSizeModule.Medium] = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500),
				[chipSizeModule.Large] = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
			}
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local chipAccessory = variantsContextModule.useVariants("ChipAccessory", variantsFactory, p1)
	local var1 = if p4 then "Circular" else "Default"
	local var2 = if p3 then "Leading" else "Trailing"
	
	return composeStyleVariantModule({
		accessory = {
			Size = chipAccessory.accessorySize[var1][p2],
			padding = if p3 then {
				left = chipAccessory.accessorySpacing[var1][p2],
				right = chipAccessory.textSpacing[var2][p2]
			} else {
				left = chipAccessory.textSpacing[var2][p2],
				right = chipAccessory.accessorySpacing[var1][p2]
			}
		}
	})
end