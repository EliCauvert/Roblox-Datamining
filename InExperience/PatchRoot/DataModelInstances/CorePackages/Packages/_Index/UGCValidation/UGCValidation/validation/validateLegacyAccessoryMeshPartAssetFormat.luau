local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local createLegacyAccessoryMeshPartAssetFormatSchemaModule = require(parent.util.createLegacyAccessoryMeshPartAssetFormatSchema)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateInstanceTreeModule = require(parent.validation.validateInstanceTree)
local validateLegacyAccessoryMeshPartAssetFormatMatchModule = require(parent.validation.validateLegacyAccessoryMeshPartAssetFormatMatch)
local validateSurfaceAppearancesModule = require(parent.validation.validateSurfaceAppearances)
local validateSurfaceAppearanceTextureSizeModule = require(parent.validation.validateSurfaceAppearanceTextureSize)
local validateTexturePackModule = require(parent.validation.ValidateTexturePack)
local validateSurfaceAppearanceTransparencyModule = require(parent.validation.validateSurfaceAppearanceTransparency)
local validatePropertiesSensibleModule = require(parent.validation.ValidatePropertiesSensible)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFFlagUGCValidateTexturePackModule = require(parent.flags.getFFlagUGCValidateTexturePack)
local getFFlagUGCValidateMigrateTextureTransparencyModule = require(parent.flags.getFFlagUGCValidateMigrateTextureTransparency)
local getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality)

return function(value, p0) --[[ line: 24 | named "validateLegacyAccessoryMeshPartAssetFormat" ]]
	-- upvalues: validateSingleInstanceModule (ref), createLegacyAccessoryMeshPartAssetFormatSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateSurfaceAppearanceTransparencyModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateLegacyAccessoryMeshPartAssetFormatMatchModule (ref)
	assert(p0.instances ~= nil, "instances required in validationContext for validateLegacyAccessoryMeshPartAssetFormat")
	local instances = p0.instances
	local _ = nil
	local _ = nil
	local var13, var14 = validateSingleInstanceModule(instances, p0)
	
	if not var13 then
		return false, var14
	end
	local var15 = instances[1]
	local var16, var17 = validateInstanceTreeModule(createLegacyAccessoryMeshPartAssetFormatSchemaModule(value:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment").Name), var15, p0)
	local var18 = var17
	
	if not var16 then
		return false, var18
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var19, var20 = validatePropertiesSensibleModule.validate(var15, p0)
		local var21 = var20
		
		if not var19 then
			return false, var21
		elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() then
			local var22, var23 = validateSurfaceAppearancesModule(var15, p0)
			local var24 = var23
			
			if not var22 then
				return false, var24
			elseif not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				local var25, var26 = validateSurfaceAppearanceTextureSizeModule(var15, p0)
				
				if not var25 then
					return false, var26
				end
				local var27, var28 = validateSurfaceAppearanceTransparencyModule(var15, p0)
				local var29 = var28
				
				if not var27 then
					return false, var29
				elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
					local var30, var31 = validateTexturePackModule.validate(var15, false, p0)
					local var32 = var31
					
					if not var30 then
						return false, var32
					end
				end
				local var33, var34 = validateLegacyAccessoryMeshPartAssetFormatMatchModule(var15, value, p0)
				
				if var33 then
					return true
				end
				return false, var34
			end
		end
	end
end