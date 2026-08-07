-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:06 2026 Pacific Standard Time.

local roduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local byUserIdModule = require(script.byUserId)
local bySourceModule = require(script.bySource)
local hasIncomingFriendRequestModule = require(script.hasIncomingFriendRequest)

return function(p0) --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), byUserIdModule (ref), bySourceModule (ref), hasIncomingFriendRequestModule (ref)
	return roduxModule.combineReducers({
		byUserId = byUserIdModule(p0),
		bySource = bySourceModule(p0),
		hasIncomingFriendRequest = hasIncomingFriendRequestModule(p0)
	})
end