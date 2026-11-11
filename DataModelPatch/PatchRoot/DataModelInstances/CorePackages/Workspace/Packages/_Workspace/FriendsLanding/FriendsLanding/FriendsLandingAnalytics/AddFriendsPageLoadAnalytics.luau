local Llama = require(script:FindFirstAncestor("FriendsLanding").dependencies).llama

return function(p1)
	-- upvalues: Llama (copy)
	local List = {}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	
	for i, entry in pairs(p1.responseBody.data) do
		table.insert(List, table.concat(Llama.List.map(entry.mutualFriendsList, function(p2)
			return p2
		end), ","))
		table.insert(List1, if entry.friendRequest.sourceUniverseId then entry.friendRequest.sourceUniverseId else 0)
		table.insert(List2, entry.friendRequest.senderId)
		table.insert(List3, i)
	end
	return {
		page = "friendRequests",
		requestingUserId = table.concat(List2, ","),
		gamesContext = table.concat(List1, ","),
		absPosition = table.concat(List3, ","),
		mutualFriendsContext = table.concat(List, ";")
	}
end