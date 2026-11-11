return require(script.Parent.Parent.ActionCreator)("SetGameStatAddId", function(StatName, ServerAddId)
	return { statName = StatName, serverAddId = ServerAddId }
end)