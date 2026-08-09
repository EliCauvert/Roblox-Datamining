local userProfileDataHydrationModule = require(script.UserProfileDataHydration)

return {
	resolveField = userProfileDataHydrationModule.resolveField,
	updateFromHydration = userProfileDataHydrationModule.updateFromHydration
}