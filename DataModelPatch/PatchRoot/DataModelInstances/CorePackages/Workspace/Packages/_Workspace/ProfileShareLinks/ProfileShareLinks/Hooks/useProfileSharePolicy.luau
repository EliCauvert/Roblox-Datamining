local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local UseAppPolicyFunction = require(ProfileShareLinks.Parent.UniversalAppPolicy).useAppPolicy
local ProfileSharePolicyEnumModule = require(ProfileShareLinks.Enums.ProfileSharePolicyEnum)

return function()
	-- upvalues: UseAppPolicyFunction (copy), ProfileSharePolicyEnumModule (copy)
	return (UseAppPolicyFunction(function(p1)
		-- upvalues: ProfileSharePolicyEnumModule (upval)
		local ProfileCopyLinkEnabled = p1.getProfileCopyLinkEnabled()
		
		return if p1.getProfileShareLinkEnabled() then ProfileSharePolicyEnumModule.Share elseif ProfileCopyLinkEnabled then ProfileSharePolicyEnumModule.Copy else ProfileSharePolicyEnumModule.Disabled
	end))
end