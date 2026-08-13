local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(parent.Rodux)
local _ = require(friendsRodux.roduxFriendsTypes)
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests
local t = {}

return function(p0) --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), t (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p1, p2) --[[ line: 18 ]]
			-- upvalues: fFlagAddFriendsPageHighlightUnseenRequests (copy)
			p1 = p1 or {}
			local count = p1.count or 0
			local requestsById = p1.requestsById or {}
			local data = p2.responseBody.data
			local nextPageCursor = p2.responseBody.nextPageCursor
			
			if nextPageCursor == p1.lastCursor and nextPageCursor ~= nil then
				return p1
			end
			for i, v in ipairs(data) do
				local var6 = count + i
				
				if not requestsById[tostring(v.id)] then
					if not fFlagAddFriendsPageHighlightUnseenRequests then
						requestsById[tostring(v.id)] = var6
					elseif v.isUnseen then
						requestsById[tostring(v.id)] = -(tonumber(string.gsub(string.gsub(v.friendRequest.sentAt, "%.%d+Z$", "Z"), "%D", "")) or 0)
					else
						requestsById[tostring(v.id)] = var6
					end
				end
			end
			return {
				count = count + #data,
				lastCursor = nextPageCursor,
				requestsById = requestsById
			}
		end
	})
end