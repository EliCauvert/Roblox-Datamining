local Parent = script:FindFirstAncestor("AddFriends").Parent
local AddFriendsStateModule = require(Parent.AddFriendsState)
local AddFriendsSelectorFunction = AddFriendsStateModule.AddFriendsSelector
local LlamaModule = require(Parent.llama)
local RoduxPresence = AddFriendsStateModule.RoduxPresence
local FFlagFriendRequestNicknames = require(Parent.SharedFlags).FFlagFriendRequestNicknames
local SortFriendRequestsByOrderModule = require(script.Parent.sortFriendRequestsByOrder)
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor

return function(p1)
	-- upvalues: AddFriendsSelectorFunction (copy), LlamaModule (copy), FFlagAddFriendsRenderTileRefactor (copy), RoduxPresence (copy), FFlagFriendRequestNicknames (copy), SortFriendRequestsByOrderModule (copy)
	local FriendsRequestsByUserId = AddFriendsSelectorFunction(p1, "Friends.requests.byUserId")
	
	return if FriendsRequestsByUserId then SortFriendRequestsByOrderModule((LlamaModule.List.map(LlamaModule.Dictionary.keys(FriendsRequestsByUserId), function(Id)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy), FFlagAddFriendsRenderTileRefactor (upval), LlamaModule (upval), RoduxPresence (upval), FFlagFriendRequestNicknames (upval)
		local FriendsRequestsOrderRequestsByIdS = AddFriendsSelectorFunction(p1, "Friends.requests.order.requestsById.%s", Id)
		
		return if FFlagAddFriendsRenderTileRefactor then { id = Id, order = FriendsRequestsOrderRequestsByIdS } else LlamaModule.Dictionary.join(AddFriendsSelectorFunction(p1, "Users.byUserId.%s", Id), RoduxPresence.Selectors.getUserPresenceByUserId(p1, Id), {
			sentAt = AddFriendsSelectorFunction(p1, "Friends.requests.sentAt.%s", Id)
		}, {
			mutualFriends = AddFriendsSelectorFunction(p1, "Friends.requests.mutualFriends.%s", Id)
		}, {
			contactName = AddFriendsSelectorFunction(p1, "Friends.contactNamesByUserId.%s", Id)
		}, { order = FriendsRequestsOrderRequestsByIdS }, {
			senderNickname = if FFlagFriendRequestNicknames then AddFriendsSelectorFunction(p1, `Friends.requests.senderNickname.{Id}`) else nil
		})
	end))) else {}
end