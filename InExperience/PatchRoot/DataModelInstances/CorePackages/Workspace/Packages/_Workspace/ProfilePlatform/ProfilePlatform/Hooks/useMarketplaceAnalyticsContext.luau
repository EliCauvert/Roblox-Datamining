local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)

return function() --[[ Line: 13 ]]
	-- upvalues: UseProfileWrapperContextModule (copy), ReactModule (copy), EnumsModule (copy), Contexts (copy), AppPage (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	
	return ReactModule.useMemo(function() --[[ Line: 16 ]]
		-- upvalues: UseProfileWrapperContextModuleResult (copy), EnumsModule (upval), Contexts (upval), AppPage (upval)
		return if UseProfileWrapperContextModuleResult.profileType == EnumsModule.ProfileTypes.Community then Contexts.CommunityProfile elseif UseProfileWrapperContextModuleResult.profileType == EnumsModule.ProfileTypes.User then Contexts.PlayerProfile else AppPage.ProfilePlatform
	end, { UseProfileWrapperContextModuleResult.profileType })
end