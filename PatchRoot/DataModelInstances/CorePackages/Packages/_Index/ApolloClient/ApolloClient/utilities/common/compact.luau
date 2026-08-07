-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local t = {}
local object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object

function t.compact(...) --[[ line: 13 ]]
	-- upvalues: object (ref)
	return object.assign({}, ...)
end

return t