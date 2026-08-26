local function resultHandler(p1, p2, ...)
	if not p2 then
		error(debug.traceback(p1, ...), 2)
	end
	if coroutine.status(p1) ~= "dead" then
		error(debug.traceback(p1, "Attempted to yield inside changed event!"), 2)
	end
	return ...
end

return function(p3, ...)
	-- upvalues: resultHandler (ref)
	local thread = coroutine.create(p3)
	
	return resultHandler(thread, coroutine.resume(thread, ...))
end