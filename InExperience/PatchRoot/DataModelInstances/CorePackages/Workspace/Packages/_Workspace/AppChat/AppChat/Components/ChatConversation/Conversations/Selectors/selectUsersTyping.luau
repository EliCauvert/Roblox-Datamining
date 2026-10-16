local GetDeepValueModule = require(script:FindFirstAncestor("AppChat").Utils.getDeepValue)

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: GetDeepValueModule (copy)
	local DeepValueModule = GetDeepValueModule(p1, string.format("ChatAppReducer.Conversations.%s", p2 or ""))
	
	if not DeepValueModule or not DeepValueModule.usersTyping or not p1.Users then
		return {}
	end
	local Users = p1.Users
	local List = {}
	
	for i, value in pairs(DeepValueModule.usersTyping) do
		if i ~= p1.LocalUserId and value then
			table.insert(List, Users[i])
		end
	end
	return List
end