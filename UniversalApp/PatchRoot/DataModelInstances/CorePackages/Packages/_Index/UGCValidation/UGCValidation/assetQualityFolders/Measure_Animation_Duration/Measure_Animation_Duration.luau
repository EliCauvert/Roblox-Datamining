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
	fflag = function() --[[ line: 15 ]]
		-- upvalues: getEngineFeatureEngineUGCValidateEmoteAnimationExportModule (ref), getFFlagUGCValidateAQEmoteDurationModule (ref)
		return getEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and getFFlagUGCValidateAQEmoteDurationModule()
	end,
	run = function(p0, p1) --[[ line: 22 ]]
		-- upvalues: getAQEmotePartDataModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), errorSourceStringsModule (ref)
		local var7 = getAQEmotePartDataModule(p1.aqsSummaryData and p1.aqsSummaryData.Measure_Animation_Duration)
		
		if not var7 or var7.duration_seconds == nil then
			error("Can't find Measure_Animation_Duration.duration_seconds")
		end
		local durationSeconds = tonumber(var7.duration_seconds) or 0
		local var9 = getFStringUGCValidateCurveAnimationMinLengthModule.asNumber()
		local var10 = getFStringUGCValidationMaxAnimationLengthModule.asNumber()
		
		if durationSeconds <= var9 then
			p0:fail(errorSourceStringsModule.Keys.AQSFail_AnimationTooShort, {
				duration = tostring(durationSeconds),
				minLength = tostring(var9)
			})
			
			return
		elseif var10 < durationSeconds then
			p0:fail(errorSourceStringsModule.Keys.AQSFail_AnimationTooLong, {
				duration = tostring(durationSeconds),
				maxLength = tostring(var10)
			})
		end
	end
}