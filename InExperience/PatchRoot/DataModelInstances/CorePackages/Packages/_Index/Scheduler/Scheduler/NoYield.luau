local function resultHandler(Thread, Resumed, ...) --[[ Line: 28 ]]
	if not Resumed then
		local v1 = (...)
		
		if typeof(v1) == "string" then
			error(debug.traceback(Thread, v1), 3)
		else
			error(v1, 3)
		end
	end
	if coroutine.status(Thread) ~= "dead" then
		error(debug.traceback(Thread, "\nYielding is not allowed inside components or hooks.\n\nYielding in a component stalls React's scheduler, freezing the entire application until the yield completes.\nCheck the stack trace below to find the exact location of the yield.\n\nFor more details and how to fix this, see: go/react-yield-error\n"), 3)
	end
	return ...
end

return function(Callback, ...) --[[ Line: 52 | Named "NoYield" ]]
	-- upvalues: resultHandler (copy)
	local Thread = coroutine.create(Callback)
	
	return resultHandler(Thread, coroutine.resume(Thread, ...))
end