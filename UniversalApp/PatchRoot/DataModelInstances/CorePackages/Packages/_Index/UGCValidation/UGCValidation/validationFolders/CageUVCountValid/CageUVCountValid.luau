local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUniqueUVToleranceModule = require(parent.flags.getFIntUniqueUVTolerance)

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
		-- upvalues: constantsModule (ref), UGCValidationService (ref), getFIntUniqueUVToleranceModule (ref), errorSourceStringsModule (ref)
		for i, v in p2.outerCagesData do
			local var1 = constantsModule.WRAP_TARGET_CAGE_MESH_UV_COUNTS[i]
			
			if var1 then
				local editable = UGCValidationService:CalculateEditableMeshUniqueUVCount(v.editable)
				
				if getFIntUniqueUVToleranceModule() < math.abs(editable - var1) then
					p1:fail(errorSourceStringsModule.Keys.CageUV_IncorrectUVCount, {
						partName = i,
						requiredUVCount = tostring(var1),
						actualUVCount = tostring(editable)
					})
				end
			end
		end
	end
}