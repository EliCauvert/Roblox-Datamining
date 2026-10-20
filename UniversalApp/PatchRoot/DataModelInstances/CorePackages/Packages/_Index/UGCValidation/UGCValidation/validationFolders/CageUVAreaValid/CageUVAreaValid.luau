local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.outerCagesData },
	conditionalData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), ErrorSourceStringsModule (copy)
		for PartName, value in p2.outerCagesData do
			if not UGCValidationService:ValidateEditableMeshCageUVTriangleArea(value.editable) then
				p1:fail(ErrorSourceStringsModule.Keys.CageUV_ZeroAreaTriangle, { partName = PartName })
			end
		end
	end
}