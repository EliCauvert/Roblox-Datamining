local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiUsageRecorderModule = require(SduiCoreSystem.Analytics.SduiUsageRecorder)
local RecordV1ComponentUsageModule = require(SduiCoreSystem.Analytics.recordV1ComponentUsage)

return function(p1, List) --[[ Line: 18 | Named "recordV1RegisteredTemplates" ]]
	-- upvalues: SduiUsageRecorderModule (copy), RecordV1ComponentUsageModule (copy)
	if not List then return end
	if not SduiUsageRecorderModule.isTypeSamplingEnabled() and not SduiUsageRecorderModule.isParamSamplingEnabled() then return end
	for _, value in List do
		pcall(RecordV1ComponentUsageModule, p1, value)
	end
end