local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local RoduxPresenceModule = require(UserList.Rodux.RoduxPresence)

return require(Parent.SocialReducerAdaptors).convertActions(RoduxPresenceModule.installReducer(), require(Parent.SocialReducerAdaptors).presenceActionAdaptor(RoduxPresenceModule), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})