local getFIntMomentsTTSStartTimeMinTailSecondsModule = require(script:FindFirstAncestor("MomentsCreation").Flags.GetFIntMomentsTTSStartTimeMinTailSeconds)

return function(value, minValue)
	-- upvalues: getFIntMomentsTTSStartTimeMinTailSecondsModule (ref)
	return math.clamp(value, 0, math.max(0, minValue - getFIntMomentsTTSStartTimeMinTailSecondsModule()))
end