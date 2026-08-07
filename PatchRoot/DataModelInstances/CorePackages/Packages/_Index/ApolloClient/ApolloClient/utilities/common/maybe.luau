-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

return {
	maybe = function(p0) --[[ line: 10 ]]
		local _, status, var0 = xpcall(function() --[[ line: 12 ]]
			-- upvalues: p0 (ref)
			return p0(), true
		end, function() --[[ line: 14 ]] end)
		
		return if var0 then status else nil
	end
}