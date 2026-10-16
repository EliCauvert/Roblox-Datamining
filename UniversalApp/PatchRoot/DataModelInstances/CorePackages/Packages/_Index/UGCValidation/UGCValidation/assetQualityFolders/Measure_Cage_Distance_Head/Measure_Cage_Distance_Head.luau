local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceHeadMaxCageMeshDistance = game:DefineFastInt("UGCValidationCageMeshDistanceHeadMaxCageMeshDistance", 60)
local UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold = game:DefineFastInt("UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold", 30)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateCageMeshDistanceHead),
	run = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: UGCValidationCageMeshDistanceHeadMaxCageMeshDistance (copy), ErrorSourceStringsModule (copy), UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local HeadOuterCage = p2.aqsSummaryData.Measure_Cage_Distance_Head.Head_OuterCage
		
		if HeadOuterCage == nil or HeadOuterCage.max_distance == nil or HeadOuterCage.negative_sdf_percent == nil then
			error("Measure_Cage_Distance_Head: AQS summary missing required fields")
			
			return
		end
		if UGCValidationCageMeshDistanceHeadMaxCageMeshDistance / 100 < tonumber(HeadOuterCage.max_distance) then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageMeshDistanceHead_CageTooFar, {
				max_sdf = tonumber(HeadOuterCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceHeadMaxCageMeshDistance / 100
			})
		end
		if UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold < tonumber(HeadOuterCage.negative_sdf_percent) * 100 then
			p1:fail(ErrorSourceStringsModule.Keys.MeasureCageMeshDistanceHead_CageInsideMesh, {
				negtiveSDFPercent = string.format("%.2f", tonumber(HeadOuterCage.negative_sdf_percent) * 100)
			})
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and HeadOuterCage.score ~= nil and tonumber(HeadOuterCage.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageMeshDistanceHead, {
				max_distance = HeadOuterCage.max_distance or "unknown",
				negative_sdf_percent = string.format("%.2f", (tonumber(HeadOuterCage.negative_sdf_percent) or 0) * 100)
			})
		end
	end
}