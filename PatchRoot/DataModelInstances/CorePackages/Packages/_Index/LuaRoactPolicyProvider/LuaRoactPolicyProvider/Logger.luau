-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:43 2026 Pacific Standard Time.

local lumberyakModule = require(script.Parent.Parent.Lumberyak)

return if game:DefineFastFlag("RoactPolicyLoggerName", false) then lumberyakModule.Logger.new(nil, "LuaRoactPolicyProvider") else lumberyakModule.Logger.new()