local function resultHandler(Thread, Resumed, ...)
	if not Resumed then
		error(debug.traceback(Thread, (...)), 2)
	end
	if coroutine.status(Thread) ~= "dead" then
		error(debug.traceback(Thread, "Attempted to yield inside changed event!"), 2)
	end
	return ...
end

return function(Callback, ...)
	-- upvalues: resultHandler (copy)
	local Thread = coroutine.create(Callback)
	
	return resultHandler(Thread, coroutine.resume(Thread, ...))
end