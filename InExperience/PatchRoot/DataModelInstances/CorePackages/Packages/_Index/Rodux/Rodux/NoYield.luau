local function resultHandler(Thread, Resumed, ...) --[[ Line: 12 ]]
	if not Resumed then
		error(debug.traceback(Thread, (...)), 2)
	end
	if coroutine.status(Thread) ~= "dead" then
		error(debug.traceback(Thread, "Attempted to yield inside changed event!"), 2)
	end
	return ...
end

return function(Callback, ...) --[[ Line: 25 | Named "NoYield" ]]
	-- upvalues: resultHandler (copy)
	local Thread = coroutine.create(Callback)
	
	return resultHandler(Thread, coroutine.resume(Thread, ...))
end