local FocusNavigationEventNameEnumModule = require(script.Parent.FocusNavigationEventNameEnum)

return {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnumModule.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnumModule.NavigateBack,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnumModule.Search,
	[Enum.KeyCode.Slash] = FocusNavigationEventNameEnumModule.Search,
	[Enum.KeyCode.PageUp] = FocusNavigationEventNameEnumModule.ScrollUp,
	[Enum.KeyCode.LeftBracket] = FocusNavigationEventNameEnumModule.ScrollUp,
	[Enum.KeyCode.PageDown] = FocusNavigationEventNameEnumModule.ScrollDown,
	[Enum.KeyCode.RightBracket] = FocusNavigationEventNameEnumModule.ScrollDown
}