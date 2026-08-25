local networkRequests = script.Parent.networkRequests
local createGetSkinnyUsersFromUserIdsModule = require(networkRequests.createGetSkinnyUsersFromUserIds)
local createGetUsernameHistoryFromUserIdModule = require(networkRequests.createGetUsernameHistoryFromUserId)
local createGetUserV2FromUserIdModule = require(networkRequests.createGetUserV2FromUserId)
local createGetDisplayNameValidationModule = require(networkRequests.createGetDisplayNameValidation)
local createSetDisplayNameModule = require(networkRequests.createSetDisplayName)
local createSetDescriptionModule = require(networkRequests.createSetDescription)

return function(p0)
	-- upvalues: createGetSkinnyUsersFromUserIdsModule (ref), createGetUsernameHistoryFromUserIdModule (ref), createGetUserV2FromUserIdModule (ref), createGetDisplayNameValidationModule (ref), createSetDisplayNameModule (ref), createSetDescriptionModule (ref)
	return {
		GetSkinnyUsersFromUserIds = createGetSkinnyUsersFromUserIdsModule(p0),
		GetUsernameHistoryFromUserId = createGetUsernameHistoryFromUserIdModule(p0),
		GetUserV2FromUserId = createGetUserV2FromUserIdModule(p0),
		GetDisplayNameValidation = createGetDisplayNameValidationModule(p0),
		SetDisplayName = createSetDisplayNameModule(p0),
		SetDescription = createSetDescriptionModule(p0)
	}
end