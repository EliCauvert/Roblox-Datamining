return function(p1)
	return not (not p1:IsA("GuiButton") and not p1:IsA("TextBox")) and (not (not p1.Active or not p1.Selectable) and (p1.AbsoluteSize.X == 0 or p1.AbsoluteSize.Y == 0))
end