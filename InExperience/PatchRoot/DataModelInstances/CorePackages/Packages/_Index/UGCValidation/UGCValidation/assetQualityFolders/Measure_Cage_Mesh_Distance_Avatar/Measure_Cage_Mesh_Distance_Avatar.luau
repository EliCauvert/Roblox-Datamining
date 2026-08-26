local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar = game:DefineFastInt("UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar", 60)
local UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar = game:DefineFastInt("UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar", 30)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)

return {
	categories = { validationEnumsModule.UploadCategory.FULL_BODY },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityAvatar),
	run = function(p1, p2)
		-- upvalues: UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar (ref), errorSourceStringsModule (ref), UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
		local fullBodyCage = p2.aqsSummaryData.Measure_Cage_Mesh_Distance_Avatar.full_body_cage
		
		if fullBodyCage == nil or fullBodyCage.max_distance == nil or fullBodyCage.negative_sdf_percent == nil then
			error("Measure_Cage_Mesh_Distance_Avatar: AQS summary missing required fields")
			
			return
		elseif UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar / 100 < tonumber(fullBodyCage.max_distance) then
			p1:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistanceAvatar_CageTooFar, {
				max_sdf = tonumber(fullBodyCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceMaxCageMeshDistanceAvatar / 100
			})
		end
		if UGCValidationCageMeshDistanceMaxNegativeSDFThresholdAvatar < tonumber(fullBodyCage.negative_sdf_percent) * 100 then
			p1:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistanceAvatar_CageInsideMesh, {
				negtiveSDFPercent = string.format("%.2f", tonumber(fullBodyCage.negative_sdf_percent) * 100)
			})
		end
		if getFFlagUGCValidateAQScoreWarningsModule() and fullBodyCage.score ~= nil and tonumber(fullBodyCage.score) ~= 100 then
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_CageMeshDistanceAvatar, {
				score = tostring(math.floor(tonumber(fullBodyCage.score) or 0)),
				max_distance = fullBodyCage.max_distance or "unknown",
				negative_sdf_percent = string.format("%.2f", (tonumber(fullBodyCage.negative_sdf_percent) or 0) * 100)
			})
		end
	end
}