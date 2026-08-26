return function(p1)
	local thread = coroutine.create(p1)
	
	return (function(p2, p3, ...)
		return if p3 then if coroutine.status(p2) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread))
end