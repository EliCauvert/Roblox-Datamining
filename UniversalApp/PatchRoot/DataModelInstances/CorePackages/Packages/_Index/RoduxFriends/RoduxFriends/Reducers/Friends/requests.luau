local roduxModule = require(script:FindFirstAncestor("RoduxFriends").Parent.Rodux)
local receivedCountModule = require(script.receivedCount)
local byUserIdModule = require(script.byUserId)
local mutualFriendsModule = require(script.mutualFriends)
local sourceUniverseIdsModule = require(script.sourceUniverseIds)
local nextPageCursorModule = require(script.nextPageCursor)
local sentAtModule = require(script.sentAt)
local originSourceTypeModule = require(script.originSourceType)
local orderModule = require(script.order)
local senderNicknameModule = require(script.senderNickname)

return function(p1)
	-- upvalues: roduxModule (ref), receivedCountModule (ref), byUserIdModule (ref), mutualFriendsModule (ref), sourceUniverseIdsModule (ref), nextPageCursorModule (ref), sentAtModule (ref), originSourceTypeModule (ref), orderModule (ref), senderNicknameModule (ref)
	return roduxModule.combineReducers({
		receivedCount = receivedCountModule(p1),
		byUserId = byUserIdModule(p1),
		mutualFriends = mutualFriendsModule(p1),
		sourceUniverseIds = sourceUniverseIdsModule(p1),
		nextPageCursor = nextPageCursorModule(p1),
		sentAt = sentAtModule(p1),
		originSourceType = originSourceTypeModule(p1),
		order = orderModule(p1),
		senderNickname = senderNicknameModule(p1)
	})
end