-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local object = require(script.Parent.LuauPolyfill).Object
local t = {}
object.assign(t, require(script["merge-resolvers"]))
object.assign(t, require(script["typedefs-mergers"]))
object.assign(t, require(script.extensions))

return t