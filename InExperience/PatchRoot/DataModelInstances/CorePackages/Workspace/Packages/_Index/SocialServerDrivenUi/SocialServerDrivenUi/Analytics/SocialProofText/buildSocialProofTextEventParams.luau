local function _(p1)
	local Number: number? = tonumber(if typeof(p1) == "table" then p1.userId or p1.user_id else p1)
	
	return if Number then string.format("%d", Number) else nil
end

return function(p1)
	if p1.universeId == nil then
		return nil
	end
	local List = {}
	
	if typeof(p1.users) == "table" then
		for _, user in p1.users do
			local Number: number? = tonumber(if typeof(user) == "table" then user.userId or user.user_id else user)
			local Formatted = if Number then string.format("%d", Number) else nil
			
			if Formatted then
				table.insert(List, Formatted)
			end
		end
	end
	local List1 = {
		table.unpack(List, 1, (math.min(tonumber(p1.avatarMax) or 2, #List)))
	}
	
	return {
		universeId = tostring(p1.universeId),
		placeId = if p1.placeId == nil then "" else tostring(p1.placeId),
		totalConnections = tonumber(p1.totalConnections) or #List,
		shownUserIds = table.concat(List1, ","),
		shownUserCount = #List1,
		namedUserId = List[1] or "",
		page = p1.page or ""
	}
end