local GuiService = game:GetService("GuiService")

return function()
	-- upvalues: GuiService (copy)
	return GuiService:FindFirstChildWhichIsA("ScreenshotHud")
end