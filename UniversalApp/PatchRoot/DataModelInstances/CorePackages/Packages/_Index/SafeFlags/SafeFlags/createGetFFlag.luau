return function(p0, p1)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), p1 (ref)
		game:DefineFastFlag(p0, p1 or false)
	end)
	
	return if ok or not status:match("The current thread cannot call") then function()
		-- upvalues: p0 (ref)
		return game:GetFastFlag(p0)
	end else function()
		-- upvalues: p0 (ref)
		return p0:match("^Debug") == nil
	end
end