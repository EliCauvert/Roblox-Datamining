-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 | named "createGetFString" ]]
	local ok, status = pcall(function() --[[ line: 2 ]]
		-- upvalues: p0 (ref), p1 (ref)
		game:DefineFastString(p0, p1)
	end)
	
	return if ok or not status:match("The current thread cannot call") then function() --[[ line: 12 ]]
		-- upvalues: p0 (ref)
		return game:GetFastString(p0)
	end else function() --[[ line: 7 ]]
		-- upvalues: p1 (ref)
		return p1
	end
end