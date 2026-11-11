local CoreGui = game:GetService("CoreGui")

return function(Vector)
	-- upvalues: CoreGui (copy)
	local GuiObjectsAtPosition = CoreGui:GetGuiObjectsAtPosition(Vector.X, Vector.Y)
	
	if #GuiObjectsAtPosition == 0 then
		return nil
	end
	local Count = 1
	local v1 = nil
	local v2 = -1
	local v3 = nil
	local v4 = -1
	while Count <= #GuiObjectsAtPosition do
		local GuiObjectsAtPositionEntry = GuiObjectsAtPosition[Count]
		
		if not GuiObjectsAtPositionEntry.Visible or not GuiObjectsAtPositionEntry:IsA("ScrollingFrame") then
			if GuiObjectsAtPositionEntry.Selectable then
				local v5: boolean = v3
				
				if not v5 then
					v3 = GuiObjectsAtPositionEntry
					v4 = Count
					v5 = v1 and not GuiObjectsAtPositionEntry:IsAncestorOf(v1)
				end
				if not v5 then
					return v3
				end
			elseif GuiObjectsAtPositionEntry:IsA("TextLabel") and not v1 then
				v1 = GuiObjectsAtPositionEntry
				v2 = Count
			end
		end
		Count += 1
		
		if GuiObjectsAtPositionEntry.Interactable and GuiObjectsAtPositionEntry.Active then
			Count = #GuiObjectsAtPosition + 1
		end
	end
	return if v2 > 0 and v4 > 0 then if v2 < v4 then v1 else v3 elseif v1 or v3 then v1 or v3 else nil
end