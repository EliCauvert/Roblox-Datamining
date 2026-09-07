return function()
	local ok, status = pcall(function()
		return game.PioneerSource == Enum.PioneerSource.DaveyBazooka
	end)
	
	return ok and status
end