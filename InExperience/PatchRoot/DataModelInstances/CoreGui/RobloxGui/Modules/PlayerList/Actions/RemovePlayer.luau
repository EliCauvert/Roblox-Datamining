return require(script.Parent.Parent.ActionCreator)("RemovePlayer", function(p1)
	return { player = p1, userId = p1.UserId }
end)