-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:21 2026 Pacific Standard Time.

local function handleNoYieldValidation(p0, p1, ...) --[[ line: 3 ]]
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

return if _G.__SIGNALS_VALIDATION_ENABLED__ or _G.__DEV__ then function(p3, ...) --[[ line: 20 | named "callWithValidation" ]]
	-- upvalues: handleNoYieldValidation (ref)
	local thread = coroutine.create(p3)
	
	return handleNoYieldValidation(thread, coroutine.resume(thread, ...))
end else function(p2, ...) --[[ line: 25 | named "callWithoutValidation" ]]
	return p2(...)
end