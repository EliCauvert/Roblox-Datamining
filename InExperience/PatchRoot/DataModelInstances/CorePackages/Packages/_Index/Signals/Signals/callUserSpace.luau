local function handleNoYieldValidation(p0, p1, ...)
	if not p1 then
		local var1 = ...
		
		if typeof(var1) == "string" then
			error(debug.traceback(p0, var1), 2)
		else
			error(tostring(var1), 2)
		end
	end
	if coroutine.status(p0) ~= "dead" then
		error(debug.traceback(p0, "Attempted to yield!"), 2)
	end
	return ...
end

return if _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__ then function(p3, ...)
	-- upvalues: handleNoYieldValidation (ref)
	local thread = coroutine.create(p3)
	
	return handleNoYieldValidation(thread, coroutine.resume(thread, ...))
end else function(p2, ...)
	return p2(...)
end