local isUserChatEnabledModule = require(script:FindFirstAncestor("ExpChat").isUserChatEnabled)

return function(p0)
	-- upvalues: isUserChatEnabledModule (ref)
	return isUserChatEnabledModule(p0) or p0 == "NoOne"
end