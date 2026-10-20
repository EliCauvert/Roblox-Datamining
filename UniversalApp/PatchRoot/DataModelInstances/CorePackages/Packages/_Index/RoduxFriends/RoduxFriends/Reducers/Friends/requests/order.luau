local RoduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy)
	return RoduxModule.createReducer(t, {
		[p1.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p2, p3)
			local P1 = p2 or {}
			local Count = P1.count or 0
			local RequestsById = P1.requestsById or {}
			local Data = p3.responseBody.data
			local NextPageCursor = p3.responseBody.nextPageCursor
			
			if NextPageCursor == P1.lastCursor and NextPageCursor ~= nil then
				return P1
			end
			for i, entry in ipairs(Data) do
				local NewCount = Count + i
				
				if not RequestsById[tostring(entry.id)] then
					RequestsById[tostring(entry.id)] = NewCount
				end
			end
			return {
				count = Count + #Data,
				lastCursor = NextPageCursor,
				requestsById = RequestsById
			}
		end
	})
end