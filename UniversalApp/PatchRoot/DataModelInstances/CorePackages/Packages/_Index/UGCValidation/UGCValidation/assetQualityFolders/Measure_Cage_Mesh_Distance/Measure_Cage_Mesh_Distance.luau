local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceMaxCageMeshDistanceLC = game:DefineFastInt("UGCValidationCageMeshDistanceMaxCageMeshDistanceLC", 60)
local UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC = game:DefineFastInt("UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC", 30)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)

return {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2)
		-- upvalues: UGCValidationCageMeshDistanceMaxCageMeshDistanceLC (ref), errorSourceStringsModule (ref), UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
		local handleOuterCage = p2.aqsSummaryData.Measure_Cage_Mesh_Distance.Handle_OuterCage
		
		if handleOuterCage == nil or handleOuterCage.max_distance == nil or handleOuterCage.negative_sdf_percent == nil then
			error("Measure_Cage_Mesh_Distance: AQS summary missing required fields")
			
			return
		elseif UGCValidationCageMeshDistanceMaxCageMeshDistanceLC / 100 < tonumber(handleOuterCage.max_distance) then
			p1:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistance_CageTooFar, {
				max_sdf = tonumber(handleOuterCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceMaxCageMeshDistanceLC / 100
			})
		end
		if UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC < tonumber(handleOuterCage.negative_sdf_percent) * 100 then
			p1:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistance_CageInsideMesh, {
				negtiveSDFPercent = string.format("%.2f", tonumber(handleOuterCage.negative_sdf_percent) * 100)
			})
		end
		if getFFlagUGCValidateAQScoreWarningsModule() and handleOuterCage.score ~= nil and tonumber(handleOuterCage.score) ~= 100 then
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_CageMeshDistance, {
				score = tostring(math.floor(tonumber(handleOuterCage.score) or 0)),
				max_distance = handleOuterCage.max_distance or "unknown",
				negative_sdf_percent = string.format("%.2f", (tonumber(handleOuterCage.negative_sdf_percent) or 0) * 100)
			})
		end
	end
}