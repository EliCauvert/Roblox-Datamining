local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local sduiUsageRecorderModule = require(sduiCoreSystem.Analytics.SduiUsageRecorder)
local recordV1ComponentUsageModule = require(sduiCoreSystem.Analytics.recordV1ComponentUsage)

return function(p1, p2)
	-- upvalues: sduiUsageRecorderModule (ref), recordV1ComponentUsageModule (ref)
	if not p2 then return end
	if not sduiUsageRecorderModule.isTypeSamplingEnabled() and not sduiUsageRecorderModule.isParamSamplingEnabled() then return end
	for i, v in p2 do
		pcall(recordV1ComponentUsageModule, p1, v)
	end
end