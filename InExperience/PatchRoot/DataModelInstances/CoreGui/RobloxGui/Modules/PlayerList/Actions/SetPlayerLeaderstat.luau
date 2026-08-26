return require(script.Parent.Parent.ActionCreator)("SetPlayerLeaderstat", function(p1, p2, p3)
	return {
		player = p1,
		userId = p1.UserId,
		leaderstat = p2,
		value = p3
	}
end)