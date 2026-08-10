local fFlagTiltLoadingScreenEnterExitHold = require(script:FindFirstAncestor("ProgressLoading").Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold

return function(p0, p1) --[[ line: 6 | named "shouldHoldForExit" ]]
	-- upvalues: fFlagTiltLoadingScreenEnterExitHold (ref)
	return fFlagTiltLoadingScreenEnterExitHold and (not p0 and not p1)
end