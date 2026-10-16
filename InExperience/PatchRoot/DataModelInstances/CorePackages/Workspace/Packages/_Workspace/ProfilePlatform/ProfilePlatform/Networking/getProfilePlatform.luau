local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local HttpModule = require(Parent.Http)
local _ = require(ProfilePlatform.Common.Enums)
local FFlagProfilePlatformEnableLazyLoadingComponentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local _ = require(Parent.SocialCommon)
local _ = require(ProfilePlatform.Types.Component)

return require(ProfilePlatform.Networking.myRoduxNetworking).POST("GetProfile", function(Callback, p1) --[[ Line: 27 ]]
	-- upvalues: HttpModule (copy), FFlagProfilePlatformEnableLazyLoadingComponentsModule (copy)
	return Callback(HttpModule.Url.APIS_URL .. "profile-platform-api"):path("v1"):path("profiles"):path("get"):body({
		profileType = p1.profileType,
		profileId = p1.profileId,
		components = p1.components,
		includeComponentOrdering = p1.includeComponentOrdering,
		onlyEssentialComponents = if FFlagProfilePlatformEnableLazyLoadingComponentsModule then p1.onlyEssentialComponents else nil
	})
end)