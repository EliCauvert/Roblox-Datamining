local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUniqueUVToleranceModule = require(Parent.flags.getFIntUniqueUVTolerance)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.outerCagesData },
	conditionalData = {},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 35 ]]
		-- upvalues: ConstantsModule (copy), UGCValidationService (copy), GetFIntUniqueUVToleranceModule (copy), ErrorSourceStringsModule (copy)
		for PartName, value in p2.outerCagesData do
			local WRAPTARGETCAGEMESHUVCOUNT = ConstantsModule.WRAP_TARGET_CAGE_MESH_UV_COUNTS[PartName]
			
			if WRAPTARGETCAGEMESHUVCOUNT then
				local EditableMeshUniqueUVCount = UGCValidationService:CalculateEditableMeshUniqueUVCount(value.editable)
				
				if GetFIntUniqueUVToleranceModule() < math.abs(EditableMeshUniqueUVCount - WRAPTARGETCAGEMESHUVCOUNT) then
					p1:fail(ErrorSourceStringsModule.Keys.CageUV_IncorrectUVCount, {
						partName = PartName,
						requiredUVCount = tostring(WRAPTARGETCAGEMESHUVCOUNT),
						actualUVCount = tostring(EditableMeshUniqueUVCount)
					})
				end
			end
		end
	end
}