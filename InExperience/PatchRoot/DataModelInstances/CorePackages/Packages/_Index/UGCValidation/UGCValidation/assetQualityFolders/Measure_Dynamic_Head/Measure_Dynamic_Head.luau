local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidationDynamicHeadMinimumQualityPercentModule = require(parent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local t = {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	shadowFlag = require(parent.flags.getFFlagUGCValidationShadowIsDynamicHead),
	knownAqsUserErrors = {
		INVALID_LANDMARKS = errorSourceStringsModule.Keys.DynamicHeadCageMisaligned,
		NO_FACS = errorSourceStringsModule.Keys.DynamicHeadNOFACS,
		MISSING_CAGE_INFO = errorSourceStringsModule.Keys.DynamicHeadMISSINGCAGE
	}
}
local t_1 = {
	left_eye_close = errorSourceStringsModule.Keys.DynamicHeadLeftEyeNotClose,
	right_eye_close = errorSourceStringsModule.Keys.DynamicHeadRightEyeNotClose,
	mouth_open = errorSourceStringsModule.Keys.DynamicHeadMouthNotOpen,
	is_happy = errorSourceStringsModule.Keys.DynamicHeadHappyNotShown,
	is_sad = errorSourceStringsModule.Keys.DynamicHeadSadNotShown
}

function t.run(p1, p2)
	-- upvalues: t_1 (ref), getFIntUGCValidationDynamicHeadMinimumQualityPercentModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref), errorSourceStringsModule (ref)
	local head = p2.aqsSummaryData.Measure_Dynamic_Head.Head or p2.aqsSummaryData.Measure_Dynamic_Head.Head_Geo
	
	if head == nil then
		error("Measure_Dynamic_Head: AQS summary missing required fields")
		
		return
	end
	for i, v in t_1 do
		if head[i] ~= nil and tonumber(head[i]) <= getFIntUGCValidationDynamicHeadMinimumQualityPercentModule() / 100 then
			p1:fail(v)
		end
	end
	if getFFlagUGCValidateAQScoreWarningsModule() and head.score ~= nil and tonumber(head.score) ~= 100 then
		p1:warn(errorSourceStringsModule.Keys.AQSWarn_DynamicHead, {
			left_eye_close = string.format("%.2f", tonumber(head.left_eye_close) or 0),
			right_eye_close = string.format("%.2f", tonumber(head.right_eye_close) or 0),
			mouth_open = string.format("%.2f", tonumber(head.mouth_open) or 0),
			is_happy = string.format("%.2f", tonumber(head.is_happy) or 0),
			is_sad = string.format("%.2f", tonumber(head.is_sad) or 0)
		})
	end
end

return t