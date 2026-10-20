local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local UseAppPolicyFunction = require(ProfilePlatform.Parent.UniversalAppPolicy).useAppPolicy
local FFlagProfilePlatformFilterChatActionByPolicyModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

return function()
	-- upvalues: UseAppPolicyFunction (copy), FFlagProfilePlatformFilterChatActionByPolicyModule (copy)
	return UseAppPolicyFunction(function(p1)
		-- upvalues: FFlagProfilePlatformFilterChatActionByPolicyModule (upval)
		return not FFlagProfilePlatformFilterChatActionByPolicyModule or p1.getCanSeeChatTab()
	end)
end