local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.outerCagesData },
	conditionalData = {},
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateCageUV),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: WrapTargetCageUVReferenceValuesModule (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy)
		for PartName, value in p2.outerCagesData do
			local WrapTargetCageUVReferenceValuesModuleEntry = WrapTargetCageUVReferenceValuesModule[PartName]
			
			if WrapTargetCageUVReferenceValuesModuleEntry and not UGCValidationService:ValidateEditableMeshUVValuesInReference(WrapTargetCageUVReferenceValuesModuleEntry, value.editable) then
				p1:fail(ErrorSourceStringsModule.Keys.CageUV_InvalidUVValue, { partName = PartName })
			end
		end
	end
}