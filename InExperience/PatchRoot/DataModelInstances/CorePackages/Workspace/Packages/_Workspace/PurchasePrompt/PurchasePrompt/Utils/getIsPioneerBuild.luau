return function() --[[ line: 2 ]]
	local ok, status = pcall(function() --[[ line: 3 ]]
		return game.PioneerSource == Enum.PioneerSource.DaveyBazooka
	end)
	
	return ok and status
end