return function(p1)
	if not p1 then
		return false, "`nil` value provided to isValidFocusTarget"
	elseif not p1:IsA("GuiBase2d") then
		return false, string.format("provided Instance is of class %s, which is not a GuiBase2d", p1.ClassName)
	elseif not p1:FindFirstAncestorWhichIsA("LayerCollector") then
		return false, "provided Instance is not a descendant of a LayerCollector like a ScreenGui or SurfaceGui"
	elseif p1:FindFirstAncestorWhichIsA("BasePlayerGui") then
		return true
	end
	return false, "provided Instance is not a descendant of a BasePlayerGui like PlayerGui or CoreGui"
end