local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCLCCageVerticesSimilarityMaximumModule = require(parent.flags.getFIntUGCLCCageVerticesSimilarityMaximum)

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry),
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = {
		validationEnumsModule.SharedDataMember.innerCagesData,
		validationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: getFIntUGCLCCageVerticesSimilarityMaximumModule (ref), UGCValidationService (ref), errorSourceStringsModule (ref)
		local var1 = getFIntUGCLCCageVerticesSimilarityMaximumModule()
		local t = {}
		
		for i, v in p2.innerCagesData do
			table.insert(t, { name = i .. " (inner cage)", data = v })
		end
		for i_1, v_1 in p2.outerCagesData do
			table.insert(t, { name = i_1 .. " (outer cage)", data = v_1 })
		end
		for i_2, v_2 in t do
			local floored = math.floor(UGCValidationService:GetEditableMeshVerticesSimilarityRate(v_2.data.editable, Vector3.new(1, 1, 1)) * 100)
			
			if var1 < floored then
				p1:fail(errorSourceStringsModule.Keys.VerticesNotCoincident_TooManySimilar, {
					cageName = v_2.name,
					percentage = tostring(floored),
					threshold = tostring(var1)
				})
			end
		end
	end
}