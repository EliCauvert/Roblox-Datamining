local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ConstantsModule = require(Parent.Constants)

return {
	fflag = require(Parent.flags.getFFlagUGCValidationEnableR15plusSkinning),
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2) --[[ Line: 14 ]]
		-- upvalues: R15plusUtilsModule (copy), UGCValidationService (copy), ConstantsModule (copy), ErrorSourceStringsModule (copy)
		local JointNameWhitelist = R15plusUtilsModule.getJointNameWhitelist()
		
		for _, JointName in {
			UGCValidationService:GetFacsDrivenJointNamesFromEditableMesh(p2.renderMeshesData.Head.editable)
		} do
			if JointNameWhitelist[JointName] or ConstantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES[JointName] then
				p1:fail(ErrorSourceStringsModule.Keys.UnallowedFacsJoints, { jointName = JointName })
			end
		end
	end
}