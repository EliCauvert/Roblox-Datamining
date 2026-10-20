local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule = require(Parent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local config = {
	left_eye_close = ErrorSourceStringsModule.Keys.DynamicHeadLeftEyeNotClose,
	right_eye_close = ErrorSourceStringsModule.Keys.DynamicHeadRightEyeNotClose,
	mouth_open = ErrorSourceStringsModule.Keys.DynamicHeadMouthNotOpen,
	is_happy = ErrorSourceStringsModule.Keys.DynamicHeadHappyNotShown,
	is_sad = ErrorSourceStringsModule.Keys.DynamicHeadSadNotShown
}

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.DYNAMIC_HEAD
	},
	shadowFlag = require(Parent.flags.getFFlagUGCValidationShadowIsDynamicHead),
	knownAqsUserErrors = {
		INVALID_LANDMARKS = ErrorSourceStringsModule.Keys.DynamicHeadCageMisaligned,
		NO_FACS = ErrorSourceStringsModule.Keys.DynamicHeadNOFACS,
		MISSING_CAGE_INFO = ErrorSourceStringsModule.Keys.DynamicHeadMISSINGCAGE
	},
	run = function(p1, p2)
		-- upvalues: config (copy), GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy), ErrorSourceStringsModule (copy)
		local Head = p2.aqsSummaryData.Measure_Dynamic_Head.Head or p2.aqsSummaryData.Measure_Dynamic_Head.Head_Geo
		
		if Head == nil then
			error("Measure_Dynamic_Head: AQS summary missing required fields")
			
			return
		end
		for i, value in config do
			if Head[i] ~= nil and tonumber(Head[i]) <= GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule() / 100 then
				p1:fail(value)
			end
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and Head.score ~= nil and tonumber(Head.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_DynamicHead, {
				left_eye_close = string.format("%.2f", tonumber(Head.left_eye_close) or 0),
				right_eye_close = string.format("%.2f", tonumber(Head.right_eye_close) or 0),
				mouth_open = string.format("%.2f", tonumber(Head.mouth_open) or 0),
				is_happy = string.format("%.2f", tonumber(Head.is_happy) or 0),
				is_sad = string.format("%.2f", tonumber(Head.is_sad) or 0)
			})
		end
	end
}