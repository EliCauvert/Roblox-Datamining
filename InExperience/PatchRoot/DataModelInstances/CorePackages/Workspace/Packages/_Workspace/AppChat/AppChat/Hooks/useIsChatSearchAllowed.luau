local AppChat = script:FindFirstAncestor("AppChat")
local UseAppPolicyModule = require(AppChat.Hooks.useAppPolicy)
local UseIsChatEnabledModule = require(AppChat.Hooks.useIsChatEnabled)

return function() --[[ Line: 10 ]]
	-- upvalues: UseAppPolicyModule (copy), UseIsChatEnabledModule (copy)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p1) --[[ Line: 11 ]]
		return p1.getChatHeaderSearch()
	end)
	local UseIsChatEnabledModuleResult = UseIsChatEnabledModule()
	
	return UseAppPolicyModuleResult and UseIsChatEnabledModuleResult or false
end