local serializationService = game:GetService("SerializationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesDefault)
local t = {
	categories = constantsModule.AllAssetUploadCategories,
	requiredData = {
		validationEnumsModule.SharedDataMember.entrypointInput,
		validationEnumsModule.SharedDataMember.uploadCategory,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	fflag = require(parent.flags.getFFlagUGCValidateSerializedAssetSizeBounded)
}
local t_1 = {
	[validationEnumsModule.UploadCategory.TORSO_AND_LIMBS] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesTorsoAndLimbs),
	[validationEnumsModule.UploadCategory.DYNAMIC_HEAD] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesDynamicHead),
	[validationEnumsModule.UploadCategory.LAYERED_CLOTHING] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesLayeredClothing),
	[validationEnumsModule.UploadCategory.RIGID_ACCESSORY] = require(parent.flags.getFIntUGCValidateMaxSerializedAssetSizeBytesRigidAccessory)
}

function t.run(p0, p1)
	-- upvalues: validationEnumsModule (ref), serializationService (ref), t_1 (ref), getFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule (ref), errorSourceStringsModule (ref)
	if p1.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.Backend then return end
	local byteLength = buffer.len(serializationService:SerializeInstancesAsync(p1.entrypointInput))
	local var8 = (t_1[p1.uploadCategory] or getFIntUGCValidateMaxSerializedAssetSizeBytesDefaultModule)()
	
	if var8 < byteLength then
		p0:fail(errorSourceStringsModule.Keys.SerializedAssetTooLarge, {
			sizeBytes = tostring(byteLength),
			maxSizeBytes = tostring(var8)
		})
	end
end

return t