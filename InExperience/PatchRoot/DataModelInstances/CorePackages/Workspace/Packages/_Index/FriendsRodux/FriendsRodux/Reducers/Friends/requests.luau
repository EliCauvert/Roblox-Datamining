local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local RoduxModule = require(FriendsRodux.Parent.Rodux)
local ReceivedCountModule = require(script.receivedCount)
local ByUserIdModule = require(script.byUserId)
local MutualFriendsModule = require(script.mutualFriends)
local SourceUniverseIdsModule = require(script.sourceUniverseIds)
local NextPageCursorModule = require(script.nextPageCursor)
local SentAtModule = require(script.sentAt)
local OriginSourceTypeModule = require(script.originSourceType)
local OrderModule = require(script.order)
local SenderNicknameModule = require(script.senderNickname)
local IsUnseenModule = require(script.isUnseen)
local NewFriendRequestsCountModule = require(script.newFriendRequestsCount)
local FFlagAddFriendsPageHighlightUnseenRequests = require(FriendsRodux.Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests

return function(p1)
	-- upvalues: RoduxModule (copy), ReceivedCountModule (copy), ByUserIdModule (copy), MutualFriendsModule (copy), SourceUniverseIdsModule (copy), NextPageCursorModule (copy), SentAtModule (copy), OriginSourceTypeModule (copy), OrderModule (copy), SenderNicknameModule (copy), FFlagAddFriendsPageHighlightUnseenRequests (copy), IsUnseenModule (copy), NewFriendRequestsCountModule (copy)
	return RoduxModule.combineReducers({
		receivedCount = ReceivedCountModule(p1),
		byUserId = ByUserIdModule(p1),
		mutualFriends = MutualFriendsModule(p1),
		sourceUniverseIds = SourceUniverseIdsModule(p1),
		nextPageCursor = NextPageCursorModule(p1),
		sentAt = SentAtModule(p1),
		originSourceType = OriginSourceTypeModule(p1),
		order = OrderModule(p1),
		senderNickname = SenderNicknameModule(p1),
		isUnseen = if FFlagAddFriendsPageHighlightUnseenRequests then IsUnseenModule(p1) else nil,
		newFriendRequestsCount = NewFriendRequestsCountModule(p1)
	})
end