local function resultHandler(p0, p1, ...)
	if not p1 then
		local var1 = ...
		
		if typeof(var1) == "string" then
			error(debug.traceback(p0, var1), 3)
		else
			error(var1, 3)
		end
	end
	if coroutine.status(p0) ~= "dead" then
		error(debug.traceback(p0, "\nYielding is not allowed inside components or hooks.\n\nYielding in a component stalls React's scheduler, freezing the entire application until the yield completes.\nCheck the stack trace below to find the exact location of the yield.\n\nFor more details and how to fix this, see: go/react-yield-error\n"), 3)
	end
	return ...
end

return function(p2, ...)
	-- upvalues: resultHandler (ref)
	local thread = coroutine.create(p2)
	
	return resultHandler(thread, coroutine.resume(thread, ...))
end