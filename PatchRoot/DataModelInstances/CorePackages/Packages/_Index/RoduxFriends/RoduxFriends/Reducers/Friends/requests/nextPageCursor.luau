-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:06 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local roduxModule = require(parent.Parent.Rodux)
local _ = require(parent.roduxFriendsTypes)

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxModule (ref)
	local friendsNetworking = p0.friendsNetworking
	
	return roduxModule.createReducer(nil, {
		[friendsNetworking.GetFriendRequests.Succeeded.name] = function(_, p1) --[[ line: 13 ]]
			return p1.responseBody.nextPageCursor
		end,
		[friendsNetworking.DeclineAllFriendRequests.Succeeded.name] = function(_, _) --[[ line: 19 ]]
			return nil
		end
	})
end