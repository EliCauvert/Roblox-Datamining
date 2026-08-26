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

return function(value, p1)
	-- upvalues: validateSingleInstanceModule (ref), createLegacyAccessoryMeshPartAssetFormatSchemaModule (ref), validateInstanceTreeModule (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule (ref), validateSurfaceAppearancesModule (ref), getFFlagUGCValidateMigrateTextureTransparencyModule (ref), validateSurfaceAppearanceTextureSizeModule (ref), validateSurfaceAppearanceTransparencyModule (ref), getFFlagUGCValidateTexturePackModule (ref), validateTexturePackModule (ref), validateLegacyAccessoryMeshPartAssetFormatMatchModule (ref)
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
			elseif not getFFlagUGCValidateMigrateTextureTransparencyModule() then
				local var13, var14 = validateSurfaceAppearanceTextureSizeModule(var3, p1)
				
				if not var13 then
					return false, var14
				end
				local var15, var16 = validateSurfaceAppearanceTransparencyModule(var3, p1)
				local var17 = var16
				
				if not var15 then
					return false, var17
				elseif not getFFlagUGCValidateMigrateSurfaceAppearanceMeshQualityModule() and getFFlagUGCValidateTexturePackModule() then
					local var18, var19 = validateTexturePackModule.validate(var3, false, p1)
					local var20 = var19
					
					if not var18 then
						return false, var20
					end
				end
				local var21, var22 = validateLegacyAccessoryMeshPartAssetFormatMatchModule(var3, value, p1)
				
				if var21 then
					return true
				end
				return false, var22
			end
		end
	end
end