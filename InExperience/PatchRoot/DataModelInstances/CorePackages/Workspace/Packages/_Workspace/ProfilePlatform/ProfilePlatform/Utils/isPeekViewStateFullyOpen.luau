local PeekViewState = require(script:FindFirstAncestor("ProfilePlatform").Parent.PeekView).PeekViewState

return function(Extended): boolean
	-- upvalues: PeekViewState (copy)
	return Extended == PeekViewState.Full or Extended == PeekViewState.Extended
end