local getFFlagEnableAppChatInExperience = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local getShouldShowPlatformChatBasedOnPolicyModule = require(script:FindFirstAncestor("Chrome").Flags.GetShouldShowPlatformChatBasedOnPolicy)

return function()
	-- upvalues: getFFlagEnableAppChatInExperience (ref), getShouldShowPlatformChatBasedOnPolicyModule (ref)
	return getFFlagEnableAppChatInExperience() and getShouldShowPlatformChatBasedOnPolicyModule()
end