local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCLCCageVerticesSimilarityMaximumModule = require(Parent.flags.getFIntUGCLCCageVerticesSimilarityMaximum)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.innerCagesData,
		ValidationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: GetFIntUGCLCCageVerticesSimilarityMaximumModule (copy), UGCValidationService (copy), ErrorSourceStringsModule (copy)
		local FIntUGCLCCageVerticesSimilarityMaximumModule = GetFIntUGCLCCageVerticesSimilarityMaximumModule()
		local List = {}
		
		for i, Data in p2.innerCagesData do
			table.insert(List, { name = i .. " (inner cage)", data = Data })
		end
		for i1, Data1 in p2.outerCagesData do
			table.insert(List, { name = i1 .. " (outer cage)", data = Data1 })
		end
		for _, value in List do
			local Floored = math.floor(UGCValidationService:GetEditableMeshVerticesSimilarityRate(value.data.editable, vector.create(1, 1, 1)) * 100)
			
			if FIntUGCLCCageVerticesSimilarityMaximumModule < Floored then
				p1:fail(ErrorSourceStringsModule.Keys.VerticesNotCoincident_TooManySimilar, {
					cageName = value.name,
					percentage = tostring(Floored),
					threshold = tostring(FIntUGCLCCageVerticesSimilarityMaximumModule)
				})
			end
		end
	end
}