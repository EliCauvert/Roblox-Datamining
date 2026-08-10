local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local enumsModule = require(profilePlatform.Common.Enums)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local fFlagProfilePlatformMeTabMobileProfileHero = require(parent.SharedFlags).FFlagProfilePlatformMeTabMobileProfileHero
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagProfilePlatformEnableAvatarBackground = require(parent.SharedFlags).FFlagProfilePlatformEnableAvatarBackground
local profilePlatformMeTabHeroDecoupleAvatarBackground = game:DefineFastFlag("ProfilePlatformMeTabHeroDecoupleAvatarBackground", false)

return function() --[[ line: 16 | named "useShouldResizeAvatar" ]]
	-- upvalues: fFlagProfilePlatformMeTabMobileProfileHero (ref), fFlagAXEnableProfileTab (ref), profilePlatformMeTabHeroDecoupleAvatarBackground (ref), fFlagProfilePlatformEnableAvatarBackground (ref), useProfileWrapperContextModule (ref), useProfileFormFactorModule (ref), enumsModule (ref)
	return if fFlagProfilePlatformMeTabMobileProfileHero then if fFlagAXEnableProfileTab and (profilePlatformMeTabHeroDecoupleAvatarBackground or fFlagProfilePlatformEnableAvatarBackground) then useProfileWrapperContextModule().forceFullView == true and not (useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide) else false else false
end