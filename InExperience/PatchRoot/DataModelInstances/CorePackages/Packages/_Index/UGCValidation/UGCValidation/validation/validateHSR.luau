local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local _ = require(parent.util.Types)

return function(p0, p1)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local currentTime = tick()
	
	if p1.bypassFlags and p1.bypassFlags.skipValidateHSR then
		return true
	end
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local var4 = failureReasonsAccumulatorModule.new()
	
	for i, v in descendants do
		if v:IsA("BaseWrap") and not v:IsHSRReady() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_HSRDataNotReady, nil, p1)
			var4:updateReasons(false, {
				`Missing HSR data for {v:GetFullName()}. Please, try again.`
			})
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p1)
	
	return var4:getFinalResults()
end