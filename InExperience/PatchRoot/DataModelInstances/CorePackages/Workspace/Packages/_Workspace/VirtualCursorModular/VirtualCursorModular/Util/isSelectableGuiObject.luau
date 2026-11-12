local SharedFlagsModule = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags)
local FFlagLuaAppGamepadSelectionRespectsInteractable = SharedFlagsModule.FFlagLuaAppGamepadSelectionRespectsInteractable
local FFlagVirtualCursorInputSink = SharedFlagsModule.FFlagVirtualCursorInputSink

return function(Frame, p1): boolean
	-- upvalues: FFlagVirtualCursorInputSink (copy), FFlagLuaAppGamepadSelectionRespectsInteractable (copy)
	if not Frame:IsA("GuiButton") and not Frame:IsA("TextBox") then
		return false
	end
	local Interactable = if FFlagVirtualCursorInputSink and p1 then Frame.Interactable else Frame.Active
	
	if not Frame.Visible or not Interactable or not Frame.Selectable then
		return false
	end
	if Frame.AbsoluteSize.Magnitude == 0 then
		return false
	end
	repeat
		if not FFlagLuaAppGamepadSelectionRespectsInteractable then break end
		local Parent = Frame
		while true do
			if not Parent then break end
			if Parent:IsA("GuiObject") then
				if not Parent.Interactable then
					return false
				end
			elseif not Parent:IsA("Folder") then break end
			Parent = Parent.Parent
		end
	until true
	return true
end