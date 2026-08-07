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

return function(p0) --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), receivedCountModule (ref), byUserIdModule (ref), mutualFriendsModule (ref), sourceUniverseIdsModule (ref), nextPageCursorModule (ref), sentAtModule (ref), originSourceTypeModule (ref), orderModule (ref), senderNicknameModule (ref)
	return roduxModule.combineReducers({
		receivedCount = receivedCountModule(p0),
		byUserId = byUserIdModule(p0),
		mutualFriends = mutualFriendsModule(p0),
		sourceUniverseIds = sourceUniverseIdsModule(p0),
		nextPageCursor = nextPageCursorModule(p0),
		sentAt = sentAtModule(p0),
		originSourceType = originSourceTypeModule(p0),
		order = orderModule(p0),
		senderNickname = senderNicknameModule(p0)
	})
end