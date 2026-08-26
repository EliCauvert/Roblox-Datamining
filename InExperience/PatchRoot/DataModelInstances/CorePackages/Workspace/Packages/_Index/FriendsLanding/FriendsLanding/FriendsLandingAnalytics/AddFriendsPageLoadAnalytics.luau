local llama = require(script:FindFirstAncestor("FriendsLanding").dependencies).llama

return function(p1)
	-- upvalues: llama (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in pairs(p1.responseBody.data) do
		table.insert(t, table.concat(llama.List.map(v.mutualFriendsList, function(p2)
			return p2
		end), ","))
		table.insert(t_1, if v.friendRequest.sourceUniverseId then v.friendRequest.sourceUniverseId else 0)
		table.insert(t_2, v.friendRequest.senderId)
		table.insert(t_3, i)
	end
	return {
		page = "friendRequests",
		requestingUserId = table.concat(t_2, ","),
		gamesContext = table.concat(t_1, ","),
		absPosition = table.concat(t_3, ","),
		mutualFriendsContext = table.concat(t, ";")
	}
end