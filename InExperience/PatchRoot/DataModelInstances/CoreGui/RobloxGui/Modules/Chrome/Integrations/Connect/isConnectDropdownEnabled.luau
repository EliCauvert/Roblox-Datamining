local GetFFlagEnableAppChatInExperienceFunction = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local GetShouldShowPlatformChatBasedOnPolicyModule = require(script:FindFirstAncestor("Chrome").Flags.GetShouldShowPlatformChatBasedOnPolicy)

return function() --[[ Line: 9 ]]
	-- upvalues: GetFFlagEnableAppChatInExperienceFunction (copy), GetShouldShowPlatformChatBasedOnPolicyModule (copy)
	return GetFFlagEnableAppChatInExperienceFunction() and GetShouldShowPlatformChatBasedOnPolicyModule()
end