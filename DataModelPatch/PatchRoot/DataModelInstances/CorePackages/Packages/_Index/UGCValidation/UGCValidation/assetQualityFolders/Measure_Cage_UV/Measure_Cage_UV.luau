local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local UGCValidateLCCagingIncorrectUVThreshold = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThreshold", 100)
local Cage_names = { "Handle_InnerCage", "Handle_OuterCage" }

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.LAYERED_CLOTHING
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2)
		-- upvalues: Cage_names (copy), ErrorSourceStringsModule (copy), UGCValidateLCCagingIncorrectUVThreshold (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy)
		local MeasureCageUV = p2.aqsSummaryData.Measure_Cage_UV
		
		for _, cageName in Cage_names do
			if MeasureCageUV[cageName] == nil or MeasureCageUV[cageName].incorrect_uv_count == nil then
				p1:fail(ErrorSourceStringsModule.Keys.AQSInputDataError)
			else
				if UGCValidateLCCagingIncorrectUVThreshold < tonumber(MeasureCageUV[cageName].incorrect_uv_count) then
					p1:fail(ErrorSourceStringsModule.Keys.MeasureCageUV, {
						cage_name = cageName,
						incorrect_uv_count = tonumber(MeasureCageUV[cageName].incorrect_uv_count)
					})
				end
				if GetFFlagUGCValidateAQScoreWarningsModule() and MeasureCageUV[cageName].score ~= nil and tonumber(MeasureCageUV[cageName].score) ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageUV, {
						score = tostring((math.floor(tonumber(MeasureCageUV[cageName].score) or 0))),
						cage_name = cageName,
						incorrect_uv_count = MeasureCageUV[cageName].incorrect_uv_count or "0"
					})
				end
			end
		end
	end
}