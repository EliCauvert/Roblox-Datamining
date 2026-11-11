local PeekViewState = require(game:GetService("CorePackages").Workspace.Packages.PeekView).PeekViewState

return function(Closed): boolean
	-- upvalues: PeekViewState (copy)
	return not (Closed == PeekViewState.Hidden or (Closed == PeekViewState.Closed or Closed == PeekViewState.SuperBrief))
end