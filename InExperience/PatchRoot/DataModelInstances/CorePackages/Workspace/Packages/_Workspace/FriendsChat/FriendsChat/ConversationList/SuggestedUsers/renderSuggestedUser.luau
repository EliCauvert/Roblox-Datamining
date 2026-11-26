local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChat.ConversationListTrailingItems)
local FriendRequestRowContainerModule = require(script.Parent.FriendRequestRow.FriendRequestRowContainer)
local InServerUserRowContainerModule = require(script.Parent.InServerUserRow.InServerUserRowContainer)
local SuggestedUserRowPlaceholderModule = require(script.Parent.SuggestedUserRowPlaceholder)

return function(p1, OnConversationActivated)
	-- upvalues: ReactModule (copy), SuggestedUserRowPlaceholderModule (copy), FriendRequestRowContainerModule (copy), InServerUserRowContainerModule (copy)
	return if p1.kind == "suggestedUserPlaceholder" then ReactModule.createElement(SuggestedUserRowPlaceholderModule) elseif p1.source == "friendRequest" then if p1.request == nil then nil else ReactModule.createElement(FriendRequestRowContainerModule, {
		request = p1.request,
		onConversationActivated = OnConversationActivated
	}) else ReactModule.createElement(InServerUserRowContainerModule, {
		userId = p1.userId,
		onConversationActivated = OnConversationActivated
	})
end