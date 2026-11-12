local Workspace = game:GetService("Workspace")
local FFlagVirtualCursorInputSink = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagVirtualCursorInputSink
local IsInputSinkRolloutEnabledModule = require(script.Parent.isInputSinkRolloutEnabled)

return function(p1, p2)
	-- upvalues: FFlagVirtualCursorInputSink (copy), IsInputSinkRolloutEnabledModule (copy), Workspace (copy)
	assert(FFlagVirtualCursorInputSink, "getUsesInputSink should only be called when VirtualCursorInputSink is enabled")
	
	if p2 then
		local LayerCollector = p1:FindFirstAncestorWhichIsA("LayerCollector")
		
		return LayerCollector ~= nil and (LayerCollector.Enabled and IsInputSinkRolloutEnabledModule(LayerCollector.InputSinkEnabled))
	else
		return IsInputSinkRolloutEnabledModule(Workspace.InputSinkEnabled)
	end
end