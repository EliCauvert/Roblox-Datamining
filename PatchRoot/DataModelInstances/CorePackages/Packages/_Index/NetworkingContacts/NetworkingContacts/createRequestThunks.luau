-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local parent = script.Parent
local networkRequests = parent.networkRequests
local createUploadContactsByUserModule = require(networkRequests.createUploadContactsByUser)
local createFindContactFriendsModule = require(networkRequests.createFindContactFriends)
local createGetContactEntitiesByContactIdModule = require(networkRequests.createGetContactEntitiesByContactId)
local _ = require(parent.Types.networkRequestsTypes)

return function(p0) --[[ line: 8 ]]
	-- upvalues: createUploadContactsByUserModule (ref), createFindContactFriendsModule (ref), createGetContactEntitiesByContactIdModule (ref)
	return {
		UploadContactsByUser = createUploadContactsByUserModule(p0),
		FindContactFriends = createFindContactFriendsModule(p0),
		GetContactEntitiesByContactId = createGetContactEntitiesByContactIdModule(p0)
	}
end