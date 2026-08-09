local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local useAppPolicy = require(profilePlatform.Parent.UniversalAppPolicy).useAppPolicy
local fFlagProfilePlatformFilterChatActionByPolicyModule = require(profilePlatform.Flags.FFlagProfilePlatformFilterChatActionByPolicy)

return function() --[[ line: 9 ]]
	-- upvalues: useAppPolicy (ref), fFlagProfilePlatformFilterChatActionByPolicyModule (ref)
	return useAppPolicy(function(p0) --[[ line: 10 ]]
		-- upvalues: fFlagProfilePlatformFilterChatActionByPolicyModule (copy)
		return if fFlagProfilePlatformFilterChatActionByPolicyModule then p0.getCanSeeChatTab() else true
	end)
end