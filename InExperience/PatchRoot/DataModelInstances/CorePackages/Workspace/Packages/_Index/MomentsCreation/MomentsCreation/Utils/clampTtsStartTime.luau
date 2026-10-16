local GetFIntMomentsTTSStartTimeMinTailSecondsModule = require(script:FindFirstAncestor("MomentsCreation").Flags.GetFIntMomentsTTSStartTimeMinTailSeconds)

return function(Value: number, p1): number --[[ Line: 12 | Named "clampTtsStartTime" ]]
	-- upvalues: GetFIntMomentsTTSStartTimeMinTailSecondsModule (copy)
	return (math.clamp(Value, 0, (math.max(0, p1 - GetFIntMomentsTTSStartTimeMinTailSecondsModule()))))
end