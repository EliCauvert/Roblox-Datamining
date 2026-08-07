-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "validateRefs" ]]
	for i, v in p0 do
		if v.current == nil then
			return false
		end
	end
	return true
end