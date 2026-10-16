local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(Parent.flags.getFFlagUGCValidationEnableR15plusSkinning),
	categories = { ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2) --[[ Line: 13 ]]
		-- upvalues: R15plusUtilsModule (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy)
		local JointNameWhitelist = R15plusUtilsModule.getJointNameWhitelist()
		
		for PartName, value in p2.renderMeshesData do
			for _, JointName in {
				UGCValidationService:GetSkinnedJointNamesFromEditableMesh(value.editable)
			} do
				if not JointNameWhitelist[JointName] then
					p1:fail(ErrorSourceStringsModule.Keys.UnallowedJointSkinned, { partName = PartName, jointName = JointName })
				end
			end
		end
	end
}