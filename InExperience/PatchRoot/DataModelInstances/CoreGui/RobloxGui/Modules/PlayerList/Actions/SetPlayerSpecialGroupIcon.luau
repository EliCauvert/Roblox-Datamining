return require(script.Parent.Parent.ActionCreator)("SetPlayerSpecialGroupIcon", function(p1, p2)
	return { player = p1, userId = p1.UserId, specialGroupIcon = p2 }
end)