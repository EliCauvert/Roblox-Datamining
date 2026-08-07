local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local appPage = require(parent.RobloxAppEnums).AppPage
local contexts = require(parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)

return function() --[[ line: 13 ]]
	-- upvalues: useProfileWrapperContextModule (ref), reactModule (ref), enumsModule (ref), contexts (ref), appPage (ref)
	local var4 = useProfileWrapperContextModule()
	
	return reactModule.useMemo(function() --[[ line: 16 ]]
		-- upvalues: var4 (ref), enumsModule (copy), contexts (copy), appPage (copy)
		return if var4.profileType == enumsModule.ProfileTypes.Community then contexts.CommunityProfile elseif var4.profileType == enumsModule.ProfileTypes.User then contexts.PlayerProfile else appPage.ProfilePlatform
	end, { var4.profileType })
end