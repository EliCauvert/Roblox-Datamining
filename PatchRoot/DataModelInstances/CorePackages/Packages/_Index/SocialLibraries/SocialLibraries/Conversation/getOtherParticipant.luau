-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:24 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 ]]
	local localUserId = p0.LocalUserId
	
	for i, v in ipairs(p1) do
		if v ~= localUserId then
			return v
		end
	end
end