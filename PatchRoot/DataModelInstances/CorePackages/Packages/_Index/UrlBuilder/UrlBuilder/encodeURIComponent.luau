-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:06 2026 Pacific Standard Time.

local function formatCharacter(p0) --[[ line: 1 ]]
	return string.format("%%%02X", p0:byte(1, 1))
end

return function(p1) --[[ line: 5 ]]
	-- upvalues: formatCharacter (ref)
	return p1:gsub("[^%w_%-%!%.%~%*%'%(%)]", formatCharacter)
end