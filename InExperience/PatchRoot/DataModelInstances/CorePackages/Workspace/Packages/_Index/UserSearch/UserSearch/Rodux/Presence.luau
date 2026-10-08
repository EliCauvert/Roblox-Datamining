local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local roduxPresenceModule = require(userSearch.Rodux.RoduxPresence)

return require(parent.SocialReducerAdaptors).convertActions(roduxPresenceModule.installReducer(), require(parent.SocialReducerAdaptors).presenceActionAdaptor(roduxPresenceModule), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})