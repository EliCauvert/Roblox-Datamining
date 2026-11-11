local v1: number = if require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).IsVRAppBuild() then 1.3 else 1
local config = {
	LongPressSeconds = 0.25,
	RightMargin = 12,
	Tile = {
		Size = v1 * 50,
		SelectedSize = v1 * 58,
		Padding = v1 * 6,
		ContextWidth = v1 * 42,
		ShownContextWidth = v1 * 33,
		MoreIconSize = v1 * 34,
		ArrowSize = UDim2.fromOffset(28, 22)
	},
	VerticalList = { HeightScale = 0.8, Padding = 13, Width = v1 * 62 },
	NoItem = { TextSize = 12, BottomPadding = 0, IconSize = 30 }
}
local config1 = {
	LongPressSeconds = 0.0625,
	RightMargin = 80,
	Tile = {
		Size = 80,
		SelectedSize = 88,
		Padding = 6,
		ContextWidth = 64,
		ShownContextWidth = 51,
		MoreIconSize = 52,
		ArrowSize = UDim2.fromOffset(42, 33)
	},
	VerticalList = { Width = 92, HeightScale = 0.8, Padding = 13 },
	NoItem = { TextSize = 20, BottomPadding = -72, IconSize = 48 }
}

return game:GetService("GuiService"):IsTenFootInterface() and config1 or config