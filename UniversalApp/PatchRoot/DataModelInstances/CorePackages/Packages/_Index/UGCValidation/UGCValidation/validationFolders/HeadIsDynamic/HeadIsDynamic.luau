local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFIntUGCValidationDynamicHeadMinimumQualityPercentModule = require(parent.flags.getFIntUGCValidationDynamicHeadMinimumQualityPercent)
local getFFlagUGCValidationAddGeometryToExportsModule = require(parent.flags.getFFlagUGCValidationAddGeometryToExports)
local t = {
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	fflag = require(parent.flags.getFFlagUGCValidateIsDynamicHead),
	shadowFlag = require(parent.flags.getFFlagUGCValidationShadowIsDynamicHead),
	expectedAqsData = { Measure_Dynamic_Head = {} },
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

function t.run(p0, p1) --[[ line: 33 ]]
	-- upvalues: getFFlagUGCValidationAddGeometryToExportsModule (ref), errorSourceStringsModule (ref), t_1 (ref), getFIntUGCValidationDynamicHeadMinimumQualityPercentModule (ref)
	local _ = nil
	local var6 = if getFFlagUGCValidationAddGeometryToExportsModule() then p1.aqsSummaryData.Measure_Dynamic_Head.Head or p1.aqsSummaryData.Measure_Dynamic_Head.Head_Geo else p1.aqsSummaryData.Measure_Dynamic_Head.Head
	
	if var6 == nil then
		p0:fail(errorSourceStringsModule.Keys.AQSInputDataError)
		
		return
	end
	for i, v in t_1 do
		if var6[i] ~= nil and tonumber(var6[i]) <= getFIntUGCValidationDynamicHeadMinimumQualityPercentModule() / 100 then
			p0:fail(v)
		end
	end
end

return t