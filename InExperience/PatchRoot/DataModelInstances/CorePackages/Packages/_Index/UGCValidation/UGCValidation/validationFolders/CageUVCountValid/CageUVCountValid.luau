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
	run = function(p0, p1) --[[ line: 38 ]]
		-- upvalues: constantsModule (ref), UGCValidationService (ref), getFIntUniqueUVToleranceModule (ref), errorSourceStringsModule (ref)
		for i, v in p1.outerCagesData do
			local var5 = constantsModule.WRAP_TARGET_CAGE_MESH_UV_COUNTS[i]
			
			if var5 then
				local editable = UGCValidationService:CalculateEditableMeshUniqueUVCount(v.editable)
				
				if getFIntUniqueUVToleranceModule() < math.abs(editable - var5) then
					p0:fail(errorSourceStringsModule.Keys.CageUV_IncorrectUVCount, {
						partName = i,
						requiredUVCount = tostring(var5),
						actualUVCount = tostring(editable)
					})
				end
			end
		end
	end
}