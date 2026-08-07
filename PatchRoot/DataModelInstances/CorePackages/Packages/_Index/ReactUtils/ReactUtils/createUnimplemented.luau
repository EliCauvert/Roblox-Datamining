-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

return function(p0) --[[ line: 2 | named "createUnimplemented" ]]
	return function() --[[ line: 3 ]]
		-- upvalues: p0 (ref)
		error(`Calling unimplemented function {p0}`)
	end
end