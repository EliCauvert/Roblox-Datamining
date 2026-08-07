-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 15 | named "safelyAccessProperty" ]]
	local ok, status = pcall(function() --[[ line: 16 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return p0[p1]
	end)
	
	return if ok then status else p2
end