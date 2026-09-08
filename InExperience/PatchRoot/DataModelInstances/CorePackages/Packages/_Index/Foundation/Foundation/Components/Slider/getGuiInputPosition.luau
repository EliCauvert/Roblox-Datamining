local guiService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.GuiService

return function(p1, p2)
	-- upvalues: guiService (ref)
	local screenGui = p2:FindFirstAncestorWhichIsA("ScreenGui")
	
	return if screenGui then if screenGui.IgnoreGuiInset then p1 + guiService:GetInsetArea(if screenGui.ScreenInsets == Enum.ScreenInsets.DeviceSafeInsets then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None).Min else p1 else p1
end