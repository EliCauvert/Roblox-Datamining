local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar = game:DefineFastInt("UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar", 60)
local UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar = game:DefineFastInt("UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar", 30)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.FULL_BODY
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityAvatar),
	run = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar (copy), ErrorSourceStringsModule (copy), UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local FullBodyCage = p2.aqsSummaryData.Measure_Cage_Mesh_Distance_Avatar.full_body_cage
		
		if FullBodyCage == nil or FullBodyCage.max_distance == nil or FullBodyCage.negative_sdf_percent == nil then
			error("Measure_Cage_Mesh_Distance_Avatar: AQS summary missing required fields")
			
			return
		end
		if UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar / 100 < tonumber(FullBodyCage.max_distance) then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageMeshDistanceAvatar_CageTooFar, {
				max_sdf = tonumber(FullBodyCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar / 100
			})
		end
		if UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar < tonumber(FullBodyCage.negative_sdf_percent) * 100 then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageMeshDistanceAvatar_CageInsideMesh, {
				negtiveSDFPercent = string.format("%.2f", tonumber(FullBodyCage.negative_sdf_percent) * 100)
			})
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and FullBodyCage.score ~= nil and tonumber(FullBodyCage.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageMeshDistanceAvatar, {
				max_distance = FullBodyCage.max_distance or "unknown",
				negative_sdf_percent = string.format("%.2f", (tonumber(FullBodyCage.negative_sdf_percent) or 0) * 100)
			})
		end
	end
}