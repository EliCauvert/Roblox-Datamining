return function(p0)
	return not (not p0:IsA("GuiButton") and not p0:IsA("TextBox")) and (not (not p0.Active or not p0.Selectable) and (p0.AbsoluteSize.X == 0 or p0.AbsoluteSize.Y == 0))
end