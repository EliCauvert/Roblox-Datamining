local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(parent.flags.getFFlagUGCValidationEnableR15plusSkinning),
	categories = { validationEnumsModule.UploadCategory.TORSO_AND_LIMBS },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2)
		-- upvalues: r15plusUtilsModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
		local jointNameWhitelist = r15plusUtilsModule.getJointNameWhitelist()
		
		for i, v in p2.renderMeshesData do
			for i_1, v_1 in {
				UGCValidationService:GetSkinnedJointNamesFromEditableMesh(v.editable)
			} do
				if not jointNameWhitelist[v_1] then
					p1:fail(errorSourceStringsModule.Keys.UnallowedJointSkinned, { partName = i, jointName = v_1 })
				end
			end
		end
	end
}