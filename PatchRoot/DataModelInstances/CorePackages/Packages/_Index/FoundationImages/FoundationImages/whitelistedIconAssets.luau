-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:33 2026 Pacific Standard Time.

local t = {}

for i, v in string.split(require(script.Parent.Flags).FoundationImagesWhitelistedIconAssets, ",") do
	t[v] = true
end
return t