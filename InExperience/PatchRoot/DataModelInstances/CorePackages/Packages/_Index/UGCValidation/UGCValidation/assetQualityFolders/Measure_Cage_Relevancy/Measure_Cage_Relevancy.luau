local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCMinCageRelevancyThreshold = game:DefineFastInt("UGCMinCageRelevancyThreshold", 40)

return {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p0, p1)
		-- upvalues: UGCMinCageRelevancyThreshold (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
		local handleOuterCage = p1.aqsSummaryData.Measure_Cage_Relevancy.Handle_OuterCage
		local outerCageFaceRelevantPercent = handleOuterCage and tonumber(handleOuterCage.outer_cage_face_relevant_percent)
		
		if outerCageFaceRelevantPercent == nil then
			error("Measure_Cage_Relevancy: AQS summary missing required fields")
			
			return
		elseif outerCageFaceRelevantPercent * 100 < UGCMinCageRelevancyThreshold then
			p0:fail(errorSourceStringsModule.Keys.MeasureCageRelevancy, {
				outer_cage_face_irrelevant_percent = string.format("%.2f", 100 - outerCageFaceRelevantPercent * 100)
			})
		end
		if getFFlagUGCValidateAQScoreWarningsModule() and handleOuterCage.score ~= nil and tonumber(handleOuterCage.score) ~= 100 then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_CageRelevancy, {
				score = tostring(math.floor(tonumber(handleOuterCage.score) or 0)),
				irrelevant_percent = string.format("%.2f", 100 - (tonumber(handleOuterCage.outer_cage_face_relevant_percent) or 0) * 100)
			})
		end
	end
}