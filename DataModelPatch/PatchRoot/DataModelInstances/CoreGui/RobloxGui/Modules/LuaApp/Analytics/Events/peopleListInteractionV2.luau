local Players = game:GetService("Players")

return function(p1, Btn, FriendId, Position, p2, AbsolutePosition, p3)
	-- upvalues: Players (copy)
	assert(type(Btn) == "string", "Expected buttonName to be a string")
	assert(type(FriendId) == "string", "Expected friendId to be a string")
	assert(type(Position) == "number", "Expected position to be a number")
	assert(p2 == nil or type(p2) == "string", "Expected context to be nil or string")
	assert(type(AbsolutePosition) == "number", "Expected absolutePosition to be a number")
	assert(p3 == nil or type(p3) == "table", "Expected extraArgs to be nil or table")
	p1:setRBXEventStream(p2 or "contactFriendFinder", "buttonClick", {
		uid = tostring(Players.LocalPlayer.UserId),
		friendId = FriendId,
		position = Position,
		btn = Btn,
		absolutePosition = AbsolutePosition,
		universeId = if p3 then p3.universeId else nil,
		source = if p3 then p3.source else nil
	})
end