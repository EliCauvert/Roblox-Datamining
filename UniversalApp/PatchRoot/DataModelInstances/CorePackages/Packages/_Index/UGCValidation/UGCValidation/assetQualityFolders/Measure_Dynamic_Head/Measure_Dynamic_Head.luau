local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidationDynamicHeadMinimumQualityPercentModule = require(parent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local getFFlagUGCValidationAddGeometryToExportsModule = require(parent.flags.getFFlagUGCValidationAddGeometryToExports)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local t = {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	fflag = require(parent.flags.getFFlagUGCValidateIsDynamicHead),
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
	-- upvalues: getFFlagUGCValidationAddGeometryToExportsModule (ref), t_1 (ref), getFIntUGCValidationDynamicHeadMinimumQualityPercentModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref), errorSourceStringsModule (ref)
	local _ = nil
	local var1 = if getFFlagUGCValidationAddGeometryToExportsModule() then p2.aqsSummaryData.Measure_Dynamic_Head.Head or p2.aqsSummaryData.Measure_Dynamic_Head.Head_Geo else p2.aqsSummaryData.Measure_Dynamic_Head.Head
	
	if var1 == nil then
		error("Measure_Dynamic_Head: AQS summary missing required fields")
		
		return
	end
	for i, v in t_1 do
		if var1[i] ~= nil and tonumber(var1[i]) <= getFIntUGCValidationDynamicHeadMinimumQualityPercentModule() / 100 then
			p1:fail(v)
		end
	end
	if getFFlagUGCValidateAQScoreWarningsModule() and var1.score ~= nil and tonumber(var1.score) ~= 100 then
		p1:warn(errorSourceStringsModule.Keys.AQSWarn_DynamicHead, { score = tostring(math.floor(tonumber(var1.score) or 0)) })
	end
end

return t