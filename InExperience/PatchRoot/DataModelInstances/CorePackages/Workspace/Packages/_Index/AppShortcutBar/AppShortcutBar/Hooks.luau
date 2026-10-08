return {
	useAppShortcutBarHeight = require(script.useAppShortcutBarHeight),
	useIsStickyShortcutBarEnabled = require(script.useIsStickyShortcutBarEnabled),
	useShortcutBarVisible = require(script:FindFirstAncestor("AppShortcutBar").Stores.GetShortcutBarStatusStore)(false).useShortcutBarVisible
}