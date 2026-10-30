return function(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local Items = p1.items or p1
	
	if typeof(Items) ~= "table" then
		return nil
	end
	local List = {}
	
	for Rank, item in Items do
		if typeof(item) == "table" then
			local ItemId = item.item_id
			
			if ItemId ~= nil and ItemId ~= "" then
				table.insert(List, {
					id = tostring(ItemId),
					rank = Rank,
					hasPendingFriendRequest = item.has_pending_friend_request == true
				})
			end
		end
	end
	return List
end