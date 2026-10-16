local NetworkRequests = script.Parent.networkRequests
local CreateGetSkinnyUsersFromUserIdsModule = require(NetworkRequests.createGetSkinnyUsersFromUserIds)
local CreateGetUsernameHistoryFromUserIdModule = require(NetworkRequests.createGetUsernameHistoryFromUserId)
local CreateGetUserV2FromUserIdModule = require(NetworkRequests.createGetUserV2FromUserId)
local CreateGetDisplayNameValidationModule = require(NetworkRequests.createGetDisplayNameValidation)
local CreateSetDisplayNameModule = require(NetworkRequests.createSetDisplayName)
local CreateSetDescriptionModule = require(NetworkRequests.createSetDescription)

return function(p1) --[[ Line: 9 ]]
	-- upvalues: CreateGetSkinnyUsersFromUserIdsModule (copy), CreateGetUsernameHistoryFromUserIdModule (copy), CreateGetUserV2FromUserIdModule (copy), CreateGetDisplayNameValidationModule (copy), CreateSetDisplayNameModule (copy), CreateSetDescriptionModule (copy)
	return {
		GetSkinnyUsersFromUserIds = CreateGetSkinnyUsersFromUserIdsModule(p1),
		GetUsernameHistoryFromUserId = CreateGetUsernameHistoryFromUserIdModule(p1),
		GetUserV2FromUserId = CreateGetUserV2FromUserIdModule(p1),
		GetDisplayNameValidation = CreateGetDisplayNameValidationModule(p1),
		SetDisplayName = CreateSetDisplayNameModule(p1),
		SetDescription = CreateSetDescriptionModule(p1)
	}
end