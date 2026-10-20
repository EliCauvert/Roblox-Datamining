return function(List)
	table.sort(List, function(A: Frame, B: Frame): boolean
		return (A:IsA("GuiObject") and A.LayoutOrder or 0) < (B:IsA("GuiObject") and B.LayoutOrder or 0)
	end)
	
	return List
end