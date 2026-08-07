-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	local thread = coroutine.create(p0)
	
	return (function(p1, p2, ...) --[[ line: 2 ]]
		return if p2 then if coroutine.status(p1) == "dead" then ... else nil else nil
	end)(thread, coroutine.resume(thread))
end