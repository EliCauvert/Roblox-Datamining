local fFlagLuaAppGamepadSelectionRespectsInteractable = require(script:FindFirstAncestor("VirtualCursorModular").Parent.SharedFlags).FFlagLuaAppGamepadSelectionRespectsInteractable

return function(p1)
	-- upvalues: fFlagLuaAppGamepadSelectionRespectsInteractable (ref)
	if not p1:IsA("GuiButton") and not p1:IsA("TextBox") then
		return false
	elseif not p1.Visible or not p1.Active or not p1.Selectable then
		return false
	elseif p1.AbsoluteSize.Magnitude == 0 then
		return false
	elseif fFlagLuaAppGamepadSelectionRespectsInteractable then
		local var1 = p1
		while var1 do
			if var1:IsA("GuiObject") then
				if var1.Interactable then
					var1 = var1.Parent
					continue
				end
				return false
			elseif not var1:IsA("Folder") then break end
		end
	end
	return true
end