local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy)
		local UploadCategory = p2.uploadCategory
		local IsUploadCategoryMatch: boolean = UploadCategory == ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS or UploadCategory == ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
		for MeshName, value in p2.renderMeshesData do
			if not UGCValidationService:ValidateEditableMeshVertColors(value.editable, IsUploadCategoryMatch) then
				p1:fail(ErrorSourceStringsModule.Keys.VertexColors_NotOpaque, {
					MeshName = MeshName,
					TransparencyNote = if IsUploadCategoryMatch then "with no transparency" else ""
				})
			end
		end
	end
}