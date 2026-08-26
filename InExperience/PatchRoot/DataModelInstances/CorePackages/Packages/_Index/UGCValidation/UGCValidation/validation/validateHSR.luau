local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local _ = require(parent.util.Types)

return function(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local currentTime = tick()
	
	if p2.bypassFlags and p2.bypassFlags.skipValidateHSR then
		return true
	end
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	local var1 = failureReasonsAccumulatorModule.new()
	
	for i, v in descendants do
		if v:IsA("BaseWrap") and not v:IsHSRReady() then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateHSR_HSRDataNotReady, nil, p2)
			var1:updateReasons(false, {
				`Missing HSR data for {v:GetFullName()}. Please, try again.`
			})
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p2)
	
	return var1:getFinalResults()
end