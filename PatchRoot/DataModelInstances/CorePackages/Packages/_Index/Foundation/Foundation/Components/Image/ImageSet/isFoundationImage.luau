-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 | named "isFoundationImage" ]]
	return p0 ~= nil and (p0 ~= "" and p0:match("^%w+://.*$") == nil)
end