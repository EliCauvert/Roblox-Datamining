return require(script.Parent.Parent.ActionCreator)("SetPlayerIsLocalPlayer", function(p0, p1)
	return { player = p0, userId = p0.UserId, isLocalPlayer = p1 }
end)