-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:08 2026 Pacific Standard Time.

local guiService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.GuiService

return function() --[[ line: 9 | named "getHardwareSafeAreaInsets" ]]
	-- upvalues: guiService (ref)
	local deviceSafeInsetsInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local noneInsetArea = guiService:GetInsetArea(Enum.ScreenInsets.None)
	
	return {
		left = deviceSafeInsetsInsetArea.Min.X - noneInsetArea.Min.X,
		top = deviceSafeInsetsInsetArea.Min.Y - noneInsetArea.Min.Y,
		right = noneInsetArea.Max.X - deviceSafeInsetsInsetArea.Max.X,
		bottom = noneInsetArea.Max.Y - deviceSafeInsetsInsetArea.Max.Y
	}
end