local _ = require(script.Parent.Types)

return {
	WHATS_NEW_SHIP_UNIX = 0,
	DEFAULT = {
		textMaxLength = 280,
		updateEntryDuration = 90,
		maxTourTips = 4,
		maxEntriesPerMenu = 12,
		maxOptOutCount = 3,
		learnMoreLabel = "Learn more"
	},
	WarningCodes = {
		GATEWAY_COPY_FALLBACK = "W_GATEWAY_COPY_FALLBACK",
		TOUR_TIPS_TRUNCATED = "W_TOUR_TIPS_TRUNCATED",
		MENU_GROUP_DEFERRED = "W_MENU_GROUP_DEFERRED"
	},
	ErrorCodes = {
		INVALID_CONSTANTS = "E_INVALID_CONSTANTS",
		SCOPE_KEY_MISMATCH = "E_SCOPE_KEY_MISMATCH",
		UNKNOWN_SCOPE = "E_UNKNOWN_SCOPE",
		TEXT_TOO_LONG = "E_TEXT_TOO_LONG",
		NESTED_MISSING_ACTION = "E_NESTED_MISSING_ACTION",
		UNKNOWN_ACTION_KEY = "E_UNKNOWN_ACTION_KEY"
	},
	LocalizationKeys = {
		TourtipBack = "Feature.WhatsNew.Action.Back",
		TourtipNext = "Feature.WhatsNew.Action.Next",
		TourtipDone = "Feature.WhatsNew.Action.Done"
	}
}