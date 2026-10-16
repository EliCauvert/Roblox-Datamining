return function(Gui) --[[ Line: 1 | Named "isValidFocusTarget" ]]
	if not Gui then
		return false, "`nil` value provided to isValidFocusTarget"
	elseif not Gui:IsA("GuiBase2d") then
		return false, string.format("provided Instance is of class %s, which is not a GuiBase2d", Gui.ClassName)
	elseif not Gui:FindFirstAncestorWhichIsA("LayerCollector") then
		return false, "provided Instance is not a descendant of a LayerCollector like a ScreenGui or SurfaceGui"
	elseif Gui:FindFirstAncestorWhichIsA("BasePlayerGui") then
		return true
	else
		return false, "provided Instance is not a descendant of a BasePlayerGui like PlayerGui or CoreGui"
	end
end