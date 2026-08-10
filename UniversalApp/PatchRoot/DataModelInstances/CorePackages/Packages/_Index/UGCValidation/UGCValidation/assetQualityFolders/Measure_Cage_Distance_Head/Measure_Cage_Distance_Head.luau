local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceHeadMaxCageMeshDistance = game:DefineFastInt("UGCValidationCageMeshDistanceHeadMaxCageMeshDistance", 60)
local UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold = game:DefineFastInt("UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold", 30)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)

return {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	fflag = require(parent.flags.getFFlagUGCValidateCageMeshDistanceHead),
	run = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: UGCValidationCageMeshDistanceHeadMaxCageMeshDistance (ref), errorSourceStringsModule (ref), UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
		local headOuterCage = p1.aqsSummaryData.Measure_Cage_Distance_Head.Head_OuterCage
		
		if headOuterCage == nil or headOuterCage.max_distance == nil or headOuterCage.negative_sdf_percent == nil then
			error("Measure_Cage_Distance_Head: AQS summary missing required fields")
			
			return
		elseif UGCValidationCageMeshDistanceHeadMaxCageMeshDistance / 100 < tonumber(headOuterCage.max_distance) then
			p0:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistanceHead_CageTooFar, {
				max_sdf = tonumber(headOuterCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceHeadMaxCageMeshDistance / 100
			})
		end
		if UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold < tonumber(headOuterCage.negative_sdf_percent) * 100 then
			p0:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistanceHead_CageInsideMesh, {
				negtiveSDFPercent = string.format("%.2f", tonumber(headOuterCage.negative_sdf_percent) * 100)
			})
		end
		if getFFlagUGCValidateAQScoreWarningsModule() and headOuterCage.score ~= nil and tonumber(headOuterCage.score) ~= 100 then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_CageMeshDistanceHead, {
				score = tostring(math.floor(tonumber(headOuterCage.score) or 0)),
				max_distance = headOuterCage.max_distance or "unknown",
				negative_sdf_percent = string.format("%.2f", (tonumber(headOuterCage.negative_sdf_percent) or 0) * 100)
			})
		end
	end
}