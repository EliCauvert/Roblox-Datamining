local constantsModule = require(script:FindFirstAncestor("Chrome").ChromeShared.Unibar.Constants)

return {
	AUDIO_REPORTING_WINDOW_MIN_HEIGHT = 420,
	MIN_TRACK_DETAILS_WIDTH = 48 / constantsModule.ICON_CELL_WIDTH,
	MAX_TRACK_DETAILS_WIDTH = 78 / constantsModule.ICON_CELL_WIDTH,
	MUSIC_WINDOW_MAX_SIZE = Vector2.new(400, 80)
}