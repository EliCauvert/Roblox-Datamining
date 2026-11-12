local FIntFreeTrialTopBarChipSwipeThresholdModule = require(script:FindFirstAncestor("InExperienceShop").Flags.FIntFreeTrialTopBarChipSwipeThreshold)

return function(Value: number, Value1: number): boolean
	-- upvalues: FIntFreeTrialTopBarChipSwipeThresholdModule (copy)
	return FIntFreeTrialTopBarChipSwipeThresholdModule <= math.abs(Value) and math.abs(Value1) < math.abs(Value)
end