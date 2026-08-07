local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local useAppPolicy = require(profileShareLinks.Parent.UniversalAppPolicy).useAppPolicy
local profileSharePolicyEnumModule = require(profileShareLinks.Enums.ProfileSharePolicyEnum)

return function() --[[ line: 7 ]]
	-- upvalues: useAppPolicy (ref), profileSharePolicyEnumModule (ref)
	return useAppPolicy(function(p0) --[[ line: 8 ]]
		-- upvalues: profileSharePolicyEnumModule (copy)
		return if p0.getProfileShareLinkEnabled() then profileSharePolicyEnumModule.Share elseif p0.getProfileCopyLinkEnabled() then profileSharePolicyEnumModule.Copy else profileSharePolicyEnumModule.Disabled
	end)
end