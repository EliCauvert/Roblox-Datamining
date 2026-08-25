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
	run = function(p0, p1)
		-- upvalues: validationEnumsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
		local uploadCategory = p1.uploadCategory
		local var3 = if uploadCategory ~= validationEnumsModule.UploadCategory.TORSO_AND_LIMBS then uploadCategory == validationEnumsModule.UploadCategory.DYNAMIC_HEAD else true
		
		for i, v in p1.renderMeshesData do
			if not UGCValidationService:ValidateEditableMeshVertColors(v.editable, var3) then
				p0:fail(errorSourceStringsModule.Keys.VertexColors_NotOpaque, {
					MeshName = i,
					TransparencyNote = if var3 then "with no transparency" else ""
				})
			end
		end
	end
}