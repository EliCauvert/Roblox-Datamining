local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local myRoduxNetworkingModule = require(profilePlatform.Networking.myRoduxNetworking)
local parent = profilePlatform.Parent
local httpModule = require(parent.Http)
local _ = require(profilePlatform.Common.Enums)
local fFlagProfilePlatformEnableLazyLoadingComponentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local _ = require(parent.SocialCommon)
local _ = require(profilePlatform.Types.Component)

return myRoduxNetworkingModule.POST("GetProfile", function(p0, p1)
	-- upvalues: httpModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref)
	return p0(httpModule.Url.APIS_URL .. "profile-platform-api"):path("v1"):path("profiles"):path("get"):body({
		profileType = p1.profileType,
		profileId = p1.profileId,
		components = p1.components,
		includeComponentOrdering = p1.includeComponentOrdering,
		onlyEssentialComponents = if fFlagProfilePlatformEnableLazyLoadingComponentsModule then p1.onlyEssentialComponents else nil
	})
end)