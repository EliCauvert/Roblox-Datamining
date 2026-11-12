local FFlagVirtualCursorInputSink = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagVirtualCursorInputSink

return function(Object)
	-- upvalues: FFlagVirtualCursorInputSink (copy)
	assert(FFlagVirtualCursorInputSink, "getEffectiveInputSink should only be called when VirtualCursorInputSink is enabled")
	local InputSink = Object.InputSink
	
	if Object:IsA("GuiButton") or Object:IsA("TextBox") then
		if InputSink == Enum.InputSink.Activate and Object.Active == false then
			return Enum.InputSink.None
		end
	elseif InputSink == Enum.InputSink.None and Object.Active == true then
		return Enum.InputSink.Activate
	end
	return InputSink
end