local friendsRodux = script:FindFirstAncestor("FriendsRodux")
local parent = friendsRodux.Parent
local roduxModule = require(friendsRodux.Parent.Rodux)
local receivedCountModule = require(script.receivedCount)
local byUserIdModule = require(script.byUserId)
local mutualFriendsModule = require(script.mutualFriends)
local sourceUniverseIdsModule = require(script.sourceUniverseIds)
local nextPageCursorModule = require(script.nextPageCursor)
local sentAtModule = require(script.sentAt)
local originSourceTypeModule = require(script.originSourceType)
local orderModule = require(script.order)
local senderNicknameModule = require(script.senderNickname)
local isUnseenModule = require(script.isUnseen)
local newFriendRequestsCountModule = require(script.newFriendRequestsCount)
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests

return function(p0)
	-- upvalues: roduxModule (ref), receivedCountModule (ref), byUserIdModule (ref), mutualFriendsModule (ref), sourceUniverseIdsModule (ref), nextPageCursorModule (ref), sentAtModule (ref), originSourceTypeModule (ref), orderModule (ref), senderNicknameModule (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref), isUnseenModule (ref), newFriendRequestsCountModule (ref)
	return roduxModule.combineReducers({
		receivedCount = receivedCountModule(p0),
		byUserId = byUserIdModule(p0),
		mutualFriends = mutualFriendsModule(p0),
		sourceUniverseIds = sourceUniverseIdsModule(p0),
		nextPageCursor = nextPageCursorModule(p0),
		sentAt = sentAtModule(p0),
		originSourceType = originSourceTypeModule(p0),
		order = orderModule(p0),
		senderNickname = senderNicknameModule(p0),
		isUnseen = if fFlagAddFriendsPageHighlightUnseenRequests then isUnseenModule(p0) else nil,
		newFriendRequestsCount = newFriendRequestsCountModule(p0)
	})
end