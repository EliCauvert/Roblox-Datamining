local TextKeysModule = require(script.Parent.TextKeys)

return {
	APP_STORAGE_VALUE = "true",
	PAGE_MAX_CONTENT_WIDTH = 440,
	FeatureAvailable = {
		APP_STORAGE_KEY = "SchoolEntryTooltipSeen",
		ENGINE_FEATURE_NAME = "SchoolEntryTooltipSeenStorageKey",
		TITLE = TextKeysModule.FeatureAvailableTooltipTitle,
		BODY = TextKeysModule.FeatureAvailableTooltipBody
	},
	SchoolIsLive = {
		APP_STORAGE_KEY = "SchoolEntryLiveTooltipSeen",
		ENGINE_FEATURE_NAME = "SchoolEntryLiveTooltipSeenStorageKey",
		TITLE = TextKeysModule.SchoolIsLiveTooltipTitle,
		BODY = TextKeysModule.SchoolIsLiveTooltipBody
	},
	Waitlist = {
		MAX_CONTENT_WIDTH = 576,
		DIMMED_GROUP_TRANSPARENCY = 0.7,
		MEDIA_WIDTH = 100,
		MEDIA_HEIGHT = 100
	}
}