local GuiService = game:GetService("GuiService")

return function(p1, p2)
	-- upvalues: GuiService (copy)
	local ScreenGui = p2:FindFirstAncestorWhichIsA("ScreenGui")
	
	return if ScreenGui == nil or not ScreenGui.IgnoreGuiInset then p1 else p1 + GuiService:GetGuiInset()
end