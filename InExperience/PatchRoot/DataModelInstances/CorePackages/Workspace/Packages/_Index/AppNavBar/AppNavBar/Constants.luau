local parent = script.Parent.Parent
local appPage = require(parent.RobloxAppEnums).AppPage

return {
	STUDIO_CTA_EVENT_CONTEXT = "StudioCTA",
	STUDIO_CTA_EVENT_NAME_OPEN = "OpenStudioCreatePage",
	STUDIO_CTA_EVENT_NAME_MOUNT = "MountStudioButton",
	HOME_CONTAINER_SUB_TAB_PAGES = if require(parent.SharedFlags).FFlagAppIaHomeSubTab then { appPage.Home, appPage.Games } else nil
}