local function resultHandler(p1, p2, ...)
	if not p2 then
		local var1 = ...
		
		if typeof(var1) == "string" then
			error(debug.traceback(p1, var1), 3)
		else
			error(var1, 3)
		end
	end
	if coroutine.status(p0) ~= "dead" then
		error(debug.traceback(p0, "\nYielding is not allowed inside components or hooks.\n\nYielding in a component stalls React's scheduler, freezing the entire application until the yield completes.\nCheck the stack trace below to find the exact location of the yield.\n\nFor more details and how to fix this, see: go/react-yield-error\n"), 3)
	end
	return ...
end

return function(p1, ...)
	-- upvalues: resultHandler (ref)
	local thread = coroutine.create(p1)
	
	return resultHandler(thread, coroutine.resume(thread, ...))
end