local SerializationService = game:GetService("SerializationService")
local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysicsModule = require(Parent.flags.getEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysics)
local GetFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule = require(Parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesDefault)
local GetFIntUGCValidateMaxSerializedAssetSizeBytesLayeredClothingModule = require(Parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesLayeredClothing)
local config = {
	[ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS] = require(Parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesTorsoAndLimbs),
	[ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD] = require(Parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesDynamicHead),
	[ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING] = GetFIntUGCValidateMaxSerializedAssetSizeBytesLayeredClothingModule,
	[ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH] = GetFIntUGCValidateMaxSerializedAssetSizeBytesLayeredClothingModule,
	[ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY] = require(Parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesRigidAccessory)
}

return {
	categories = require(Parent.Constants).AllAssetUploadCategories,
	requiredData = {
		ValidationEnumsModule.SharedDataMember.entrypointInput,
		ValidationEnumsModule.SharedDataMember.uploadCategory,
		ValidationEnumsModule.SharedDataMember.consumerConfig
	},
	fflag = require(Parent.flags.getFFlagUGCValidateSerializedAssetSizeBounded),
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), GetEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysicsModule (copy), UGCValidationService (copy), SerializationService (copy), config (copy), GetFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule (copy), ErrorSourceStringsModule (copy)
		if p2.consumerConfig.consumerEnv ~= ValidationEnumsModule.ConsumerEnv.Backend then return end
		local SerializedSizeExcludingCollisionAsync = if GetEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysicsModule() then UGCValidationService:GetSerializedSizeExcludingCollisionAsync(p2.entrypointInput) else buffer.len(SerializationService:SerializeInstancesAsync(p2.entrypointInput))
		local v1 = (config[p2.uploadCategory] or GetFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule)()
		
		if v1 < SerializedSizeExcludingCollisionAsync then
			p1:fail(ErrorSourceStringsModule.Keys.SerializedAssetTooLarge, {
				sizeBytes = tostring(SerializedSizeExcludingCollisionAsync),
				maxSizeBytes = tostring(v1)
			})
		end
	end
}