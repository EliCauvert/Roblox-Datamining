local getDeepValueModule = require(script:FindFirstAncestor("AppChat").Utils.getDeepValue)

return function(p1, p2)
	-- upvalues: getDeepValueModule (ref)
	local var1 = getDeepValueModule(p1, string.format("ChatAppReducer.Conversations.%s", p2 or ""))
	
	if not var1 or not var1.usersTyping or not p1.Users then
		return {}
	end
	local usersTyping = var1.usersTyping
	local users = p1.Users
	local t = {}
	
	for i, v in pairs(usersTyping) do
		if i ~= p1.LocalUserId and v then
			table.insert(t, users[i])
		end
	end
	return t
end