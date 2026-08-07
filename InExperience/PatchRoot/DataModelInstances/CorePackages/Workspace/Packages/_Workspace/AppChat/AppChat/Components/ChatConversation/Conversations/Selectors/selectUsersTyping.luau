local getDeepValueModule = require(script:FindFirstAncestor("AppChat").Utils.getDeepValue)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: getDeepValueModule (ref)
	local var1 = getDeepValueModule(p0, string.format("ChatAppReducer.Conversations.%s", p1 or ""))
	
	if not var1 or not var1.usersTyping or not p0.Users then
		return {}
	end
	local usersTyping = var1.usersTyping
	local users = p0.Users
	local t = {}
	
	for i, v in pairs(usersTyping) do
		if i ~= p0.LocalUserId and v then
			table.insert(t, users[i])
		end
	end
	return t
end