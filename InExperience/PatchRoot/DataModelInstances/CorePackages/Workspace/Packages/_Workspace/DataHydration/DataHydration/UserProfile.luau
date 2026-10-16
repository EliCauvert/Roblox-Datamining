local UserProfileDataHydrationModule = require(script.UserProfileDataHydration)

return {
	resolveField = UserProfileDataHydrationModule.resolveField,
	updateFromHydration = UserProfileDataHydrationModule.updateFromHydration,
	getAndFetchUserInfo = UserProfileDataHydrationModule.getAndFetchUserInfo
}