return function(p0)
	local thread = coroutine.create(p0)
	
	return (function(p1, p2, ...)
		return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread))
end