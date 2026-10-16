local FFlagTiltLoadingScreenEnterExitHold = require(script:FindFirstAncestor("ProgressLoading").Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold

return function(p1): boolean --[[ Line: 6 | Named "shouldHoldForExit" ]]
	-- upvalues: FFlagTiltLoadingScreenEnterExitHold (copy)
	return FFlagTiltLoadingScreenEnterExitHold and not p1
end