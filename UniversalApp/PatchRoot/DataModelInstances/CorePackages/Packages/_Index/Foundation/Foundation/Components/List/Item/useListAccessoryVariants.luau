local foundation = script:FindFirstAncestor("Foundation")
local accessoryTypeModule = require(foundation.Enums.AccessoryType)
local inputSizeModule = require(foundation.Enums.InputSize)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function variantsFactory(p1)
	-- upvalues: accessoryTypeModule (ref), inputSizeModule (ref)
	return {
		accessorySize = {
			[accessoryTypeModule.Icon] = {
				[inputSizeModule.XSmall] = p1.Size.Size_400,
				[inputSizeModule.Small] = p1.Size.Size_500,
				[inputSizeModule.Medium] = p1.Size.Size_600,
				[inputSizeModule.Large] = p1.Size.Size_600
			},
			[accessoryTypeModule.Media] = {
				[inputSizeModule.XSmall] = p1.Size.Size_600,
				[inputSizeModule.Small] = p1.Size.Size_800,
				[inputSizeModule.Medium] = p1.Size.Size_1000,
				[inputSizeModule.Large] = p1.Size.Size_1400
			},
			[accessoryTypeModule.Avatar] = {
				[inputSizeModule.XSmall] = p1.Size.Size_600,
				[inputSizeModule.Small] = p1.Size.Size_800,
				[inputSizeModule.Medium] = p1.Size.Size_1000,
				[inputSizeModule.Large] = p1.Size.Size_1400
			}
		},
		containerSize = {
			[inputSizeModule.XSmall] = p1.Size.Size_600,
			[inputSizeModule.Small] = p1.Size.Size_800,
			[inputSizeModule.Medium] = p1.Size.Size_1000,
			[inputSizeModule.Large] = p1.Size.Size_1400
		},
		cornerRadius = {
			[inputSizeModule.XSmall] = p1.Radius.Small,
			[inputSizeModule.Small] = p1.Radius.Medium,
			[inputSizeModule.Medium] = p1.Radius.Medium,
			[inputSizeModule.Large] = p1.Radius.Medium
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local listAccessory = variantsContextModule.useVariants("ListAccessory", variantsFactory, p1)
	
	return composeStyleVariantModule({
		accessory = {
			Size = UDim2.fromOffset(listAccessory.accessorySize[p3][p2], listAccessory.accessorySize[p3][p2]),
			cornerRadius = UDim.new(0, listAccessory.cornerRadius[p2])
		},
		container = {
			Size = UDim2.fromOffset(listAccessory.containerSize[p2], listAccessory.containerSize[p2])
		}
	})
end