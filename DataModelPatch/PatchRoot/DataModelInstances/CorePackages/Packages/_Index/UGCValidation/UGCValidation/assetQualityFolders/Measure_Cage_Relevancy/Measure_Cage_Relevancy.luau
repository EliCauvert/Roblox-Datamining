local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCMinCageRelevancyThreshold = game:DefineFastInt("UGCMinCageRelevancyThreshold", 40)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.LAYERED_CLOTHING
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy), UGCMinCageRelevancyThreshold (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local HandleOuterCage = p2.aqsSummaryData.Measure_Cage_Relevancy.Handle_OuterCage
		local Number = HandleOuterCage and tonumber(HandleOuterCage.outer_cage_face_relevant_percent)
		
		if Number == nil then
			p1:fail(ErrorSourceStringsModule.Keys.AQSInputDataError)
			
			return
		end
		if Number * 100 < UGCMinCageRelevancyThreshold then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageRelevancy, {
				outer_cage_face_irrelevant_percent = string.format("%.2f", 100 - Number * 100)
			})
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and HandleOuterCage.score ~= nil and tonumber(HandleOuterCage.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageRelevancy, {
				score = tostring((math.floor(tonumber(HandleOuterCage.score) or 0))),
				irrelevant_percent = string.format("%.2f", 100 - (tonumber(HandleOuterCage.outer_cage_face_relevant_percent) or 0) * 100)
			})
		end
	end
}