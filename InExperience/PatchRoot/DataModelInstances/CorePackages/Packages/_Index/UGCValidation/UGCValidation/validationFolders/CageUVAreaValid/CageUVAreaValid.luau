local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.outerCagesData },
	conditionalData = {},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageUV),
	expectedFailures = {},
	run = function(p0, p1) --[[ line: 36 ]]
		-- upvalues: UGCValidationService (ref), errorSourceStringsModule (ref)
		for i, v in p1.outerCagesData do
			if not UGCValidationService:ValidateEditableMeshCageUVTriangleArea(v.editable) then
				p0:fail(errorSourceStringsModule.Keys.CageUV_ZeroAreaTriangle, { partName = i })
			end
		end
	end
}