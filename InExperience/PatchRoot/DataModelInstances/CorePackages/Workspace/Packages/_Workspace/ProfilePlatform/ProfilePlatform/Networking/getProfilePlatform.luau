local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local myRoduxNetworkingModule = require(profilePlatform.Networking.myRoduxNetworking)
local parent = profilePlatform.Parent
local httpModule = require(parent.Http)
local _ = require(profilePlatform.Common.Enums)
local fFlagProfilePlatformEnableLazyLoadingComponentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local _ = require(parent.SocialCommon)
local _ = require(profilePlatform.Types.Component)

return myRoduxNetworkingModule.POST("GetProfile", function(p1, p2)
	-- upvalues: httpModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref)
	return p1(httpModule.Url.APIS_URL .. "profile-platform-api"):path("v1"):path("profiles"):path("get"):body({
		profileType = p2.profileType,
		profileId = p2.profileId,
		components = p2.components,
		includeComponentOrdering = p2.includeComponentOrdering,
		onlyEssentialComponents = if fFlagProfilePlatformEnableLazyLoadingComponentsModule then p2.onlyEssentialComponents else nil
	})
end)