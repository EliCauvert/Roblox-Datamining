local GetStepGridPositionModule = require(script.Parent.getStepGridPosition)

return function(Value1: number, p1, p2, p3, p4): number
	-- upvalues: GetStepGridPositionModule (copy)
	local Value = p1 * p2
	local ScaledSign = math.sign(Value) * math.floor((math.abs(Value)))
	
	if ScaledSign == 0 then
		return (math.clamp(Value1, p4.Min, p4.Max))
	end
	local NewValue = Value1 + ScaledSign
	
	if p3 ~= nil then
		local StepGridPositionModule: number = GetStepGridPositionModule(Value1, p3, p4)
		NewValue = p4.Min + ((if ScaledSign > 0 then math.floor(StepGridPositionModule) else math.ceil(StepGridPositionModule)) + ScaledSign) * p3
	end
	return (math.clamp(NewValue, p4.Min, p4.Max))
end