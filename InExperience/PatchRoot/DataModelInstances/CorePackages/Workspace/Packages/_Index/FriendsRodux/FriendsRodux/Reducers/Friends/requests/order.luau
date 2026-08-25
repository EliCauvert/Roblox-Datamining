local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(parent.Rodux)
local _ = require(friendsRodux.roduxFriendsTypes)
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests
local fFlagAddFriendsRefreshRequestOrder = require(parent.SharedFlags).FFlagAddFriendsRefreshRequestOrder
local t = {}

local function parkTrailingScores(p0, p1)
	local t = {}
	
	for i, v in ipairs(p1) do
		t[tostring(v.id)] = true
	end
	local t_1 = {}
	
	for i_1, v_1 in pairs(if p0 then p0.requestsById else {}) do
		if not t[i_1] then
			table.insert(t_1, { userId = i_1, score = v_1 })
		end
	end
	table.sort(t_1, function(p2, p3)
		return p2.score < p3.score
	end)
	local t_2 = {}
	
	for i_2, v_2 in ipairs(t_1) do
		t_2[v_2.userId] = #p1 + i_2
	end
	return t_2, #t_1
end

return function(p4)
	-- upvalues: roduxModule (ref), t (ref), fFlagAddFriendsRefreshRequestOrder (ref), parkTrailingScores (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref)
	return roduxModule.createReducer(t, {
		[p4.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p5, p6)
			-- upvalues: fFlagAddFriendsRefreshRequestOrder (copy), parkTrailingScores (copy), fFlagAddFriendsPageHighlightUnseenRequests (copy)
			local var7 = 0
			
			if fFlagAddFriendsRefreshRequestOrder and p6.queryArgs and p6.queryArgs.cursor == nil then
				local var8, var9 = parkTrailingScores(p5, p6.responseBody.data)
				p5 = { requestsById = var8 }
				var7 = var9
			end
			p5 = p5 or {}
			local count = p5.count or 0
			local requestsById = p5.requestsById or {}
			local data = p6.responseBody.data
			local nextPageCursor = p6.responseBody.nextPageCursor
			
			if nextPageCursor == p5.lastCursor and nextPageCursor ~= nil then
				return p5
			end
			for i, v in ipairs(data) do
				local var14 = count + i
				
				if not requestsById[tostring(v.id)] then
					if fFlagAddFriendsRefreshRequestOrder then
						requestsById[tostring(v.id)] = var14
					elseif not fFlagAddFriendsPageHighlightUnseenRequests then
						requestsById[tostring(v.id)] = var14
					elseif v.isUnseen then
						requestsById[tostring(v.id)] = -(tonumber(string.gsub(string.gsub(v.friendRequest.sentAt, "%.%d+Z$", "Z"), "%D", "")) or 0)
					else
						requestsById[tostring(v.id)] = var14
					end
				end
			end
			local var13 = count + #data
			
			if fFlagAddFriendsRefreshRequestOrder then
				var13 += var7
			end
			return {
				count = var13,
				lastCursor = nextPageCursor,
				requestsById = requestsById
			}
		end
	})
end