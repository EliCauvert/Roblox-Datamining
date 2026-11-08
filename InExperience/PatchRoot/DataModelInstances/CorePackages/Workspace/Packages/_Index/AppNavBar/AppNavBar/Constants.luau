local Parent = script.Parent.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local config = {
	STUDIO_CTA_EVENT_CONTEXT = "StudioCTA",
	STUDIO_CTA_EVENT_NAME_OPEN = "OpenStudioCreatePage",
	STUDIO_CTA_EVENT_NAME_MOUNT = "MountStudioButton",
	HOME_CONTAINER_SUB_TAB_PAGES = if FFlagAppIaHomeSubTab then { AppPage.Home, AppPage.Games } else nil
}

if SharedFlagsModule.FFlagAppIaHomeCampaignSubTab and FFlagAppIaHomeSubTab then
	table.insert(config.HOME_CONTAINER_SUB_TAB_PAGES, AppPage.Campaign)
end
return config