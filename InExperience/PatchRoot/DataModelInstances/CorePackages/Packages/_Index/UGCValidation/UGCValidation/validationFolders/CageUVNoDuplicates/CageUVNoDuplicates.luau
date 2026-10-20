local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local WrapTargetCageUVReferenceValuesModule = require(Parent.WrapTargetCageUVReferenceValues)
local GetFIntUGCValidateCageDuplicateUVThresholdModule = require(Parent.flags.getFIntUGCValidateCageDuplicateUVThreshold)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.innerCagesData,
		ValidationEnumsModule.SharedDataMember.outerCagesData
	},
	conditionalData = {},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: WrapTargetCageUVReferenceValuesModule (copy), UGCValidationService (copy), GetFIntUGCValidateCageDuplicateUVThresholdModule (copy), ErrorSourceStringsModule (copy)
		local List = {}
		
		for _, value in pairs(WrapTargetCageUVReferenceValuesModule) do
			for _, value1 in pairs(value) do
				table.insert(List, value1)
			end
		end
		local function checkCage(InnerCagesData, p3)
			-- upvalues: UGCValidationService (upval), List (copy), GetFIntUGCValidateCageDuplicateUVThresholdModule (upval), p1 (copy), ErrorSourceStringsModule (upval)
			for PartName, value in InnerCagesData do
				local ValidateEditableMeshUVDuplicatesResult = UGCValidationService:ValidateEditableMeshUVDuplicates(List, value.editable)
				
				if GetFIntUGCValidateCageDuplicateUVThresholdModule() < ValidateEditableMeshUVDuplicatesResult then
					p1:fail(ErrorSourceStringsModule.Keys.CageUV_ExtraDuplicateUVs, {
						count = tostring(ValidateEditableMeshUVDuplicatesResult),
						cageType = if p3 then "inner" else "outer",
						partName = PartName
					})
				end
			end
		end
		
		checkCage(p2.innerCagesData, true)
		checkCage(p2.outerCagesData, false)
	end
}