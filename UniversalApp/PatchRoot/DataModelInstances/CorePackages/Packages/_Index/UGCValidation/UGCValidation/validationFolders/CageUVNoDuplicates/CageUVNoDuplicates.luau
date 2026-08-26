local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local wrapTargetCageUVReferenceValuesModule = require(parent.WrapTargetCageUVReferenceValues)
local getFIntUGCValidateCageDuplicateUVThresholdModule = require(parent.flags.getFIntUGCValidateCageDuplicateUVThreshold)

return {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		validationEnumsModule.SharedDataMember.innerCagesData,
		validationEnumsModule.SharedDataMember.outerCagesData
	},
	conditionalData = {},
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageUV),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: wrapTargetCageUVReferenceValuesModule (ref), UGCValidationService (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (ref), errorSourceStringsModule (ref)
		local t = {}
		
		for i, v in pairs(wrapTargetCageUVReferenceValuesModule) do
			for i_1, v_1 in pairs(v) do
				table.insert(t, v_1)
			end
		end
		local function checkCage(p3, p4)
			-- upvalues: UGCValidationService (copy), t (ref), getFIntUGCValidateCageDuplicateUVThresholdModule (copy), p1 (ref), errorSourceStringsModule (copy)
			for i, v in p3 do
				local var1 = UGCValidationService:ValidateEditableMeshUVDuplicates(t, v.editable)
				
				if getFIntUGCValidateCageDuplicateUVThresholdModule() < var1 then
					p1:fail(errorSourceStringsModule.Keys.CageUV_ExtraDuplicateUVs, {
						count = tostring(var1),
						cageType = if p4 then "inner" else "outer",
						partName = i
					})
				end
			end
		end
		
		checkCage(p2.innerCagesData, true)
		checkCage(p2.outerCagesData, false)
	end
}