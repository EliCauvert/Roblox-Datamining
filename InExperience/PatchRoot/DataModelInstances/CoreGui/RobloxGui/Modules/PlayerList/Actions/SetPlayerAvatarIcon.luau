return require(script.Parent.Parent.ActionCreator)("SetPlayerAvatarIcon", function(p1, p2)
	return { player = p1, userId = p1.UserId, avatarIcon = p2 }
end)