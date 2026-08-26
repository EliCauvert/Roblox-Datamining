local function handleNoYieldValidation(p1, p2, ...)
	if not p2 then
		local var1 = ...
		
		if typeof(var1) == "string" then
			error(debug.traceback(p1, var1), 2)
		else
			error(tostring(var1), 2)
		end
	end
	if coroutine.status(p0) ~= "dead" then
		error(debug.traceback(p0, "Attempted to yield!"), 2)
	end
	return ...
end

return if _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__ then function(p1, ...)
	-- upvalues: handleNoYieldValidation (ref)
	local thread = coroutine.create(p1)
	
	return handleNoYieldValidation(thread, coroutine.resume(thread, ...))
end else function(p1, ...)
	return p1(...)
end