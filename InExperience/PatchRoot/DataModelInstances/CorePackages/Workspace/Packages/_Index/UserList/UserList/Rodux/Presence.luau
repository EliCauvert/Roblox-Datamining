local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local roduxPresenceModule = require(userList.Rodux.RoduxPresence)

return require(parent.SocialReducerAdaptors).convertActions(roduxPresenceModule.installReducer(), require(parent.SocialReducerAdaptors).presenceActionAdaptor(roduxPresenceModule), {
	byUserId = {},
	byGameId = {},
	byGameInstanceId = {},
	byPlaceId = {}
})