local parent = script:FindFirstAncestor("TenFootUiCommon").Parent
local _ = require(parent.React)
local _ = require(parent.Navigation)

return {
	ScreenKind = { Default = "Default", FullScreen = "FullScreen" },
	GlobalNavDisplayOption = {
		ShowAll = "ShowAll",
		TabGroupOnly = "TabGroupOnly",
		OptionGroupOnly = "OptionGroupOnly",
		HideAll = "HideAll"
	}
}