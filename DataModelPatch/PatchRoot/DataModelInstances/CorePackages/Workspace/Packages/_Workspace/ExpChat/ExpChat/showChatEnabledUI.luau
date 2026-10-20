local IsUserChatEnabledModule = require(script:FindFirstAncestor("ExpChat").isUserChatEnabled)

return function(p1)
	-- upvalues: IsUserChatEnabledModule (copy)
	return IsUserChatEnabledModule(p1) or p1 == "NoOne"
end