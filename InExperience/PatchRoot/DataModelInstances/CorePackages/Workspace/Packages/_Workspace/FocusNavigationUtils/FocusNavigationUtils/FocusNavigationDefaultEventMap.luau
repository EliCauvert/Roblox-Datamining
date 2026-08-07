local focusNavigationEventNameEnumModule = require(script.Parent.FocusNavigationEventNameEnum)

return {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnumModule.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnumModule.NavigateBack,
	[Enum.KeyCode.ButtonY] = focusNavigationEventNameEnumModule.Search,
	[Enum.KeyCode.Slash] = focusNavigationEventNameEnumModule.Search,
	[Enum.KeyCode.PageUp] = focusNavigationEventNameEnumModule.ScrollUp,
	[Enum.KeyCode.LeftBracket] = focusNavigationEventNameEnumModule.ScrollUp,
	[Enum.KeyCode.PageDown] = focusNavigationEventNameEnumModule.ScrollDown,
	[Enum.KeyCode.RightBracket] = focusNavigationEventNameEnumModule.ScrollDown
}