local appChat = script:FindFirstAncestor("AppChat")
local useAppPolicyModule = require(appChat.Hooks.useAppPolicy)
local useIsChatEnabledModule = require(appChat.Hooks.useIsChatEnabled)

return function()
	-- upvalues: useAppPolicyModule (ref), useIsChatEnabledModule (ref)
	return if useAppPolicyModule(function(p1)
		return p1.getChatHeaderSearch()
	end) then useIsChatEnabledModule() else false
end