local parent = script:FindFirstAncestor("AppChat").Parent
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useFriendsListOrderedByPresence = require(parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence
local userModel = require(parent.UserLib).Models.UserModel
local convertPresenceTypeToUserPresenceModule = require(script.Parent.Utils.convertPresenceTypeToUserPresence)

function useFetchPaginatedFriends() --[[ line: 14 ]]
	-- upvalues: useLocalUserId (ref), useLocalization (ref), useFriendsListOrderedByPresence (ref), convertPresenceTypeToUserPresenceModule (ref), userModel (ref)
	local var1 = useLocalization({
		offlinePresenceText = "Common.Presence.Label.Offline",
		onlinePresenceText = "Common.Presence.Label.Online"
	})
	local var2 = useFriendsListOrderedByPresence({ pageSize = 50, userId = useLocalUserId() })
	local t = {}
	
	if var2.onlineFriends and var2.offlineFriends then
		for i, v in var2.onlineFriends do
			local id = v.id
			local var4 = convertPresenceTypeToUserPresenceModule(if v.presence then v.presence.userPresenceType else nil)
			local var5 = nil
			
			if var4 == userModel.PresenceType.ONLINE then
				var5 = var1.onlinePresenceText
			elseif var4 == userModel.PresenceType.IN_GAME then
				var5 = if v.presence then v.presence.lastLocation else ""
			elseif var4 == userModel.PresenceType.IN_STUDIO then
				var5 = "Studio"
			end
			table.insert(t, {
				id = id,
				presence = var4,
				presenceText = var5,
				thumbnail = `rbxthumb://type=AvatarHeadShot&id={id}&w=150&h=150`
			})
		end
		for i, v_1 in var2.offlineFriends do
			local id = v_1.id
			table.insert(t, {
				id = id,
				presence = userModel.PresenceType.OFFLINE,
				presenceText = var1.offlinePresenceText,
				thumbnail = `rbxthumb://type=AvatarHeadShot&id={id}&w=150&h=150`
			})
		end
	end
	return t, var2.fetchMoreFriends, var2.isEndOfList
end

return useFetchPaginatedFriends