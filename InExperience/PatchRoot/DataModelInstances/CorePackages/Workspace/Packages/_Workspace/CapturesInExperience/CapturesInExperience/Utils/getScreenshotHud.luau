local guiService = game:GetService("GuiService")

return function()
	-- upvalues: guiService (ref)
	return guiService:FindFirstChildWhichIsA("ScreenshotHud")
end