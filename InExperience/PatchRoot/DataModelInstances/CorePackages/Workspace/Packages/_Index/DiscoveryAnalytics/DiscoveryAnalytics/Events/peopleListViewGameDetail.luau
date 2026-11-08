local Players = game:GetService("Players")

return function(p1, FriendId, Position, AbsolutePosition, RootPlaceId, FromWhere)
	-- upvalues: Players (copy)
	assert(type(FriendId) == "string", "Expected friendId to be a string")
	assert(type(Position) == "number", "Expected position to be a number")
	assert(type(RootPlaceId) == "number", "Expected number to be a string")
	assert(type(FromWhere) == "string", "Expected fromWhere to be a string")
	assert(type(AbsolutePosition) == "number", "Expected absolutePosition to be a number")
	p1:setRBXEventStream("contactFriendFinder", "goToGameDetailInPeopleList", {
		uid = tostring(Players.LocalPlayer.UserId),
		friendId = FriendId,
		position = Position,
		absolutePosition = AbsolutePosition,
		rootPlaceId = RootPlaceId,
		fromWhere = FromWhere
	})
end