local _ = require(script:FindFirstAncestor("SocialUpsell").Types)

return {
	UPSELL_LABEL_ITEM_TYPE_COUNTDOWN = "countdown",
	DEFAULT_FAE_ENTRY_POINT_EVENT_CTX = "CommsFae",
	OVERLAY_MENU_NAME = "SocialUpsell",
	OVERLAY_CORE_ACTION_NAME = "SocialUpsell",
	UPSELL_BUTTON_ACTION = {
		Primary = "Primary",
		Secondary = "Secondary",
		Dismiss = "Dismiss"
	},
	UPSELL_OVERLAY_BUTTON_ACTION = { Primary = "Primary", Dismiss = "Dismiss" },
	OVERLAY_TYPES = { SocialUpsell = "SocialUpsell" }
}