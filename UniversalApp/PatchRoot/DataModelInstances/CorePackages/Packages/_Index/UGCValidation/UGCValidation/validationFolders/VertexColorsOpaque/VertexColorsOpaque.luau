local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSurfaceAppearanceMeshQuality),
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: validationEnumsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
		local uploadCategory = p2.uploadCategory
		local var1 = if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true
		
		for i, v in p2.renderMeshesData do
			if not UGCValidationService:ValidateEditableMeshVertColors(v.editable, var1) then
				p1:fail(errorSourceStringsModule.Keys.VertexColors_NotOpaque, {
					MeshName = i,
					TransparencyNote = if var1 then "with no transparency" else ""
				})
			end
		end
	end
}