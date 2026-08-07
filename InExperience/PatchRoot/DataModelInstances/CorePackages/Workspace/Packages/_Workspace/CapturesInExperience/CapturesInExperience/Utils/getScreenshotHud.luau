local guiService = game:GetService("GuiService")

return function() --[[ line: 4 ]]
	-- upvalues: guiService (ref)
	return guiService:FindFirstChildWhichIsA("ScreenshotHud")
end