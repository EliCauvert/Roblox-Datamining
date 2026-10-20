local GuiService = game:GetService("GuiService")

return function(): number
	-- upvalues: GuiService (copy)
	local Success, Result = pcall(function()
		-- upvalues: GuiService (upval)
		return GuiService:GetInsetArea(Enum.ScreenInsets.None).Max.Y - GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets).Max.Y
	end)
	
	if Success and typeof(Result) == "number" then
		return (math.max(0, Result))
	else
		local Success1, _, Result3 = pcall(function()
			-- upvalues: GuiService (upval)
			return GuiService:GetGuiInset()
		end)
		
		return if Success1 and typeof(Result3) == "Vector2" then math.max(0, Result3.Y) else 0
	end
end