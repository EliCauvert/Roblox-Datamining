local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationCageMeshDistanceHeadMaxCageMeshDistance = game:DefineFastInt("UGCValidationCageMeshDistanceHeadMaxCageMeshDistance", 60)
local UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold = game:DefineFastInt("UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold", 30)

return {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	fflag = require(parent.flags.getFFlagUGCValidateCageMeshDistanceHead),
	expectedAqsData = { Measure_Cage_Distance_Head = {} },
	run = function(p0, p1) --[[ line: 17 ]]
		-- upvalues: errorSourceStringsModule (ref), UGCValidationCageMeshDistanceHeadMaxCageMeshDistance (ref), UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold (ref)
		local headOuterCage = p1.aqsSummaryData.Measure_Cage_Distance_Head.Head_OuterCage
		
		if headOuterCage == nil or headOuterCage.max_distance == nil or headOuterCage.negative_sdf_percent == nil then
			p0:fail(errorSourceStringsModule.Keys.AQSInputDataError)
			
			return
		elseif UGCValidationCageMeshDistanceHeadMaxCageMeshDistance / 100 < tonumber(headOuterCage.max_distance) then
			p0:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistanceHead_CageTooFar, {
				max_sdf = tonumber(headOuterCage.max_distance),
				max_sdf_threshold = UGCValidationCageMeshDistanceHeadMaxCageMeshDistance / 100
			})
		end
		if UGCValidationCageMeshDistanceHeadMaxNegativeSDFThreshold < tonumber(headOuterCage.negative_sdf_percent) * 100 then
			p0:fail(errorSourceStringsModule.Keys.MeasureCageMeshDistanceHead_CageInsideMesh, {
				negtiveSDFPercent = tonumber(headOuterCage.negative_sdf_percent) * 100
			})
		end
	end
}