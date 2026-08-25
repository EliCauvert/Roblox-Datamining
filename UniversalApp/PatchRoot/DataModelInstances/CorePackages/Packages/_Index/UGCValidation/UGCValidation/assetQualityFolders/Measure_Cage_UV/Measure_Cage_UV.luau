local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCValidateLCCagingIncorrectUVThreshold = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThreshold", 100)
local t = {
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityLC)
}
local list = { "Handle_InnerCage", "Handle_OuterCage" }

function t.run(p0, p1)
	-- upvalues: list (ref), UGCValidateLCCagingIncorrectUVThreshold (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref)
	local measureCageUV = p1.aqsSummaryData.Measure_Cage_UV
	
	if measureCageUV == nil then
		error("Measure_Cage_UV: AQS summary data is nil")
	end
	for i, v in list do
		if measureCageUV[v] == nil or measureCageUV[v].incorrect_uv_count == nil then
			error("Measure_Cage_UV: AQS summary missing required fields for cage " .. v)
		elseif UGCValidateLCCagingIncorrectUVThreshold < tonumber(measureCageUV[v].incorrect_uv_count) then
			p0:fail(errorSourceStringsModule.Keys.MeasureCageUV, {
				cage_name = v,
				incorrect_uv_count = tonumber(measureCageUV[v].incorrect_uv_count)
			})
		end
		if getFFlagUGCValidateAQScoreWarningsModule() and measureCageUV[v].score ~= nil and tonumber(measureCageUV[v].score) ~= 100 then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_CageUV, {
				score = tostring(math.floor(tonumber(measureCageUV[v].score) or 0)),
				cage_name = v,
				incorrect_uv_count = measureCageUV[v].incorrect_uv_count or "0"
			})
		end
	end
end

return t