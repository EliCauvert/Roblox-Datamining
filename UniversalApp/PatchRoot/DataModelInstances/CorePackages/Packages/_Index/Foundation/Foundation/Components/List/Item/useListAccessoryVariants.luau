local Foundation = script:FindFirstAncestor("Foundation")
local AccessoryTypeModule = require(Foundation.Enums.AccessoryType)
local InputSizeModule = require(Foundation.Enums.InputSize)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: AccessoryTypeModule (copy), InputSizeModule (copy)
	return {
		accessorySize = {
			[AccessoryTypeModule.Icon] = {
				[InputSizeModule.XSmall] = p1.Size.Size_400,
				[InputSizeModule.Small] = p1.Size.Size_500,
				[InputSizeModule.Medium] = p1.Size.Size_600,
				[InputSizeModule.Large] = p1.Size.Size_600
			},
			[AccessoryTypeModule.Media] = {
				[InputSizeModule.XSmall] = p1.Size.Size_600,
				[InputSizeModule.Small] = p1.Size.Size_800,
				[InputSizeModule.Medium] = p1.Size.Size_1000,
				[InputSizeModule.Large] = p1.Size.Size_1400
			},
			[AccessoryTypeModule.Avatar] = {
				[InputSizeModule.XSmall] = p1.Size.Size_600,
				[InputSizeModule.Small] = p1.Size.Size_800,
				[InputSizeModule.Medium] = p1.Size.Size_1000,
				[InputSizeModule.Large] = p1.Size.Size_1400
			}
		},
		containerSize = {
			[InputSizeModule.XSmall] = p1.Size.Size_600,
			[InputSizeModule.Small] = p1.Size.Size_800,
			[InputSizeModule.Medium] = p1.Size.Size_1000,
			[InputSizeModule.Large] = p1.Size.Size_1400
		},
		cornerRadius = {
			[InputSizeModule.XSmall] = p1.Radius.Small,
			[InputSizeModule.Small] = p1.Radius.Medium,
			[InputSizeModule.Medium] = p1.Radius.Medium,
			[InputSizeModule.Large] = p1.Radius.Medium
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local ListAccessory = VariantsContextModule.useVariants("ListAccessory", variantsFactory, p1)
	
	return ComposeStyleVariantModule({
		accessory = {
			Size = UDim2.fromOffset(ListAccessory.accessorySize[p3][p2], ListAccessory.accessorySize[p3][p2]),
			cornerRadius = UDim.new(0, ListAccessory.cornerRadius[p2])
		},
		container = {
			Size = UDim2.fromOffset(ListAccessory.containerSize[p2], ListAccessory.containerSize[p2])
		}
	})
end