local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetAQEmotePartDataModule = require(Parent.util.getAQEmotePartData)
local GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule = require(Parent.flags.getEngineFeatureEngineUGCValidateEmoteAnimationExport)
local GetFFlagUGCValidateAQEmoteDurationModule = require(Parent.flags.getFFlagUGCValidateAQEmoteDuration)
local GetFStringUGCValidateCurveAnimationMinLengthModule = require(Parent.flags.GetFStringUGCValidateCurveAnimationMinLength)
local GetFStringUGCValidationMaxAnimationLengthModule = require(Parent.flags.GetFStringUGCValidationMaxAnimationLength)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.EMOTE_ANIMATION
	},
	fflag = function()
		-- upvalues: GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule (copy), GetFFlagUGCValidateAQEmoteDurationModule (copy)
		return GetEngineFeatureEngineUGCValidateEmoteAnimationExportModule() and GetFFlagUGCValidateAQEmoteDurationModule()
	end,
	run = function(p1, p2)
		-- upvalues: GetAQEmotePartDataModule (copy), GetFStringUGCValidateCurveAnimationMinLengthModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), ErrorSourceStringsModule (copy)
		local AQEmotePartDataModule = GetAQEmotePartDataModule(p2.aqsSummaryData and p2.aqsSummaryData.Measure_Animation_Duration)
		
		if not AQEmotePartDataModule or AQEmotePartDataModule.duration_seconds == nil then
			error("Can't find Measure_Animation_Duration.duration_seconds")
		end
		local Number: number = tonumber(AQEmotePartDataModule.duration_seconds) or 0
		local AsNumberResult = GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber()
		local AsNumberResult1 = GetFStringUGCValidationMaxAnimationLengthModule.asNumber()
		
		if Number <= AsNumberResult then
			p1:fail(ErrorSourceStringsModule.Keys.AQSFail_AnimationTooShort, {
				duration = tostring(Number),
				minLength = tostring(AsNumberResult)
			})
			
			return
		end
		if AsNumberResult1 < Number then
			p1:fail(ErrorSourceStringsModule.Keys.AQSFail_AnimationTooLong, {
				duration = tostring(Number),
				maxLength = tostring(AsNumberResult1)
			})
		end
	end
}