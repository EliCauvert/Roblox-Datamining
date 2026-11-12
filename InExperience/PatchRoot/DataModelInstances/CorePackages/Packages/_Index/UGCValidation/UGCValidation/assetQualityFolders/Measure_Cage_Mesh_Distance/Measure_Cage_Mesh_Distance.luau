local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceMaxCageMeshDistanceLC = game:DefineFastInt("UGCValidationCageMeshDistanceMaxCageMeshDistanceLC", 60)
local UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC = game:DefineFastInt("UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC", 30)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2)
		-- upvalues: UGCValidationCageMeshDistanceMaxCageMeshDistanceLC (copy), ErrorSourceStringsModule (copy), UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local HandleOuterCage = p2.aqsSummaryData.Measure_Cage_Mesh_Distance.Handle_OuterCage
		
		if HandleOuterCage == nil or HandleOuterCage.max_distance == nil or HandleOuterCage.negative_sdf_percent == nil then
			error("Measure_Cage_Mesh_Distance: AQS summary missing required fields")
			
			return
		end
		if UGCValidationCageMeshDistanceMaxCageMeshDistanceLC / 100 < tonumber(HandleOuterCage.max_distance) then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageMeshDistance_CageTooFar, {
				max_sdf = tonumber(HandleOuterCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceMaxCageMeshDistanceLC / 100
			})
		end
		if UGCValidationCageMeshDistanceMaxNegativeSDFThresholdLC < tonumber(HandleOuterCage.negative_sdf_percent) * 100 then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageMeshDistance_CageInsideMesh, {
				negtiveSDFPercent = string.format("%.2f", tonumber(HandleOuterCage.negative_sdf_percent) * 100)
			})
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and HandleOuterCage.score ~= nil and tonumber(HandleOuterCage.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageMeshDistance, {
				max_distance = HandleOuterCage.max_distance or "unknown",
				negative_sdf_percent = string.format("%.2f", (tonumber(HandleOuterCage.negative_sdf_percent) or 0) * 100)
			})
		end
	end
}