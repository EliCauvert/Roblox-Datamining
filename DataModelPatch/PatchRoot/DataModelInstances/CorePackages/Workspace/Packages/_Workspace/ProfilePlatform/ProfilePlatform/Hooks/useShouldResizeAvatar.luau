local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local EnumsModule = require(ProfilePlatform.Common.Enums)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local FFlagProfilePlatformMeTabMobileProfileHero = require(Parent.SharedFlags).FFlagProfilePlatformMeTabMobileProfileHero
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagProfilePlatformEnableAvatarBackground = require(Parent.SharedFlags).FFlagProfilePlatformEnableAvatarBackground
local ProfilePlatformMeTabHeroDecoupleAvatarBackground = game:DefineFastFlag("ProfilePlatformMeTabHeroDecoupleAvatarBackground", false)

return function(): boolean
	-- upvalues: FFlagProfilePlatformMeTabMobileProfileHero (copy), FFlagAXEnableProfileTab (copy), ProfilePlatformMeTabHeroDecoupleAvatarBackground (copy), FFlagProfilePlatformEnableAvatarBackground (copy), UseProfileWrapperContextModule (copy), UseProfileFormFactorModule (copy), EnumsModule (copy)
	if not FFlagProfilePlatformMeTabMobileProfileHero then
		return false
	elseif FFlagAXEnableProfileTab and (ProfilePlatformMeTabHeroDecoupleAvatarBackground or FFlagProfilePlatformEnableAvatarBackground) then
		local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
		local IsFormFactorMatch = UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide
		
		return UseProfileWrapperContextModuleResult.forceFullView == true and not IsFormFactorMatch
	else
		return false
	end
end