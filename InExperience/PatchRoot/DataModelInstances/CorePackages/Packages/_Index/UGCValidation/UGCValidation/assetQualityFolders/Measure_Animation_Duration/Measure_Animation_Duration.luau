local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getAQEmotePartDataModule = require(parent.util.getAQEmotePartData)
local getEngineFeatureEngineUGCValidateEmoteAnimationExportModule = require(parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)
local getFFlagUGCValidateAQEmoteDurationModule = require(parent.flags.getFFlagUGCValidateAQEmoteDuration)
local getFStringUGCValidateCurveAnimationMinLengthModule = require(parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local getFStringUGCValidationMaxAnimationLengthModule = require(parent.flags.GetFStringUGCValidationMaxAnimationLength)

return {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION },
	fflag = function()
		-- upvalues: getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), getFFlagUGCValidateAQEmoteDurationModule (ref)
		return getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and getFFlagUGCValidateAQEmoteDurationModule()
	end,
	run = function(p1, p2)
		-- upvalues: getAQEmotePartDataModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), errorSourceStringsModule (ref)
		local var1 = getAQEmotePartDataModule(p2.aqsSummaryData and p2.aqsSummaryData.Measure_Animation_Duration)
		
		if not var1 or var1.duration_seconds == nil then
			error("Can't find Measure_Animation_Duration.duration_seconds")
		end
		local durationSeconds = tonumber(var1.duration_seconds) or 0
		local var2 = getFStringUGCValidateCurveAnimationMinLengthModule.asNumber()
		local var3 = getFStringUGCValidationMaxAnimationLengthModule.asNumber()
		
		if durationSeconds <= var2 then
			p1:fail(errorSourceStringsModule.Keys.AQSFail_AnimationTooShort, {
				duration = tostring(durationSeconds),
				minLength = tostring(var2)
			})
			
			return
		elseif var3 < durationSeconds then
			p1:fail(errorSourceStringsModule.Keys.AQSFail_AnimationTooLong, {
				duration = tostring(durationSeconds),
				maxLength = tostring(var3)
			})
		end
	end
}