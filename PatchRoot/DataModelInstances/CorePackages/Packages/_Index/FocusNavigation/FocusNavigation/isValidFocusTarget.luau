-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "isValidFocusTarget" ]]
	if not p0 then
		return false, "`nil` value provided to isValidFocusTarget"
	elseif not p0:IsA("GuiBase2d") then
		return false, string.format("provided Instance is of class %s, which is not a GuiBase2d", p0.ClassName)
	elseif not p0:FindFirstAncestorWhichIsA("LayerCollector") then
		return false, "provided Instance is not a descendant of a LayerCollector like a ScreenGui or SurfaceGui"
	elseif p0:FindFirstAncestorWhichIsA("BasePlayerGui") then
		return true
	end
	return false, "provided Instance is not a descendant of a BasePlayerGui like PlayerGui or CoreGui"
end