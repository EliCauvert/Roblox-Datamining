local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local _ = require(Parent.util.Types)

return function(Object, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	
	if p1.bypassFlags and p1.bypassFlags.skipValidateHSR then
		return true
	end
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, BaseWrap in Descendants do
		if BaseWrap:IsA("BaseWrap") and not BaseWrap:IsHSRReady() then
			AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateHSR_HSRDataNotReady, nil, p1)
			NewFailureReasonsAccumulator:updateReasons(false, {
				`Missing HSR data for {BaseWrap:GetFullName()}. Please, try again.`
			})
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end