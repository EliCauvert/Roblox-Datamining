local guiService = game:GetService("GuiService")

return function() --[[ line: 4 | named "getDeviceBottomInset" ]]
	-- upvalues: guiService (ref)
	local ok, status = pcall(function() --[[ line: 5 ]]
		-- upvalues: guiService (copy)
		return guiService:GetInsetArea(Enum.ScreenInsets.None).Max.Y - guiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets).Max.Y
	end)
	
	if ok and typeof(status) == "number" then
		return math.max(0, status)
	end
	local ok_1, _, var1 = pcall(function() --[[ line: 13 ]]
		-- upvalues: guiService (copy)
		return guiService:GetGuiInset()
	end)
	
	return if ok_1 and typeof(var1) == "Vector2" then math.max(0, var1.Y) else 0
end