-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "createGetFFlag" ]]
	local ok, status = pcall(function() --[[ line: 2 ]]
		-- upvalues: p0 (ref), p1 (ref)
		game:DefineFastFlag(p0, p1 or false)
	end)
	
	return if ok or not status:match("The current thread cannot call") then function() --[[ line: 13 ]]
		-- upvalues: p0 (ref)
		return game:GetFastFlag(p0)
	end else function() --[[ line: 7 ]]
		-- upvalues: p0 (ref)
		return p0:match("^Debug") == nil
	end
end