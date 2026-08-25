local guiService = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Utility.Wrappers).Services.GuiService

return function()
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