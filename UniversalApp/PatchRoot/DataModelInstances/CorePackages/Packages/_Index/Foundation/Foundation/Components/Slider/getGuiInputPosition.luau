local GuiService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.GuiService

return function(p1, p2) --[[ Line: 11 | Named "getGuiInputPosition" ]]
	-- upvalues: GuiService (copy)
	local ScreenGui = p2:FindFirstAncestorWhichIsA("ScreenGui")
	
	return if ScreenGui and ScreenGui.IgnoreGuiInset then p1 + GuiService:GetInsetArea(if ScreenGui.ScreenInsets == Enum.ScreenInsets.DeviceSafeInsets then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None).Min else p1
end