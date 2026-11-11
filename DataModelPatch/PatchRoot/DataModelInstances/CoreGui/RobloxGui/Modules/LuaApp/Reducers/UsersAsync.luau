local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReceivedAllFriendsModule = require(Modules.LuaApp.Actions.ReceivedAllFriends)
local ReceivedUserPresence = require(game:GetService("CorePackages").Workspace.Packages.UserLib).Actions.ReceivedUserPresence
local RequestAllFriendsModule = require(Modules.LuaApp.Actions.RequestAllFriends)
local RequestUserPresenceModule = require(Modules.LuaApp.Actions.RequestUserPresence)
local ImmutableModule = require(Modules.Common.Immutable)

return function(p1, p2)
	-- upvalues: RequestAllFriendsModule (copy), ImmutableModule (copy), ReceivedAllFriendsModule (copy), RequestUserPresenceModule (copy), ReceivedUserPresence (copy)
	local P0 = p1 or {}
	
	if p2.type == RequestAllFriendsModule.name then
		return ImmutableModule.JoinDictionaries(P0, { allFriendsIsFetching = true })
	end
	if p2.type == ReceivedAllFriendsModule.name then
		return ImmutableModule.JoinDictionaries(P0, { allFriendsIsFetching = false })
	end
	if p2.type == RequestUserPresenceModule.name then
		return ImmutableModule.JoinDictionaries(P0, {
			[p2.userId] = ImmutableModule.JoinDictionaries(P0[p2.userId] or {}, { presenceIsFetching = true })
		})
	end
	if p2.type == ReceivedUserPresence.name then
		local Entry = P0[p2.userId]
		
		if Entry then
			return ImmutableModule.JoinDictionaries(P0, {
				[p2.userId] = ImmutableModule.JoinDictionaries(Entry, { presenceIsFetching = false })
			})
		end
	end
	return P0
end