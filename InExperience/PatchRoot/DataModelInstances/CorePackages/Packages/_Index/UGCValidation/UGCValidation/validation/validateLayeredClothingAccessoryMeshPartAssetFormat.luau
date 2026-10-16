local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local ValidateLayeredClothingAccessoryModule = require(Parent.validation.validateLayeredClothingAccessory)
local ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModule = require(Parent.validation.validateLayeredClothingAccessoryMeshPartAssetFormatMatch)

return function(p1, p2) --[[ Line: 9 | Named "validateLayeredClothingAccessoryMeshPartAssetFormat" ]]
	-- upvalues: ValidateLayeredClothingAccessoryModule (copy), ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModule (copy)
	assert(p2.instances ~= nil, "instances required in validationContext for validateLayeredClothingAccessoryMeshPartAssetFormat")
	local Instances = p2.instances
	local ValidateLayeredClothingAccessoryModuleResult, ValidateLayeredClothingAccessoryModuleResult2 = ValidateLayeredClothingAccessoryModule(p2)
	
	if not ValidateLayeredClothingAccessoryModuleResult then
		return false, ValidateLayeredClothingAccessoryModuleResult2
	end
	local ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModuleResult2 = ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModule(Instances[1], p1, p2)
	
	if ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModuleResult then
		return true
	else
		return false, ValidateLayeredClothingAccessoryMeshPartAssetFormatMatchModuleResult2
	end
end