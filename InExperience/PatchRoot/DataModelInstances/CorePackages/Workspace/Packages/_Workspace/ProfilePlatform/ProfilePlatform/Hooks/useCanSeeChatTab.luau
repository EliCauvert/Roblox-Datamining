local UseAppPolicyFunction = require(script:FindFirstAncestor("ProfilePlatform").Parent.UniversalAppPolicy).useAppPolicy

return function() --[[ Line: 6 ]]
	-- upvalues: UseAppPolicyFunction (copy)
	return UseAppPolicyFunction(function(p1) --[[ Line: 7 ]]
		return p1.getCanSeeChatTab()
	end)
end