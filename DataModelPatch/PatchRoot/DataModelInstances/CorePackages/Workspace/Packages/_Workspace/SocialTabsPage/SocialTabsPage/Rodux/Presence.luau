local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local RoduxPresenceModule = require(SocialTabsPage.Rodux.RoduxPresence)

return require(Parent.SocialReducerAdaptors).convertActions(RoduxPresenceModule.installReducer(), require(Parent.SocialReducerAdaptors).presenceActionAdaptor(RoduxPresenceModule), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})