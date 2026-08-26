local isUserChatEnabledModule = require(script:FindFirstAncestor("ExpChat").isUserChatEnabled)

return function(p1)
	-- upvalues: isUserChatEnabledModule (ref)
	return isUserChatEnabledModule(p1) or p1 == "NoOne"
end