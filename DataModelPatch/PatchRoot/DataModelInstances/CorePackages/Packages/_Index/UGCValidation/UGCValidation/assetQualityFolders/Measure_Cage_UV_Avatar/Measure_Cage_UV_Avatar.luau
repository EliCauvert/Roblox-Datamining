local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ConstantsModule = require(Parent.Constants)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCValidateLCCagingIncorrectUVThresholdBodyPart = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThresholdBodyPart", 7)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.FULL_BODY
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityAvatar),
	run = function(p1, p2)
		-- upvalues: ConstantsModule (copy), ErrorSourceStringsModule (copy), UGCValidateLCCagingIncorrectUVThresholdBodyPart (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local MeasureCageUVAvatar = p2.aqsSummaryData.Measure_Cage_UV_Avatar
		
		for _, r15CAGEPART in ConstantsModule.R15_CAGE_PARTS do
			if MeasureCageUVAvatar[r15CAGEPART] == nil or MeasureCageUVAvatar[r15CAGEPART].incorrect_uv_count == nil then
				p1:fail(ErrorSourceStringsModule.Keys.AQSInputDataError)
			else
				if UGCValidateLCCagingIncorrectUVThresholdBodyPart < tonumber(MeasureCageUVAvatar[r15CAGEPART].incorrect_uv_count) then
					p1:fail(ErrorSourceStringsModule.Keys.MeasureCageUV, {
						cage_name = r15CAGEPART,
						incorrect_uv_count = tonumber(MeasureCageUVAvatar[r15CAGEPART].incorrect_uv_count)
					})
				end
				if GetFFlagUGCValidateAQScoreWarningsModule() and MeasureCageUVAvatar[r15CAGEPART].score ~= nil and tonumber(MeasureCageUVAvatar[r15CAGEPART].score) ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageUV, {
						score = tostring((math.floor(tonumber(MeasureCageUVAvatar[r15CAGEPART].score) or 0))),
						cage_name = r15CAGEPART,
						incorrect_uv_count = MeasureCageUVAvatar[r15CAGEPART].incorrect_uv_count or "0"
					})
				end
			end
		end
	end
}