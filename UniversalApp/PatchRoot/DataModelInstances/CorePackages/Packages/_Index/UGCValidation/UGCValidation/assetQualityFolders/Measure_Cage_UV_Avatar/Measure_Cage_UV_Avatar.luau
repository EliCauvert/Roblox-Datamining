local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local constantsModule = require(parent.Constants)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCValidateLCCagingIncorrectUVThresholdBodyPart = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThresholdBodyPart", 7)

return {
	categories = { validationEnumsModule.UploadCategory.FULL_BODY },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityAvatar),
	run = function(p0, p1) --[[ line: 15 ]]
		-- upvalues: constantsModule (ref), errorSourceStringsModule (ref), UGCValidateLCCagingIncorrectUVThresholdBodyPart (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
		local measureCageUVAvatar = p1.aqsSummaryData.Measure_Cage_UV_Avatar
		
		for i, v in constantsModule.R15_CAGE_PARTS do
			if measureCageUVAvatar[v] == nil or measureCageUVAvatar[v].incorrect_uv_count == nil then
				p0:fail(errorSourceStringsModule.Keys.AQSInputDataError)
			elseif UGCValidateLCCagingIncorrectUVThresholdBodyPart < tonumber(measureCageUVAvatar[v].incorrect_uv_count) then
				p0:fail(errorSourceStringsModule.Keys.MeasureCageUV, {
					cage_name = v,
					incorrect_uv_count = tonumber(measureCageUVAvatar[v].incorrect_uv_count)
				})
			end
			if getFFlagUGCValidateAQScoreWarningsModule() and measureCageUVAvatar[v].score ~= nil and tonumber(measureCageUVAvatar[v].score) ~= 100 then
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_CageUV, {
					score = tostring(math.floor(tonumber(measureCageUVAvatar[v].score) or 0)),
					cage_name = v,
					incorrect_uv_count = measureCageUVAvatar[v].incorrect_uv_count or "0"
				})
			end
		end
	end
}