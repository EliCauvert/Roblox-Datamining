return function(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		game:DefineFastFlag(p1, p2 or false)
	end)
	
	return if ok or not status:match("The current thread cannot call") then function()
		-- upvalues: p1 (ref)
		return game:GetFastFlag(p1)
	end else function()
		-- upvalues: p1 (ref)
		return p1:match("^Debug") == nil
	end
end