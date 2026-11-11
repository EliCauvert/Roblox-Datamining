local Parent = script:FindFirstAncestor("TenFootUiCommon").Parent
local _ = require(Parent.React)
local _ = require(Parent.Navigation)

return {
	ScreenKind = { Default = "Default", FullScreen = "FullScreen" },
	GlobalNavDisplayOption = {
		ShowAll = "ShowAll",
		TabGroupOnly = "TabGroupOnly",
		OptionGroupOnly = "OptionGroupOnly",
		HideAll = "HideAll"
	}
}