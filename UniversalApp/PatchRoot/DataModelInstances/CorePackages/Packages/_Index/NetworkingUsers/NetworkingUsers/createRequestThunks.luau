local networkRequests = script.Parent.networkRequests
local createGetSkinnyUsersFromUserIdsModule = require(networkRequests.createGetSkinnyUsersFromUserIds)
local createGetUsernameHistoryFromUserIdModule = require(networkRequests.createGetUsernameHistoryFromUserId)
local createGetUserV2FromUserIdModule = require(networkRequests.createGetUserV2FromUserId)
local createGetDisplayNameValidationModule = require(networkRequests.createGetDisplayNameValidation)
local createSetDisplayNameModule = require(networkRequests.createSetDisplayName)
local createSetDescriptionModule = require(networkRequests.createSetDescription)

return function(p1)
	-- upvalues: createGetSkinnyUsersFromUserIdsModule (ref), createGetUsernameHistoryFromUserIdModule (ref), createGetUserV2FromUserIdModule (ref), createGetDisplayNameValidationModule (ref), createSetDisplayNameModule (ref), createSetDescriptionModule (ref)
	return {
		GetSkinnyUsersFromUserIds = createGetSkinnyUsersFromUserIdsModule(p1),
		GetUsernameHistoryFromUserId = createGetUsernameHistoryFromUserIdModule(p1),
		GetUserV2FromUserId = createGetUserV2FromUserIdModule(p1),
		GetDisplayNameValidation = createGetDisplayNameValidationModule(p1),
		SetDisplayName = createSetDisplayNameModule(p1),
		SetDescription = createSetDescriptionModule(p1)
	}
end