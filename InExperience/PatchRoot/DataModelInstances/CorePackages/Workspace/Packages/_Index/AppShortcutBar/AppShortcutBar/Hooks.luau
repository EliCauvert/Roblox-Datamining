return {
	useAppShortcutBarHeight = require(script.useAppShortcutBarHeight),
	useShortcutBarVisible = require(script:FindFirstAncestor("AppShortcutBar").Stores.GetShortcutBarStatusStore)(false).useShortcutBarVisible
}