local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiUsageRecorderModule = require(sduiCoreSystem.Analytics.SduiUsageRecorder)
local recordV1ComponentUsageModule = require(sduiCoreSystem.Analytics.recordV1ComponentUsage)

return function(p0, p1)
	-- upvalues: sduiUsageRecorderModule (ref), recordV1ComponentUsageModule (ref)
	if not p1 then return end
	if not sduiUsageRecorderModule.isTypeSamplingEnabled() and not sduiUsageRecorderModule.isParamSamplingEnabled() then return end
	for i, v in p1 do
		pcall(recordV1ComponentUsageModule, p0, v)
	end
end