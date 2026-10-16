local ConstantsModule = require(script:FindFirstAncestor("Chrome").ChromeShared.Unibar.Constants)

return {
	MIN_TRACK_DETAILS_WIDTH = 48 / ConstantsModule.ICON_CELL_WIDTH,
	MAX_TRACK_DETAILS_WIDTH = 78 / ConstantsModule.ICON_CELL_WIDTH,
	MUSIC_WINDOW_MAX_SIZE = Vector2.new(400, 80)
}