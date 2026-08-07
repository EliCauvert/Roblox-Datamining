-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 9 | named "getTestIdTag" ]]
	return if p0 == nil then nil elseif p1 then `data-testid={p0}--{p1}` else `data-testid={p0}`
end