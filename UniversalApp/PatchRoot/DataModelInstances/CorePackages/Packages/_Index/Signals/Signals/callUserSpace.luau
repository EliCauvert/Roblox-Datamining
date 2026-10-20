local SIGNALSVALIDATIONENABLED = _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__

local function handleNoYieldValidation(Thread, Resumed, ...)
	if not Resumed then
		local v1 = (...)
		
		if typeof(v1) == "string" then
			error(debug.traceback(Thread, v1), 2)
		else
			error(tostring(v1), 2)
		end
	end
	if coroutine.status(Thread) ~= "dead" then
		error(debug.traceback(Thread, "Attempted to yield!"), 2)
	end
	return ...
end

local function callWithValidation(Callback, ...)
	-- upvalues: handleNoYieldValidation (copy)
	local Thread = coroutine.create(Callback)
	
	return handleNoYieldValidation(Thread, coroutine.resume(Thread, ...))
end

local function callWithoutValidation(Callback, ...)
	return Callback(...)
end

return if SIGNALSVALIDATIONENABLED then callWithValidation else callWithoutValidation