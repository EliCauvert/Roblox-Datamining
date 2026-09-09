return function(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local items = p1.items or p1
	
	if typeof(items) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in items do
		if typeof(v) == "table" then
			local itemId = v.item_id
			
			if itemId ~= nil and itemId ~= "" then
				table.insert(t, {
					id = tostring(itemId),
					rank = i,
					hasPendingFriendRequest = v.has_pending_friend_request == true
				})
			end
		end
	end
	return t
end