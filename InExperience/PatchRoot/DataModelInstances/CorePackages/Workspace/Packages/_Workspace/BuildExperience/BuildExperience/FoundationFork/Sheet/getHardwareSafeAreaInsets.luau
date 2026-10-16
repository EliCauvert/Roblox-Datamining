local GuiService = require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Utility.Wrappers).Services.GuiService

return function() --[[ Line: 9 | Named "getHardwareSafeAreaInsets" ]]
	-- upvalues: GuiService (copy)
	local InsetArea = GuiService:GetInsetArea(Enum.ScreenInsets.DeviceSafeInsets)
	local InsetArea1 = GuiService:GetInsetArea(Enum.ScreenInsets.None)
	
	return {
		left = InsetArea.Min.X - InsetArea1.Min.X,
		top = InsetArea.Min.Y - InsetArea1.Min.Y,
		right = InsetArea1.Max.X - InsetArea.Max.X,
		bottom = InsetArea1.Max.Y - InsetArea.Max.Y
	}
end