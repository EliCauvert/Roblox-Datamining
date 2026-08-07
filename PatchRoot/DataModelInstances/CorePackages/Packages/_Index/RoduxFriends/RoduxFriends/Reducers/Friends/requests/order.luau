-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:06 2026 Pacific Standard Time.

local roduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local t = {}

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxModule (ref), t (ref)
	return roduxModule.createReducer(t, {
		[p0.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p1, p2) --[[ line: 13 ]]
			p1 = p1 or {}
			local count = p1.count or 0
			local requestsById = p1.requestsById or {}
			local data = p2.responseBody.data
			local nextPageCursor = p2.responseBody.nextPageCursor
			
			if nextPageCursor == p1.lastCursor and nextPageCursor ~= nil then
				return p1
			end
			for i, v in ipairs(data) do
				local var5 = count + i
				
				if not requestsById[tostring(v.id)] then
					requestsById[tostring(v.id)] = var5
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