local GuiService = game:GetService("GuiService")

return function() --[[ Line: 4 ]]
	-- upvalues: GuiService (copy)
	return GuiService:FindFirstChildWhichIsA("ScreenshotHud")
end