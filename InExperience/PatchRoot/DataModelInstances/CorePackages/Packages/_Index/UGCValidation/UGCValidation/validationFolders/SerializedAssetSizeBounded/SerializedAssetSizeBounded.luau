local serializationService = game:GetService("SerializationService")
local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateSerializedAssetSizeBoundedModule = require(parent.flags.getFFlagUGCValidateSerializedAssetSizeBounded)
local getEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysicsModule = require(parent.flags.getEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysics)
local getFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesDefault)
local t = {
	categories = constantsModule.AllAssetUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.entrypointInput,
		validationEnumsModule.SharedDataMember.uploadCategory,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	fflag = getFFlagUGCValidateSerializedAssetSizeBoundedModule
}
local t_1 = {
	[validationEnumsModule.UploadCategory.TORSO_AND_LIMBS] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesTorsoAndLimbs),
	[validationEnumsModule.UploadCategory.DYNAMIC_HEAD] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesDynamicHead),
	[validationEnumsModule.UploadCategory.LAYERED_CLOTHING] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesLayeredClothing),
	[validationEnumsModule.UploadCategory.RIGID_ACCESSORY] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesRigidAccessory)
}

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), getEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysicsModule (ref), UGCValidationService (ref), serializationService (ref), t_1 (ref), getFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule (ref), errorSourceStringsModule (ref)
	if p2.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.Backend then return end
	local var1 = if getEngineFeatureEngineUGCValidateSerializeExcludeCollisionPhysicsModule() then UGCValidationService:GetSerializedSizeExcludingCollisionAsync(p2.entrypointInput) else buffer.len(serializationService:SerializeInstancesAsync(p2.entrypointInput))
	local var2 = (t_1[p2.uploadCategory] or getFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule)()
	
	if var2 < var1 then
		p1:fail(errorSourceStringsModule.Keys.SerializedAssetTooLarge, {
			sizeBytes = tostring(var1),
			maxSizeBytes = tostring(var2)
		})
	end
end

return t