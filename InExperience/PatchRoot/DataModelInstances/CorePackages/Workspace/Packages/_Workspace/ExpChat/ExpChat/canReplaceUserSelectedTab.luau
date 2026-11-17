local IsStickyTabRestoreEnabledModule = require(script:FindFirstAncestor("ExpChat").isStickyTabRestoreEnabled)

return function(p1): boolean
	-- upvalues: IsStickyTabRestoreEnabledModule (copy)
	return not (IsStickyTabRestoreEnabledModule() and p1)
end