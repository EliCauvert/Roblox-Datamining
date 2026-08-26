return function(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		game:DefineFastString(p1, p2)
	end)
	
	return if ok or not status:match("The current thread cannot call") then function()
		-- upvalues: p1 (ref)
		return game:GetFastString(p1)
	end else function()
		-- upvalues: p2 (ref)
		return p2
	end
end