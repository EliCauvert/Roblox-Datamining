return function(Callback)
	local Thread = coroutine.create(Callback)
	
	return (function(Thread, p1, ...)
		return if p1 and coroutine.status(Thread) == "dead" then ... else nil
	end)(Thread, coroutine.resume(Thread))
end