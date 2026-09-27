local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local createLegacyAccessoryMeshPartAssetFormatSchemaModule = require(parent.util.createLegacyAccessoryMeshPartAssetFormatSchema)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateLegacyAccessoryMeshPartAssetFormatMatchModule = require(parent.validation.validateLegacyAccessoryMeshPartAssetFormatMatch)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)

return function(value, p1)
	-- upvalues: validateSingleInstanceModule (ref), createLegacyAccessoryMeshPartAssetFormatSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), validateLegacyAccessoryMeshPartAssetFormatMatchModule (ref)
	assert(p1.instances ~= nil, "instances required in validationContext for validateLegacyAccessoryMeshPartAssetFormat")
	local instances = p1.instances
	local _ = nil
	local _ = nil
	local var1, var2 = validateSingleInstanceModule(instances, p1)
	
	if not var1 then
		return false, var2
	end
	local var3 = instances[1]
	local var4, var5 = validateInstanceTreeModule(createLegacyAccessoryMeshPartAssetFormatSchemaModule(value:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment").Name), var3, p1)
	local var6 = var5
	
	if not var4 then
		return false, var6
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var7, var8 = validatePropertiesSensibleModule.validate(var3, p1)
		local var9 = var8
		
		if not var7 then
			return false, var9
		end
	end
	local var10, var11 = validateLegacyAccessoryMeshPartAssetFormatMatchModule(var3, value, p1)
	
	if var10 then
		return true
	end
	return false, var11
end