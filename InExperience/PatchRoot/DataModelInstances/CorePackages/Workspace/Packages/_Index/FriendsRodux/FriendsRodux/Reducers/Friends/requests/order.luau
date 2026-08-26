local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(parent.Rodux)
local _ = require(friendsRodux.roduxFriendsTypes)
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests
local fFlagAddFriendsRefreshRequestOrder = require(parent.SharedFlags).FFlagAddFriendsRefreshRequestOrder
local t = {}

local function parkTrailingScores(p1, p2)
	local t = {}
	
	for i, v in ipairs(p2) do
		t[tostring(v.id)] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in pairs(if p1 then p1.requestsById else {}) do
		if not t[i_1] then
			table.insert(t_1, { userId = i_1, score = v_1 })
		end
	end
	table.sort(t_1, function(p3, p4)
		return p3.score < p4.score
	end)
	local t_2 = {}
	
	for i_2, v_2 in ipairs(t_1) do
		t_2[v_2.userId] = #p2 + i_2
	end
	return t_2, #t_1
end

return function(p3)
	-- upvalues: roduxModule (ref), t (ref), fFlagAddFriendsRefreshRequestOrder (ref), parkTrailingScores (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref)
	return roduxModule.createReducer(t, {
		[p3.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p4, p5)
			-- upvalues: fFlagAddFriendsRefreshRequestOrder (copy), parkTrailingScores (copy), fFlagAddFriendsPageHighlightUnseenRequests (copy)
			local var1 = 0
			
			if fFlagAddFriendsRefreshRequestOrder and p5.queryArgs and p5.queryArgs.cursor == nil then
				local var2, var3 = parkTrailingScores(p4, p5.responseBody.data)
				p4 = { requestsById = var2 }
				var1 = var3
			end
			p4 = p4 or {}
			local count = p4.count or 0
			local requestsById = p4.requestsById or {}
			local data = p5.responseBody.data
			local nextPageCursor = p5.responseBody.nextPageCursor
			
			if nextPageCursor == p4.lastCursor and nextPageCursor ~= nil then
				return p4
			end
			for i, v in ipairs(data) do
				local var4 = count + i
				
				if not requestsById[tostring(v.id)] then
					if fFlagAddFriendsRefreshRequestOrder then
						requestsById[tostring(v.id)] = var4
					elseif not fFlagAddFriendsPageHighlightUnseenRequests then
						requestsById[tostring(v.id)] = var4
					elseif v.isUnseen then
						requestsById[tostring(v.id)] = -(tonumber(string.gsub(string.gsub(v.friendRequest.sentAt, "%.%d+Z$", "Z"), "%D", "")) or 0)
					else
						requestsById[tostring(v.id)] = var4
					end
				end
			end
			local var5 = count + #data
			
			if fFlagAddFriendsRefreshRequestOrder then
				var5 += var1
			end
			return {
				count = var5,
				lastCursor = nextPageCursor,
				requestsById = requestsById
			}
		end
	})
end