local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local roduxModule = require(friendsRodux.Parent.Rodux)
local _ = require(friendsRodux.roduxFriendsTypes)
local t = {}

return function(p0) --[[ line: 11 ]]
	-- upvalues: roduxModule (ref), t (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p1, p2) --[[ line: 15 ]]
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
					requestsById[tostring(v.id)] = var6
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