local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule = require(Parent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local GetFFlagUGCValidationAddGeometryToExportsModule = require(Parent.flags.getFFlagUGCValidationAddGeometryToExports)
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
	fflag = require(Parent.flags.getFFlagUGCValidateIsDynamicHead),
	shadowFlag = require(Parent.flags.getFFlagUGCValidationShadowIsDynamicHead),
	knownAqsUserErrors = {
		INVALID_LANDMARKS = ErrorSourceStringsModule.Keys.DynamicHeadCageMisaligned,
		NO_FACS = ErrorSourceStringsModule.Keys.DynamicHeadNOFACS,
		MISSING_CAGE_INFO = ErrorSourceStringsModule.Keys.DynamicHeadMISSINGCAGE
	},
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidationAddGeometryToExportsModule (copy), ErrorSourceStringsModule (copy), config (copy), GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local Head = if GetFFlagUGCValidationAddGeometryToExportsModule() then p2.aqsSummaryData.Measure_Dynamic_Head.Head or p2.aqsSummaryData.Measure_Dynamic_Head.Head_Geo else p2.aqsSummaryData.Measure_Dynamic_Head.Head
		
		if Head == nil then
			p1:fail(ErrorSourceStringsModule.Keys.AQSInputDataError)
			
			return
		end
		for i, value in config do
			if Head[i] ~= nil and tonumber(Head[i]) <= GetFIntUGCValidationDynamicHeadMinimumQualityPercentModule() / 100 then
				p1:fail(value)
			end
		end
		if GetFFlagUGCValidateAQScoreWarningsModule() and Head.score ~= nil and tonumber(Head.score) ~= 100 then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_DynamicHead, {
				score = tostring((math.floor(tonumber(Head.score) or 0)))
			})
		end
	end
}