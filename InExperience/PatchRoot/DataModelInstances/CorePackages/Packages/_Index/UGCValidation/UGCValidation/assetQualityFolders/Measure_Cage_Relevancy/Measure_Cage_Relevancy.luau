local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCMinCageRelevancyThreshold = game:DefineFastInt("UGCMinCageRelevancyThreshold", 10)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2)
		-- upvalues: UGCMinCageRelevancyThreshold (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local HandleOuterCage = p2.aqsSummaryData.Measure_Cage_Relevancy.Handle_OuterCage
		local Number = HandleOuterCage and tonumber(HandleOuterCage.outer_cage_face_relevant_percent)
		
		if Number == nil then
			error("Measure_Cage_Relevancy: AQS summary missing required fields")
			
			return
		end
		if Number * 100 < UGCMinCageRelevancyThreshold then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageRelevancy, {
				outer_cage_face_irrelevant_percent = string.format("%.2f", 100 - Number * 100)
			})
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and HandleOuterCage.score ~= nil and tonumber(HandleOuterCage.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageRelevancy, {
				irrelevant_percent = string.format("%.2f", 100 - (tonumber(HandleOuterCage.outer_cage_face_relevant_percent) or 0) * 100)
			})
		end
	end
}