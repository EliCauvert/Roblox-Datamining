local GetEffectiveInputSinkModule = require(script.Parent.getEffectiveInputSink)
local FFlagVirtualCursorInputSink = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagVirtualCursorInputSink

return function(p1, p2)
	-- upvalues: FFlagVirtualCursorInputSink (copy), GetEffectiveInputSinkModule (copy)
	if FFlagVirtualCursorInputSink and p2 then
		local EffectiveInputSinkModule = GetEffectiveInputSinkModule(p1)
		
		return p1.Visible and (EffectiveInputSinkModule == Enum.InputSink.All or EffectiveInputSinkModule == Enum.InputSink.Activate)
	else
		return p1.Visible and (p1.Active and p1.Interactable)
	end
end