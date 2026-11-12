local FFlagVirtualCursorInputSink = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagVirtualCursorInputSink
local InputSinkDefaultEngineFeature = game:GetEngineFeature("InputSinkDefault")

return function(RolloutState): boolean
	-- upvalues: FFlagVirtualCursorInputSink (copy), InputSinkDefaultEngineFeature (copy)
	assert(FFlagVirtualCursorInputSink, "isInputSinkRolloutEnabled should only be called when VirtualCursorInputSink is enabled")
	
	return RolloutState == Enum.RolloutState.Enabled or InputSinkDefaultEngineFeature and RolloutState == Enum.RolloutState.Default
end