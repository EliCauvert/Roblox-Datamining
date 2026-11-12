local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ReadAQSummaryNumberModule = require(Parent.util.readAQSummaryNumber)
local GetFFlagUGCValidateAQDynamicHeadMLHybridNewFacsMessagesModule = require(Parent.flags.getFFlagUGCValidateAQDynamicHeadMLHybridNewFacsMessages)
local GetFIntUGCValidationDynamicHeadMLEyesMinScorePerMillionModule = require(Parent.flags.getFIntUGCValidationDynamicHeadMLEyesMinScorePerMillion)
local GetFIntUGCValidationDynamicHeadMLMouthMinScorePerMillionModule = require(Parent.flags.getFIntUGCValidationDynamicHeadMLMouthMinScorePerMillion)
local GetFIntUGCValidationDynamicHeadMLAnimationMinScorePerMillionModule = require(Parent.flags.getFIntUGCValidationDynamicHeadMLAnimationMinScorePerMillion)
local GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule = require(Parent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local config = {
	step2a_left_eye_landmark_valid = ErrorSourceStringsModule.Keys.DynamicHeadCageMisalignedLeftEye,
	step2a_right_eye_landmark_valid = ErrorSourceStringsModule.Keys.DynamicHeadCageMisalignedRightEye,
	step2a_mouth_landmark_valid = ErrorSourceStringsModule.Keys.DynamicHeadCageMisalignedMouth
}
local config1 = {
	step2b_deformation_left_eye_close = ErrorSourceStringsModule.Keys.DynamicHeadLeftEyeNotClose,
	step2b_deformation_right_eye_close = ErrorSourceStringsModule.Keys.DynamicHeadRightEyeNotClose,
	step2b_deformation_mouth_open = ErrorSourceStringsModule.Keys.DynamicHeadMouthNotOpen,
	step2b_deformation_happy = ErrorSourceStringsModule.Keys.DynamicHeadHappyNotShown,
	step2b_deformation_sad = ErrorSourceStringsModule.Keys.DynamicHeadSadNotShown
}
local config2 = {
	step2b_deformation_left_eye_close = ErrorSourceStringsModule.Keys.FacsDeformation_LeftEyeNotClose,
	step2b_deformation_right_eye_close = ErrorSourceStringsModule.Keys.FacsDeformation_RightEyeNotClose,
	step2b_deformation_mouth_open = ErrorSourceStringsModule.Keys.FacsDeformation_MouthNotOpen,
	step2b_deformation_happy = ErrorSourceStringsModule.Keys.FacsDeformation_HappyNotShown,
	step2b_deformation_sad = ErrorSourceStringsModule.Keys.FacsDeformation_SadNotShown
}

local function _(p1, p2)
	local v1 = p1[`{p2}_status`]
	
	if v1 ~= "completed" then
		error(`Measure_Dynamic_Head_ML_Hybrid: {p2} is {tostring(v1)}, expected completed. ` .. "A threshold here may be looser than the asset-quality cutoff.")
	end
end

local _ = function(p1, p2: number): boolean
	return p2 / 1000000 <= p1
end

local list = {
	function(p1, p2): boolean
		-- upvalues: ReadAQSummaryNumberModule (copy), GetFIntUGCValidationDynamicHeadMLEyesMinScorePerMillionModule (copy), ErrorSourceStringsModule (copy), GetFIntUGCValidationDynamicHeadMLMouthMinScorePerMillionModule (copy)
		local Step1Status = p2.step1_status
		
		if Step1Status ~= "completed" then
			error(`Measure_Dynamic_Head_ML_Hybrid: step1 is {tostring(Step1Status)}, expected completed. ` .. "A threshold here may be looser than the asset-quality cutoff.")
		end
		local Flag = true
		
		if ReadAQSummaryNumberModule(p2, "step1_has_eyes_score", "Measure_Dynamic_Head_ML_Hybrid", 0, 1) < GetFIntUGCValidationDynamicHeadMLEyesMinScorePerMillionModule() / 1000000 then
			p1:fail(ErrorSourceStringsModule.Keys.FacialFeaturePresence_EyesMissing)
			Flag = false
		end
		if ReadAQSummaryNumberModule(p2, "step1_has_mouth_score", "Measure_Dynamic_Head_ML_Hybrid", 0, 1) < GetFIntUGCValidationDynamicHeadMLMouthMinScorePerMillionModule() / 1000000 then
			p1:fail(ErrorSourceStringsModule.Keys.FacialFeaturePresence_MouthMissing)
			Flag = false
		end
		return Flag
	end,
	function(p1, p2): boolean
		-- upvalues: config (copy)
		local Step2aStatus = p2.step2a_status
		
		if Step2aStatus ~= "completed" then
			error(`Measure_Dynamic_Head_ML_Hybrid: step2a is {tostring(Step2aStatus)}, expected completed. ` .. "A threshold here may be looser than the asset-quality cutoff.")
		end
		local Flag = true
		
		for i, value in config do
			local v1 = p2[i]
			
			if v1 == "0" then
				p1:fail(value)
				Flag = false
			elseif v1 ~= "1" then
				error(`Measure_Dynamic_Head_ML_Hybrid: {i} is not "1" or "0": {tostring(v1)}`)
			end
		end
		return Flag
	end,
	function(p3, p4): boolean
		-- upvalues: GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule (copy), GetFFlagUGCValidateAQDynamicHeadMLHybridNewFacsMessagesModule (copy), config2 (copy), config1 (copy), ReadAQSummaryNumberModule (copy)
		local Step2bStatus = p4.step2b_status
		
		if Step2bStatus ~= "completed" then
			error(`Measure_Dynamic_Head_ML_Hybrid: step2b is {tostring(Step2bStatus)}, expected completed. ` .. "A threshold here may be looser than the asset-quality cutoff.")
		end
		local Flag = true
		local FIntUGCValidationDynamicHeadMinimumQualityPercentModuleRatio = GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule() / 100
		local Config = if GetFFlagUGCValidateAQDynamicHeadMLHybridNewFacsMessagesModule() then config2 else config1
		for i, value in Config do
			if ReadAQSummaryNumberModule(p4, i, "Measure_Dynamic_Head_ML_Hybrid") <= FIntUGCValidationDynamicHeadMinimumQualityPercentModuleRatio then
				p3:fail(value)
				Flag = false
			end
		end
		return Flag
	end,
	function(p5, p6): boolean
		-- upvalues: ReadAQSummaryNumberModule (copy), GetFIntUGCValidationDynamicHeadMLAnimationMinScorePerMillionModule (copy), ErrorSourceStringsModule (copy)
		local Step3Status = p6.step3_status
		
		if Step3Status ~= "completed" then
			error(`Measure_Dynamic_Head_ML_Hybrid: step3 is {tostring(Step3Status)}, expected completed. ` .. "A threshold here may be looser than the asset-quality cutoff.")
		end
		if ReadAQSummaryNumberModule(p6, "step3_animation_pass_score", "Measure_Dynamic_Head_ML_Hybrid", 0, 1) >= GetFIntUGCValidationDynamicHeadMLAnimationMinScorePerMillionModule() / 1000000 then
			return true
		else
			p5:fail(ErrorSourceStringsModule.Keys.RenderedAnimation_RequiredExpressionsMissing)
			
			return false
		end
	end
}

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQDynamicHeadMLHybrid),
	shadowFlag = require(Parent.flags.getFFlagUGCValidateAQDynamicHeadMLHybridShadow),
	knownAqsUserErrors = {
		MISSING_CAGE_INFO = ErrorSourceStringsModule.Keys.DynamicHeadMISSINGCAGE,
		NO_FACS = ErrorSourceStringsModule.Keys.DynamicHeadNOFACS
	},
	run = function(p5, p6)
		-- upvalues: list (copy)
		local MeasureDynamicHeadMLHybrid = p6.aqsSummaryData.Measure_Dynamic_Head_ML_Hybrid
		
		if MeasureDynamicHeadMLHybrid == nil then
			error("Measure_Dynamic_Head_ML_Hybrid: missing AQS summary data")
		end
		local Count = 0
		
		for i, value in MeasureDynamicHeadMLHybrid do
			if i ~= "measurement_score" then
				Count += 1
				
				for _, value1 in list do
					if not value1(p5, value) then break end
				end
			end
		end
		if Count == 0 then
			error("Measure_Dynamic_Head_ML_Hybrid: AQS summary has no head mesh")
		end
	end
}