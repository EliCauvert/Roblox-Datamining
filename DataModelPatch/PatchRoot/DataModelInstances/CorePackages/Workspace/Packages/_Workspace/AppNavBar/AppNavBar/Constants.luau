local Parent = script.Parent.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage

return {
	STUDIO_CTA_EVENT_CONTEXT = "StudioCTA",
	STUDIO_CTA_EVENT_NAME_OPEN = "OpenStudioCreatePage",
	STUDIO_CTA_EVENT_NAME_MOUNT = "MountStudioButton",
	HOME_CONTAINER_SUB_TAB_PAGES = if require(Parent.SharedFlags).FFlagAppIaHomeSubTab then { AppPage.Home, AppPage.Games } else nil
}