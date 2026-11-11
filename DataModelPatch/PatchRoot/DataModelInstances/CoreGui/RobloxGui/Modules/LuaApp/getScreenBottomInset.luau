local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

return function()
	-- upvalues: UserInputService (copy), GuiService (copy)
	if _G.__TESTEZ_RUNNING_TEST__ then
		return 0
	else
		local Y = UserInputService.BottomBarSize.Y
		local Bottom = GuiService:GetSafeZoneOffsets().bottom
		
		return Y == 0 and Bottom or Y
	end
end