local function resultHandler(p0, p1, ...)
	if not p1 then
		error(debug.traceback(p0, ...), 2)
	end
	if coroutine.status(p0) ~= "dead" then
		error(debug.traceback(p0, "Attempted to yield inside changed event!"), 2)
	end
	return ...
end

return function(p2, ...)
	-- upvalues: resultHandler (ref)
	local thread = coroutine.create(p2)
	
	return resultHandler(thread, coroutine.resume(thread, ...))
end