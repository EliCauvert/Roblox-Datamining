local roduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref)
	return roduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3)
			p2 = p2 or {}
			local count = p2.count or 0
			local requestsById = p2.requestsById or {}
			local data = p3.responseBody.data
			local nextPageCursor = p3.responseBody.nextPageCursor
			
			if nextPageCursor == p2.lastCursor and nextPageCursor ~= nil then
				return p2
			end
			for i, v in ipairs(data) do
				local var1 = count + i
				
				if not requestsById[tostring(v.id)] then
					requestsById[tostring(v.id)] = var1
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