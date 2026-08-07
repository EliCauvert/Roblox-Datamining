-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, ...) --[[ line: 22 | named "pipe" ]]
	local var0 = select("#", ...)
	
	if var0 == 0 then
		return p0
	end
	local list = { ... }
	
	return function(...) --[[ line: 28 ]]
		-- upvalues: p0 (ref), var0 (ref), list (ref)
		local list_1 = { p0(...) }
		
		for i = 1, var0 do
			list_1 = { list[i](unpack(list_1)) }
		end
		return unpack(list_1)
	end
end