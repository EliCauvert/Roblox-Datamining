-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local function resultHandler(p0, p1, ...) --[[ line: 12 ]]
	if not p1 then
		error(debug.traceback(p0, ...), 2)
	end
	if coroutine.status(p0) ~= "dead" then
		error(debug.traceback(p0, "Attempted to yield inside changed event!"), 2)
	end
	return ...
end

return function(p2, ...) --[[ line: 25 | named "NoYield" ]]
	-- upvalues: resultHandler (ref)
	local thread = coroutine.create(p2)
	
	return resultHandler(thread, coroutine.resume(thread, ...))
end