return function(p0, p1)
	local ok, status = pcall(function()
		-- upvalues: p0 (ref), p1 (ref)
		game:DefineFastString(p0, p1)
	end)
	
	return if ok or not status:match("The current thread cannot call") then function()
		-- upvalues: p0 (ref)
		return game:GetFastString(p0)
	end else function()
		-- upvalues: p1 (ref)
		return p1
	end
end