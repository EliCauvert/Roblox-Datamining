local fFlagTiltLoadingScreenEnterExitHold = require(script:FindFirstAncestor("ProgressLoading").Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold

return function(p0) --[[ line: 6 | named "shouldHoldForExit" ]]
	-- upvalues: fFlagTiltLoadingScreenEnterExitHold (ref)
	return fFlagTiltLoadingScreenEnterExitHold and not p0
end