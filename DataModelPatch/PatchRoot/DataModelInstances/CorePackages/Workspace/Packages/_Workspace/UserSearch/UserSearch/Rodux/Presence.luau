local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local RoduxPresenceModule = require(UserSearch.Rodux.RoduxPresence)

return require(Parent.SocialReducerAdaptors).convertActions(RoduxPresenceModule.installReducer(), require(Parent.SocialReducerAdaptors).presenceActionAdaptor(RoduxPresenceModule), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})