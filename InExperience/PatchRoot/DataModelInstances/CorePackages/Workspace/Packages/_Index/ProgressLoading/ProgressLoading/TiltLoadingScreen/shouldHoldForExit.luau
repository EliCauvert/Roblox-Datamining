local fFlagTiltLoadingScreenEnterExitHold = require(script:FindFirstAncestor("ProgressLoading").Parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold

return function(p0)
	-- upvalues: fFlagTiltLoadingScreenEnterExitHold (ref)
	return fFlagTiltLoadingScreenEnterExitHold and not p0
end