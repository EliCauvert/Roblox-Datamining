local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useFriendsListOrderedByPresence = require(parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence

function useFetchPaginatedFriendIds()
	-- upvalues: useLocalUserId (ref), reactModule (ref), useFriendsListOrderedByPresence (ref), cryoModule (ref), userProfilesModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = useFriendsListOrderedByPresence({ pageSize = 50, userId = useLocalUserId() })
	local var3 = cryoModule.List.map(cryoModule.List.join(var2.onlineFriends, var2.offlineFriends), function(p1)
		return p1.id
	end)
	local var4 = cryoModule.List.toSet(var1.current)
	local var5 = cryoModule.List.filter(var3, function(p1)
		-- upvalues: var4 (ref)
		return not var4[p1]
	end)
	
	if #var5 > 0 then
		userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds(var5)
	end
	var1.current = var3
	
	return var1.current, var2.fetchMoreFriends, var2.isEndOfList, var2
end

return useFetchPaginatedFriendIds