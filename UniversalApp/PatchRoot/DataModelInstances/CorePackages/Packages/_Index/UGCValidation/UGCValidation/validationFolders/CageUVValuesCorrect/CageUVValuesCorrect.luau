local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.outerCagesData },
	conditionalData = {},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageUV),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
		for i, v in p2.outerCagesData do
			local var1 = wrapTargetCageUVReferenceValuesModule[i]
			
			if var1 and not UGCValidationService:ValidateEditableMeshUVValuesInReference(var1, v.editable) then
				p1:fail(errorSourceStringsModule.Keys.CageUV_InvalidUVValue, { partName = i })
			end
		end
	end
}