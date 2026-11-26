local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FriendRequests)
local FriendsHydrationReactModule = require(Parent.FriendsHydrationReact)
local UserListModule = require(Parent.UserList)
local _ = require(FriendsChat.ConversationList.SuggestedUsers.SuggestedUserTypes)
local ShowSuggestedUserToastModule = require(FriendsChat.ConversationList.SuggestedUsers.showSuggestedUserToast)
local UseFriendChatCtaModule = require(FriendsChat.ConversationList.SuggestedUsers.useFriendChatCta)
local ButtonTypes = UserListModule.Enums.ButtonTypes
local RowSize = UserListModule.Enums.RowSize
local config = { skipFetch = true }

return function(p1)
	-- upvalues: FriendsHydrationReactModule (copy), config (copy), UseFriendChatCtaModule (copy), ReactModule (copy), ButtonTypes (copy), RowSize (copy), ShowSuggestedUserToastModule (copy)
	local Request = p1.request
	local Id = Request.id
	local IsUseGetFriendshipStatusResultMatch = FriendsHydrationReactModule.useGetFriendshipStatus(Id, config) == Enum.FriendStatus.Friend
	local _, UseFriendChatCtaModuleResult2 = UseFriendChatCtaModule(Id, IsUseGetFriendshipStatusResultMatch, p1.onConversationActivated)
	
	return {
		hideDeclineCta = true,
		hidePresence = true,
		request = Request,
		rowSize = RowSize.Small,
		acceptedCta = ReactModule.useMemo(function()
			-- upvalues: ButtonTypes (upval), UseFriendChatCtaModuleResult2 (copy)
			return {
				type = ButtonTypes.Chat,
				onActivated = UseFriendChatCtaModuleResult2
			}
		end, { UseFriendChatCtaModuleResult2 }),
		onActivated = if IsUseGetFriendshipStatusResultMatch then UseFriendChatCtaModuleResult2 else nil,
		showToast = ShowSuggestedUserToastModule
	}
end