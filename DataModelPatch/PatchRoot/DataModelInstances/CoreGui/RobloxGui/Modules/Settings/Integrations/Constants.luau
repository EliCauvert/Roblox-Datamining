return {
	GAMESETTINGS = {
		PAGE_ID = "gamesettings",
		TAB_HEADER = {
			NAME = "GameSettingsTab",
			TEXT = "Settings",
			ICON = "icons/common/settings"
		},
		LAYOUT_ORDER = require(script:FindFirstAncestor("Settings").Resources.GameSettingsConstants).SETTINGS_MENU_LAYOUT_ORDER
	}
}