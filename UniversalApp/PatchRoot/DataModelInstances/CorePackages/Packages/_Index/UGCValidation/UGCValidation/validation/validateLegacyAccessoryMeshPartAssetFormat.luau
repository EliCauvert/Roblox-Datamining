local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local createLegacyAccessoryMeshPartAssetFormatSchemaModule = require(parent.util.createLegacyAccessoryMeshPartAssetFormatSchema)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateLegacyAccessoryMeshPartAssetFormatMatchModule = require(parent.validation.validateLegacyAccessoryMeshPartAssetFormatMatch)
local validateSurfaceAppearancesModule = require(parent.validation.validateSurfaceAppearances)
local validateTexturePackModule = require(parent.validation.ValidateTexturePack)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(value, p1)
	-- upvalues: validateSingleInstanceModule (ref), createLegacyAccessoryMeshPartAssetFormatSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateLegacyAccessoryMeshPartAssetFormatMatchModule (ref)
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
		elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			local var10, var11 = validateSurfaceAppearancesModule(var3, p1)
			local var12 = var11
			
			if not var10 then
				return false, var12
			elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
				local var13, var14 = validateTexturePackModule.validate(var3, false, p1)
				local var15 = var14
				
				if not var13 then
					return false, var15
				end
			end
			local var16, var17 = validateLegacyAccessoryMeshPartAssetFormatMatchModule(var3, value, p1)
			
			if var16 then
				return true
			end
			return false, var17
		end
	end
end