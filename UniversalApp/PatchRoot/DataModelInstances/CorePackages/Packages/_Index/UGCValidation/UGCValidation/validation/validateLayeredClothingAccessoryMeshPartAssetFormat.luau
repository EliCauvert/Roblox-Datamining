local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local validateLayeredClothingAccessoryModule = require(parent.validation.validateLayeredClothingAccessory)
local validateLayeredClothingAccessoryMeshPartAssetFormatMatchModule = require(parent.validation.validateLayeredClothingAccessoryMeshPartAssetFormatMatch)

return function(value, p1)
	-- upvalues: validateLayeredClothingAccessoryModule (ref), validateLayeredClothingAccessoryMeshPartAssetFormatMatchModule (ref)
	assert(p1.instances ~= nil, "instances required in validationContext for validateLayeredClothingAccessoryMeshPartAssetFormat")
	local instances = p1.instances
	local _ = nil
	local _ = nil
	local var1, var2 = validateLayeredClothingAccessoryModule(p1)
	
	if not var1 then
		return false, var2
	end
	local var3, var4 = validateLayeredClothingAccessoryMeshPartAssetFormatMatchModule(instances[1], value, p1)
	
	if var3 then
		return true
	end
	return false, var4
end