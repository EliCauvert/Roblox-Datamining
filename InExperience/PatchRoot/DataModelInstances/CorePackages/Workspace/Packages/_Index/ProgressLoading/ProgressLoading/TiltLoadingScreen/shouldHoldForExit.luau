local fFlagTiltLoadingScreenEnterExitHold = require(script:FindFirstAncestor("ProgressLoading").Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold

return function(p1)
	-- upvalues: fFlagTiltLoadingScreenEnterExitHold (ref)
	return fFlagTiltLoadingScreenEnterExitHold and not p1
end