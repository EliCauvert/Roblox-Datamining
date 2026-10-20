local Foundation = script:FindFirstAncestor("Foundation")
local FlagsModule = require(Foundation.Utility.Flags)
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: ChipSizeModule (copy)
	return {
		textSpacing = {
			Leading = {
				[ChipSizeModule.Small] = UDim.new(0, p1.Padding.XSmall),
				[ChipSizeModule.Medium] = UDim.new(0, p1.Size.Size_150),
				[ChipSizeModule.Large] = UDim.new(0, p1.Padding.Small)
			},
			Trailing = {
				[ChipSizeModule.Small] = UDim.new(0, p1.Size.Size_150),
				[ChipSizeModule.Medium] = UDim.new(0, p1.Padding.Small),
				[ChipSizeModule.Large] = UDim.new(0, p1.Size.Size_250)
			}
		},
		accessorySpacing = {
			Circular = {
				[ChipSizeModule.Small] = UDim.new(0, p1.Size.Size_150),
				[ChipSizeModule.Medium] = UDim.new(0, p1.Size.Size_200),
				[ChipSizeModule.Large] = UDim.new(0, p1.Size.Size_250)
			},
			Default = {
				[ChipSizeModule.Small] = UDim.new(0, p1.Padding.Small),
				[ChipSizeModule.Medium] = UDim.new(0, p1.Padding.Medium),
				[ChipSizeModule.Large] = UDim.new(0, p1.Padding.Medium)
			}
		},
		accessorySize = {
			Default = {
				[ChipSizeModule.Small] = UDim2.fromOffset(p1.Size.Size_300, p1.Size.Size_300),
				[ChipSizeModule.Medium] = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400),
				[ChipSizeModule.Large] = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500)
			},
			Circular = {
				[ChipSizeModule.Small] = UDim2.fromOffset(p1.Size.Size_400, p1.Size.Size_400),
				[ChipSizeModule.Medium] = UDim2.fromOffset(p1.Size.Size_500, p1.Size.Size_500),
				[ChipSizeModule.Large] = UDim2.fromOffset(p1.Size.Size_600, p1.Size.Size_600)
			}
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), FlagsModule (copy), ComposeStyleVariantModule (copy)
	local ChipAccessory = VariantsContextModule.useVariants("ChipAccessory", variantsFactory, p1)
	local Circular: string = if p4 then "Circular" else "Default"
	local v1 = if FlagsModule.FoundationChipBeta then p3 else p4
	local Leading: string = if v1 then "Leading" else "Trailing"
	
	return ComposeStyleVariantModule({
		accessory = {
			Size = ChipAccessory.accessorySize[Circular][p2],
			padding = if p3 then {
				left = ChipAccessory.accessorySpacing[Circular][p2],
				right = ChipAccessory.textSpacing[Leading][p2]
			} else {
				left = ChipAccessory.textSpacing[Leading][p2],
				right = ChipAccessory.accessorySpacing[Circular][p2]
			}
		}
	})
end