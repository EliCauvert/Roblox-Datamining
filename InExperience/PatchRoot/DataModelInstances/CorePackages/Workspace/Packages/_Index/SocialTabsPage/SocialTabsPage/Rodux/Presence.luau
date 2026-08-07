local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local roduxPresenceModule = require(socialTabsPage.Rodux.RoduxPresence)

return require(parent.SocialReducerAdaptors).convertActions(roduxPresenceModule.installReducer(), require(parent.SocialReducerAdaptors).presenceActionAdaptor(roduxPresenceModule), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})