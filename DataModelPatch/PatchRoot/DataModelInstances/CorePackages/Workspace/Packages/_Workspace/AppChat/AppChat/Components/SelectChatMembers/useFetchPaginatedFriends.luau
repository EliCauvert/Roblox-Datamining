local Parent = script:FindFirstAncestor("AppChat").Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseFriendsListOrderedByPresenceFunction = require(Parent.FriendsCommon).Hooks.useFriendsListOrderedByPresence
local UserModel = require(Parent.UserLib).Models.UserModel
local ConvertPresenceTypeToUserPresenceModule = require(script.Parent.Utils.convertPresenceTypeToUserPresence)

function useFetchPaginatedFriends()
	-- upvalues: UseLocalUserIdFunction (copy), UseLocalizationFunction (copy), UseFriendsListOrderedByPresenceFunction (copy), ConvertPresenceTypeToUserPresenceModule (copy), UserModel (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		offlinePresenceText = "Common.Presence.Label.Offline",
		onlinePresenceText = "Common.Presence.Label.Online"
	})
	local UseFriendsListOrderedByPresenceResult = UseFriendsListOrderedByPresenceFunction({ pageSize = 50, userId = UseLocalUserIdResult })
	local List = {}
	
	if UseFriendsListOrderedByPresenceResult.onlineFriends and UseFriendsListOrderedByPresenceResult.offlineFriends then
		for _, onlineFriend in UseFriendsListOrderedByPresenceResult.onlineFriends do
			local Id = onlineFriend.id
			local ConvertPresenceTypeToUserPresenceModuleResult = ConvertPresenceTypeToUserPresenceModule(if onlineFriend.presence then onlineFriend.presence.userPresenceType else nil)
			table.insert(List, {
				id = Id,
				presence = ConvertPresenceTypeToUserPresenceModuleResult,
				presenceText = if ConvertPresenceTypeToUserPresenceModuleResult == UserModel.PresenceType.ONLINE then UseLocalizationResult.onlinePresenceText elseif ConvertPresenceTypeToUserPresenceModuleResult == UserModel.PresenceType.IN_GAME then if onlineFriend.presence then onlineFriend.presence.lastLocation else "" elseif ConvertPresenceTypeToUserPresenceModuleResult == UserModel.PresenceType.IN_STUDIO then "Studio" else nil,
				thumbnail = `rbxthumb://type=AvatarHeadShot&id={Id}&w=150&h=150`
			})
		end
		for _, offlineFriend in UseFriendsListOrderedByPresenceResult.offlineFriends do
			local Id = offlineFriend.id
			table.insert(List, {
				id = Id,
				presence = UserModel.PresenceType.OFFLINE,
				presenceText = UseLocalizationResult.offlinePresenceText,
				thumbnail = `rbxthumb://type=AvatarHeadShot&id={Id}&w=150&h=150`
			})
		end
	end
	return List, UseFriendsListOrderedByPresenceResult.fetchMoreFriends, UseFriendsListOrderedByPresenceResult.isEndOfList
end

return useFetchPaginatedFriends